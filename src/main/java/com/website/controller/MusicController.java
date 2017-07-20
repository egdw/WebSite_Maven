package com.website.controller;

import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.website.entites.NeteaseMusic;
import com.website.entites.NeteaseMusicMVCode;
import com.website.entites.NeteaseMusicMvModel;
import com.website.entites.NeteaseMusicResult;
import com.website.utils.NeteaseMusicUtils;

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
	 * @return
	 */
	@RequestMapping("playMusic")
	public static String openMusic(Map<String, Object> map,String id){
		String lyricsById = NeteaseMusicUtils.getLyricsById(id);
		NeteaseMusicResult musicResult = NeteaseMusicUtils.Cloud_Music_MusicInfoAPI(id, id);
		System.out.println(musicResult);
		map.put("songs", musicResult.getSongs());
		if(lyricsById!=null && !lyricsById.isEmpty()){
			String[] split = lyricsById.split("\n");
			List<String> asList = Arrays.asList(split);
			map.put("lyricsList", asList);
		}
		map.put("lyrics", lyricsById);
		return "/music/songsplayer/player";
	}
}
