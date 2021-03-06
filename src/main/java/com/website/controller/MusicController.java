package com.website.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.website.entites.*;
import com.website.model.Message;
import com.website.model.MusicSong;
import com.website.service.WebSiteMusicService;
import com.website.utils.ConstantClass;
import com.website.utils.InternetUtil;
import com.website.utils.NeteaseMusicUtils;
import com.website.utils.Netease_AES;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.*;

@Controller
@RequestMapping("music")
public class MusicController {
    @Autowired
    private WebSiteMusicService musicService;
    @Autowired
    private JedisPool jedisPool;

    /**
     * 进入搜索界面
     *
     * @return
     */
    @RequestMapping("searchView")
    public String entrySearch() {
        return "/music/search";
    }

    @RequestMapping(value = "openMV")
    public String openMV(Integer mvId, Map<String, Object> map) {
        if (mvId == null || mvId == 0) {
            map.put("errorMessage", "缺少参数!");
            return "/music/player/player";
        }
        NeteaseMusicMvModel mvModel = NeteaseMusicUtils.getMvModel(mvId);
        int code = mvModel.getCode();
        if (code != 200) {
            map.put("errorMessage", "查询失败:" + code);
            return "/music/player/player";
        }
        if (mvModel.getData() == null) {
            map.put("errorMessage", "查询失败");
            return "/music/player/player";
        }
        map.put("movie", mvModel.getData());
        return "/music/player/player";
    }

    /**
     * 根据歌曲名搜索MV
     *
     * @return
     */
    @RequestMapping(value = "mvsearch")
    public String searchMV(Integer pageNum, String songsName,
                           Map<String, Object> map) {
        if (songsName == null || "".equals(songsName)) {
            map.put("errorMessage", "查询失败:没有找到参数");
            return "/music/mvlist";
        }
        if (pageNum == null) {
            pageNum = 0;
        }
        if (pageNum < 0) {
            pageNum = 0;
        }
        Jedis jedis =
                jedisPool.getResource();
        String s = jedis.get(songsName + ":" + pageNum);
        NeteaseMusicMVCode code = null;
        if (s == null) {
            //说明缓存不存在
            code = NeteaseMusicUtils.searchMv(
                    getURLEncoderString(songsName), 15, 1004, 15 * pageNum);
            jedis.set(songsName + ":" + pageNum, JSON.toJSONString(code));
            jedis.expire(songsName + ":" + pageNum, ConstantClass.MUSIC_TIME_DELAY);
        } else {
            //存在的话直接就返回数据库获取的内容
            code = JSON.parseObject(s, NeteaseMusicMVCode.class);
        }
        jedis.close();
        if (code != null) {
            int code2 = code.getCode();
            if (code2 != 200) {
                map.put("errorMessage", "查询失败:" + code2);
                return "/music/mvlist";
            }
            if (code.getResult() == null) {
                map.put("errorMessage", "查询结果为空!");
                return "/music/mvlist";
            }
            map.put("lists", code.getResult().getMvs());
            map.put("songCount", code.getResult().getMvCount());
            map.put("pageNum", pageNum);
            map.put("songsName", songsName);
        } else {
            map.put("errorMessage", "查询为空!");
        }
        return "/music/mvlist";
    }

    /**
     * 根据歌曲名和名字查询
     *
     * @throws UnsupportedEncodingException
     */
    @RequestMapping(value = "search")
    public String search(Integer pageNum, String songsName,
                         Map<String, Object> map) throws UnsupportedEncodingException {
        if (songsName == null || "".equals(songsName)) {
            map.put("errorMessage", "查询失败:没有找到参数");
            return "/music/list";
        }
        if (pageNum == null) {
            pageNum = 0;
        }
        if (pageNum < 0) {
            pageNum = 0;
        }
        Jedis jedis =
                jedisPool.getResource();
        String s = jedis.get(songsName + "_music:" + pageNum);
        NeteaseMusic searchMusic = null;
        if (s == null) {
            searchMusic = NeteaseMusicUtils.SearchMusic(
                    getURLEncoderString(songsName), 15, 1, 15 * pageNum);
            jedis.set(songsName + "_music:" + pageNum, JSON.toJSONString(searchMusic));
            jedis.expire(songsName + "_music:" + pageNum, ConstantClass.MUSIC_TIME_DELAY);
        } else {
            searchMusic = JSON.parseObject(s, NeteaseMusic.class);
        }
        jedis.close();
        map.put("errorMessage", "");
        if (searchMusic != null) {
            int code = searchMusic.getCode();
            if (searchMusic.getResult() == null) {
                map.put("errorMessage", "查询结果为空!");
                return "/music/list";
            }
            if (code == 200) {
                map.put("lists", searchMusic.getResult().getSongs());
                map.put("songCount", searchMusic.getResult().getSongCount());
                map.put("pageNum", pageNum);
                map.put("songsName", songsName);
            } else {
                map.put("errorMessage", "查询失败:" + code);
            }
        } else {
            map.put("errorMessage", "查询为空!");
        }
        return "/music/list";
    }

    /**
     * URL 转码
     *
     * @return String
     * @author lifq
     * @date 2015-3-17 下午04:10:28
     */
    public static String getURLEncoderString(String str) {
        String result = "";
        if (null == str) {
            return "";
        }
        try {
            result = java.net.URLEncoder.encode(str, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 进入音乐主界面!
     *
     * @return
     */
    @RequestMapping("playMusic")
    public String openMusic(Map<String, Object> map, String id, @RequestParam(required = false) Integer rate) {
        Jedis jedis = jedisPool.getResource();
        String lyricsById = jedis.get("lyricsById:" + id);
        if (lyricsById == null) {
            lyricsById = NeteaseMusicUtils.getLyricsById(id);
            if (lyricsById == null) {
                return "redirect:/404.jsp";
            }
            jedis.set("lyricsById:" + id, lyricsById);
        }
        String musicResult = jedis.get("musicResult:" + id);
        if (musicResult == null) {
            NeteaseMusicResult musicResult1 = NeteaseMusicUtils.Cloud_Music_MusicInfoAPI(id, id);
            map.put("songs", musicResult1.getSongs());
            jedis.set("musicResult:" + id, JSON.toJSONString(musicResult1));
            jedis.expire("musicResult:" + id, 60 * 60 * 24);
        } else {
            NeteaseMusicResult parse = JSON.parseObject(musicResult, NeteaseMusicResult.class);
            map.put("songs", parse.getSongs());
        }
        String rateParam = null;
        if (rate == null) {
            //判断码率
            rateParam = "320000";
        } else if (rate == 128000) {
            rateParam = "128000";
        } else if (rate == 192000) {
            rateParam = "192000";
        } else {
            rateParam = "320000";
        }
        String first_param = "{\"ids\":\"[" + id + "]\",\"br\":" + rateParam + ",\"csrf_token\":\"\"}";
        try {
            String realSongUrl = jedis.get("realSongUrl:" + rateParam + id);
            if (realSongUrl == null) {
                realSongUrl = getRealSongUrl("params=" + URLEncoder.encode(Netease_AES.get_params(first_param), "UTF-8") + "&encSecKey="
                        + Netease_AES.get_encSecKey());
                jedis.set("realSongUrl:" + id, realSongUrl);
                jedis.expire("realSongUrl:" + id, 60 * 60 * 12);
            }
            JSONObject data = (JSONObject) JSON.parseObject(realSongUrl).getJSONArray("data").get(0);
            String url = (String) data.get("url");
            map.put("muisc_url", url);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            jedis.close();
        }
        if (lyricsById != null && !"".equals(lyricsById)) {
            String[] split = lyricsById.split("\n");
            List<String> asList = Arrays.asList(split);
            map.put("lyricsList", asList);
        }
        map.put("lyrics", lyricsById);
        return "/music/songsplayer/player";
    }


    //    @RequiresRoles(value = {"super_admin", "admin", "normal", "ban_say"}, logical = Logical.OR)
    @RequestMapping(value = "getUrlFormMusicId", method = RequestMethod.GET)
    @ResponseBody
    public void getMusicTest(HttpServletResponse response, @RequestParam(required = true) String params, Integer rate) throws IOException {
        String rateParam = null;
        Jedis jedis = jedisPool.getResource();
        if (rate == null) {
            //判断码率
            rateParam = "320000";
        } else if (rate == 128000) {
            rateParam = "128000";
        } else if (rate == 192000) {
            rateParam = "192000";
        } else {
            rateParam = "320000";
        }
        String realSongUrl = jedis.get("realSongUrl:" + rateParam + params);
        if (realSongUrl == null) {
            String first_param = "{\"ids\":\"[" + params + "]\",\"br\":" + rateParam + ",\"csrf_token\":\"\"}";
            try {
                realSongUrl = getRealSongUrl("params=" + URLEncoder.encode(Netease_AES.get_params(first_param), "UTF-8") + "&encSecKey="
                        + Netease_AES.get_encSecKey());
            } catch (Exception e) {
                e.printStackTrace();
            }
            jedis.set("realSongUrl:" + rateParam + params, realSongUrl);
            jedis.expire("realSongUrl:" + rateParam + params, 60 * 60 * 12);
        }
        jedis.close();
        JSONObject data = (JSONObject) JSON.parseObject(realSongUrl).getJSONArray("data").get(0);
        String url = (String) data.get("url");
        response.setContentType("audio/mp3");
        ServletOutputStream outputStream = response.getOutputStream();
        URL musicUrl = new URL(url);
        HttpURLConnection conn = (HttpURLConnection) musicUrl.openConnection();
        BufferedInputStream bis = new BufferedInputStream(conn.getInputStream());
        int len = -1;
        byte[] bytes = new byte[bis.available()];
        while ((len = bis.read(bytes)) != -1) {
            outputStream.write(bytes, 0, len);
        }
        bis.close();
        outputStream.close();
    }

    @RequestMapping(value = "getLrcByMusicId", method = RequestMethod.GET)
    public void getLrcTest(@RequestParam(required = true) String params, HttpServletResponse response) {
        Jedis jedis = jedisPool.getResource();
        String lyric = jedis.get("lyricsById:" + params);
        if (lyric == null) {
            lyric = NeteaseMusicUtils.getLyricsById(params);
            jedis.set("lyricsById:" + params, lyric);
        }
        jedis.close();
        response.setContentType("text/plain");
        try {
            response.setCharacterEncoding("utf-8");
            ServletOutputStream outputStream = response.getOutputStream();
            outputStream.write(lyric.getBytes());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    /**
     * 获取用户的表单
     *
     * @return
     */
//    @RequiresRoles(value = {"super_admin", "admin", "normal", "ban_say"}, logical = Logical.OR)
    @RequiresUser
    @RequestMapping(value = "/getSongsTable", method = RequestMethod.GET)
    @ResponseBody
    public String getUserSongsTable(Integer page, HttpSession session) {
        WebsiteUser user = (WebsiteUser) session.getAttribute("currentUser");
        ArrayList<WebsiteMusic> list = null;
        if (page == null) {
            //那就说明是要获取全部的歌曲
            list = musicService.findAll(user.getUserId());
        } else {
            //说明获取分页歌曲
            list = musicService.find(page, user.getUserId());
        }
        ArrayList<MusicSong> lists = new ArrayList<MusicSong>();
        if (list != null && list.size() > 0) {
            //说明添加了新歌曲
            Iterator<WebsiteMusic> iterator = list.iterator();
            while (iterator.hasNext()) {
                WebsiteMusic param = iterator.next();
                NeteaseMusicResult musicResult = NeteaseMusicUtils.Cloud_Music_MusicInfoAPI(param.getWebsiteMusicId() + "", param.getWebsiteMusicId() + "");
                MusicSong song = new MusicSong(musicResult.getSongs().get(0).getName(), musicResult.getSongs().get(0).getArtists().get(0).getName(), "/music/getUrlFormMusicId?params=" + param.getWebsiteMusicId(), musicResult.getSongs().get(0).getAlbum().getPicUrl(), "/music/getLrcByMusicId?params=" + param.getWebsiteMusicId());
                lists.add(song);
            }
        } else {
            //没添加。给固定的几首歌
            NeteaseMusicResult musicResult = NeteaseMusicUtils.Cloud_Music_MusicInfoAPI(31234186 + "", 31234186 + "");
            MusicSong song = new MusicSong(musicResult.getSongs().get(0).getName(), musicResult.getSongs().get(0).getArtists().get(0).getName(), "/music/getUrlFormMusicId?params=31234186", musicResult.getSongs().get(0).getAlbum().getPicUrl(), "/music/getLrcByMusicId?params=31234186");
            NeteaseMusicResult musicResult2 = NeteaseMusicUtils.Cloud_Music_MusicInfoAPI(36270426 + "", 36270426 + "");
            MusicSong song2 = new MusicSong(musicResult2.getSongs().get(0).getName(), musicResult2.getSongs().get(0).getArtists().get(0).getName(), "/music/getUrlFormMusicId?params=36270426", musicResult2.getSongs().get(0).getAlbum().getPicUrl(), "/music/getLrcByMusicId?params=36270426");
            NeteaseMusicResult musicResult3 = NeteaseMusicUtils.Cloud_Music_MusicInfoAPI(36103237 + "", 36103237 + "");
            MusicSong song3 = new MusicSong(musicResult3.getSongs().get(0).getName(), musicResult3.getSongs().get(0).getArtists().get(0).getName(), "/music/getUrlFormMusicId?params=36103237", musicResult3.getSongs().get(0).getAlbum().getPicUrl(), "/music/getLrcByMusicId?params=36103237");
            NeteaseMusicResult musicResult4 = NeteaseMusicUtils.Cloud_Music_MusicInfoAPI(29450548 + "", 29450548 + "");
            MusicSong song4 = new MusicSong(musicResult4.getSongs().get(0).getName(), musicResult4.getSongs().get(0).getArtists().get(0).getName(), "/music/getUrlFormMusicId?params=29450548", musicResult4.getSongs().get(0).getAlbum().getPicUrl(), "/music/getLrcByMusicId?params=29450548");
            lists.add(song);
            lists.add(song2);
            lists.add(song3);
            lists.add(song4);
        }
        return JSON.toJSONString(lists);
    }


    /**
     * 往自己表单里提交歌曲
     *
     * @return
     */
//    @RequiresRoles(value = {"super_admin", "admin", "normal", "ban_say"}, logical = Logical.OR)
    @RequiresUser
    @RequestMapping(value = "addUserSongsTable", method = RequestMethod.POST)
    @ResponseBody
    public String addUserSongsTable(@RequestParam(required = true) String param, HttpSession session) {
        WebsiteUser user = (WebsiteUser) session.getAttribute("currentUser");
        WebsiteMusic music = new WebsiteMusic();
        music.setWebsiteUserId(user.getUserId());
        music.setWebsiteMusicId(Long.valueOf(param));
        boolean b = musicService.addMusic(music);
        if (b) {
            return JSON.toJSONString(new Message(200, "addsuccess", null, null, null));
        } else {
            return JSON.toJSONString(new Message(500, "addfail", null, null, null));
        }
    }

    /**
     * 音乐下载请求
     *
     * @param id
     * @param rate
     */
    @RequestMapping(value = "musicDownload", method = RequestMethod.GET)
    public String musicDownload(String id, @RequestParam(required = false) Integer rate) {
        String rateParam = null;
        if (rate == null) {
            //判断码率
            rateParam = "320000";
        } else if (rate == 128000) {
            rateParam = "128000";
        } else if (rate == 192000) {
            rateParam = "192000";
        } else {
            rateParam = "320000";
        }
        String first_param = "{\"ids\":\"[" + id + "]\",\"br\":" + rateParam + ",\"csrf_token\":\"\"}";
        try {
            String realSongUrl = getRealSongUrl("params=" + URLEncoder.encode(Netease_AES.get_params(first_param), "UTF-8") + "&encSecKey="
                    + Netease_AES.get_encSecKey());
            JSONObject data = (JSONObject) JSON.parseObject(realSongUrl).getJSONArray("data").get(0);
            String url = (String) data.get("url");
            System.out.println(url);
            return "redirect:" + url;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/music/search";
    }


    public static String getRealSongUrl(String param) throws Exception {
        URL url = new URL("http://music.163.com/weapi/song/enhance/player/url?csrf_token=");
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Referer", "http://music.163.com/");
        conn.setRequestProperty("Host", "music.163.com");
        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
        conn.setRequestProperty("Charset", "UTF-8");
        conn.setRequestProperty("Accept-Language", "q=0.8,zh-CN;q=0.6,zh;q=0.2");
        conn.setRequestProperty("Cookie", "os=uwp;");
        conn.setDoInput(true);
        conn.setDoOutput(true);
        conn.connect();
        DataOutputStream outputStream = new DataOutputStream(conn.getOutputStream());
        outputStream.write(param.getBytes());
        outputStream.flush();
        outputStream.close();
        BufferedInputStream inputStream = new BufferedInputStream(conn.getInputStream());
        byte[] bytes = new byte[512];
        int len = -1;
        StringBuilder sb = new StringBuilder();
        while ((len = inputStream.read(bytes)) != -1) {
            sb.append(new String(bytes, 0, len));
        }
        inputStream.close();
        return sb.toString();
    }


    /**
     * 获取到歌曲表单
     */
    @RequestMapping(value = "getSongsForm", method = RequestMethod.GET)
    @ResponseBody
    public String getSongsForm() {
        Jedis jedis = jedisPool.getResource();
        String getSongsForm = jedis.get("getSongsForm");
        if (getSongsForm == null) {
            getSongsForm = InternetUtil.get("http://music.163.com/api/user/playlist/?offset=0&limit=1001&uid=2769317");
            jedis.set("getSongsForm", getSongsForm);
            jedis.expire("getSongsForm", ConstantClass.MUSIC_TIME_DELAY);
        }
        jedis.close();
        return getSongsForm;
    }

    /**
     * 获取表单的详细数据
     *
     * @return
     */
    @RequestMapping(value = "getSongsFormDetail", method = RequestMethod.GET)
    @ResponseBody
    public String getSongsFormDetail(@RequestParam(required = true) Long id) {
        Jedis jedis = jedisPool.getResource();
        String s = jedis.get("getSongsFormDetail:" + id);
        if (s == null) {
            s = InternetUtil.get("http://music.163.com/api/playlist/detail?id=" + id);
            jedis.set("getSongsFormDetail:" + id, s);
            jedis.expire("getSongsFormDetail:" + id, 60 * 60 * 24);
        }
        jedis.close();
        return s;
    }

    @ExceptionHandler(org.apache.shiro.authz.UnauthorizedException.class)
    public String shiroException2() {
        return "redirect:/401.jsp";
    }

}
