package com.website.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.website.entites.*;
import com.website.model.Message;
import com.website.model.MusicSong;
import com.website.service.WebSiteMusicService;
import com.website.utils.NeteaseMusicUtils;
import com.website.utils.Netease_AES;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

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
        NeteaseMusicMVCode code = NeteaseMusicUtils.searchMv(
                getURLEncoderString(songsName), 15, 1004, 15 * pageNum);
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
        NeteaseMusic searchMusic = NeteaseMusicUtils.SearchMusic(
                getURLEncoderString(songsName), 15, 1, 15 * pageNum);
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
    public static String openMusic(Map<String, Object> map, String id, @RequestParam(required = false) Integer rate) {
        String lyricsById = NeteaseMusicUtils.getLyricsById(id);
        NeteaseMusicResult musicResult = NeteaseMusicUtils.Cloud_Music_MusicInfoAPI(id, id);
        System.out.println(musicResult);
        map.put("songs", musicResult.getSongs());
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
            map.put("muisc_url", url);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (lyricsById != null && !"".equals(lyricsById)) {
            String[] split = lyricsById.split("\n");
            List<String> asList = Arrays.asList(split);
            map.put("lyricsList", asList);
        }
        map.put("lyrics", lyricsById);
        return "/music/songsplayer/player";
    }


    /**
     * 根据音乐id获取真实地址
     * <p>
     * 未登录用户不能使用
     *
     * @param params id值
     * @param rate   码率
     * @return
     */
//    @RequiresRoles(value = {"super_admin","admin","normal","ban_say"}, logical = Logical.OR)
//    @RequestMapping(value = "getUrlFormMusicId", method = RequestMethod.GET)
//    @ResponseBody
    public String getUrlFormMusicId(@RequestParam(required = true) String params, Integer rate) {
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
        String first_param = "{\"ids\":\"[" + params + "]\",\"br\":" + rateParam + ",\"csrf_token\":\"\"}";
        String realSongUrl = null;
        try {
            realSongUrl = getRealSongUrl("params=" + URLEncoder.encode(Netease_AES.get_params(first_param), "UTF-8") + "&encSecKey="
                    + Netease_AES.get_encSecKey());
        } catch (Exception e) {
            e.printStackTrace();
        }
        JSONObject data = (JSONObject) JSON.parseObject(realSongUrl).getJSONArray("data").get(0);
        String url = (String) data.get("url");
        return url;
    }

    //    @RequiresRoles(value = {"super_admin", "admin", "normal", "ban_say"}, logical = Logical.OR)
    @RequestMapping(value = "getUrlFormMusicId", method = RequestMethod.GET)
    @ResponseBody
    public void getMusicTest(HttpServletResponse response, @RequestParam(required = true) String params, Integer rate) throws IOException {
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
        String first_param = "{\"ids\":\"[" + params + "]\",\"br\":" + rateParam + ",\"csrf_token\":\"\"}";
        String realSongUrl = null;
        try {
            realSongUrl = getRealSongUrl("params=" + URLEncoder.encode(Netease_AES.get_params(first_param), "UTF-8") + "&encSecKey="
                    + Netease_AES.get_encSecKey());
        } catch (Exception e) {
            e.printStackTrace();
        }
        JSONObject data = (JSONObject) JSON.parseObject(realSongUrl).getJSONArray("data").get(0);
        String url = (String) data.get("url");
        response.setContentType("audio/mp3");
        ServletOutputStream outputStream = response.getOutputStream();
        URL musicUrl = new URL(url);
        HttpURLConnection conn = (HttpURLConnection) musicUrl.openConnection();
        BufferedInputStream bis = new BufferedInputStream(conn.getInputStream());
        int len = -1;
        byte[] bytes = new byte[1024];
        while ((len = bis.read(bytes)) != -1) {
            outputStream.write(bytes, 0, len);
//            outputStream.flush();
        }
        bis.close();
        outputStream.close();
    }

    @RequestMapping(value = "getLrcByMusicId", method = RequestMethod.GET)
    public void getLrcTest(@RequestParam(required = true) String params, HttpServletResponse response) {
        String lyric = NeteaseMusicUtils.getLyricsById(params);
        response.setContentType("text/plain");
        try {
            ServletOutputStream outputStream = response.getOutputStream();
            outputStream.write(lyric.getBytes());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 根据歌曲id获取歌词
     *
     * @param params 歌曲id
     * @return 歌词
     */
//    @RequiresRoles(value = {"super_admin","admin","normal","ban_say"}, logical = Logical.OR)
//    @RequestMapping(value = "getLrcByMusicId", method = RequestMethod.GET)
//    @ResponseBody
    public String getLrcByMusicId(@RequestParam(required = true) String params) {
        String lyric = NeteaseMusicUtils.getLyricsById(params);
        return lyric;
    }


    /**
     * 获取用户的表单
     *
     * @return
     */
    @RequiresRoles(value = {"super_admin", "admin", "normal", "ban_say"}, logical = Logical.OR)
    @RequestMapping(value = "/getSongsTable", method = RequestMethod.GET)
    @ResponseBody
    public String getUserSongsTable(Integer page, HttpSession session) {
        WebsiteUser user = (WebsiteUser) session.getAttribute("currentUser");
        ArrayList<WebSiteMusic> list = null;
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
            Iterator<WebSiteMusic> iterator = list.iterator();
            while (iterator.hasNext()) {
                WebSiteMusic param = iterator.next();
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
    @RequiresRoles(value = {"super_admin", "admin", "normal", "ban_say"}, logical = Logical.OR)
    @RequestMapping(value = "addUserSongsTable", method = RequestMethod.POST)
    @ResponseBody
    public String addUserSongsTable(@RequestParam(required = true) String param, HttpSession session) {
        WebsiteUser user = (WebsiteUser) session.getAttribute("currentUser");
        WebSiteMusic music = new WebSiteMusic();
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

    @ExceptionHandler(org.apache.shiro.authz.UnauthorizedException.class)
    public String shiroException2() {
        return "redirect:/401.jsp";
    }

}
