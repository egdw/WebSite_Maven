package com.website.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.website.entites.NeteaseMusic;
import com.website.entites.NeteaseMusicMVCode;
import com.website.entites.NeteaseMusicMvModel;
import com.website.entites.NeteaseMusicResult;
import com.website.utils.NeteaseMusicUtils;
import com.website.utils.Netease_AES;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.BufferedInputStream;
import java.io.DataOutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("music")
public class MusicController {

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
        if (songsName == null || songsName.isEmpty()) {
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
            map.put("pageCount", pageNum);
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
        if (songsName == null || songsName.isEmpty()) {
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
                map.put("pageCount", pageNum);
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
        if (lyricsById != null && !lyricsById.isEmpty()) {
            String[] split = lyricsById.split("\n");
            List<String> asList = Arrays.asList(split);
            map.put("lyricsList", asList);
        }
        map.put("lyrics", lyricsById);
        return "/music/songsplayer/player";
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
}
