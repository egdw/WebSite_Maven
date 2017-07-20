package com.website.utils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.website.entites.NeteaseMusic;
import com.website.entites.NeteaseMusicMVCode;
import com.website.entites.NeteaseMusicMvModel;
import com.website.entites.NeteaseMusicResult;

/**
 * 网易云音乐接口类
 * 
 * @author hdy 这是我转载来的!!地址在 http://download.csdn.net/detail/qq_21265915/9670422
 */
public class NeteaseMusicUtils {

	public static NeteaseMusicMVCode searchMv(String s, int limit, int type,
			int offset) {
		String url = UrlConstants.CLOUD_MUSIC_API_SEARCH + "type=" + type
				+ "&s='" + s + "'&limit=" + limit + "&offset=" + offset;
		String request = InternetUtil.request(url);
		NeteaseMusicMVCode code = null;
		if (request != null && !request.isEmpty()) {
			code = JSON.parseObject(request, NeteaseMusicMVCode.class);
		}
		return code;
	}

	/**
	 * 根据歌曲ID获取歌词
	 * 
	 * @param id
	 * @return
	 */
	public static String getLyricsById(String id) {
		String url = UrlConstants.CLOUD_MUSIC_API_LYSIC + id
				+ "&lv=-1&kv=-1&tv=-1";
		String request = InternetUtil.request(url);
		if (request != null && !request.isEmpty()) {
			JSONObject parseObject = JSON.parseObject(request);
			JSONObject object = (JSONObject) parseObject.get("lrc");
			if (object == null) {
				return null;
			}
			String str = (String) object.get("lyric");
			return str;
		}
		return null;
	}

	public static NeteaseMusicMvModel getMvModel(Integer id) {
		String url = UrlConstants.CLOUD_MUSIC_API_MV_DETAIl + id + "&type=mp4";
		String request = InternetUtil.request(url);
		if (request != null && !request.isEmpty()) {
			NeteaseMusicMvModel parseObject = JSON.parseObject(request,
					NeteaseMusicMvModel.class);
			JSONObject object = JSON.parseObject(request);
			JSONObject object2 = (JSONObject) object.get("data");
			JSONObject object3 = (JSONObject) object2.get("brs");
			String bq = (String) object3.get("240");
			String lq = (String) object3.get("480");
			String mq = (String) object3.get("720");
			String hq = (String) object3.get("1080");
			parseObject.getData().getBrs().setBq(bq);
			parseObject.getData().getBrs().setLq(lq);
			parseObject.getData().getBrs().setMq(mq);
			parseObject.getData().getBrs().setHq(hq);
			return parseObject;
		}
		return null;
	}

	/**
	 * 网易音乐搜索API http://s.music.163.com/search/get/ 获取方式：GET 参数： src: lofter
	 * //可为空 type: 1 filterDj: true|false //可为空 s: //关键词 limit: 10 //限制返回结果数
	 * offset: 0 //偏移 callback: //为空时返回json，反之返回jsonp callback
	 * 
	 * @param s
	 * @param context
	 * @return 注意废数字才用‘’符号，要不不能用，否则出错！！
	 */
	public static NeteaseMusic SearchMusic(String s, int limit, int type,
			int offset) {
		String url = UrlConstants.CLOUD_MUSIC_API_SEARCH + "type=" + type
				+ "&s='" + s + "'&limit=" + limit + "&offset=" + offset;
		String request = InternetUtil.request(url);
		NeteaseMusic songs = null;
		if (request != null && !request.isEmpty()) {
			songs = JSON.parseObject(request, NeteaseMusic.class);
		}
		return songs;
	}

	/**
	 * 网易云音乐歌曲信息API
	 * 
	 * @param context
	 * @param id
	 *            歌曲id
	 * @param ids
	 *            用[]包裹起来的歌曲id 写法%5B %5D
	 * @return
	 */
	public static NeteaseMusicResult Cloud_Music_MusicInfoAPI(String id,
			String ids) {
		String url = UrlConstants.CLOUD_MUSIC_API_MUSICINGO + "id=" + id
				+ "&ids=%5B" + ids + "%5D";
		String request = InternetUtil.request(url);
		System.out.println(request);
		if (request != null) {
			NeteaseMusicResult parseObject = JSON.parseObject(request,
					NeteaseMusicResult.class);
			return parseObject;
		}
		return null;
	}

	/**
	 * 获取歌曲歌词的API URL：
	 * 
	 * GET http://music.163.com/api/song/lyric
	 * 
	 * 必要参数：
	 * 
	 * id：歌曲ID
	 * 
	 * lv：值为-1，我猜测应该是判断是否搜索lyric格式
	 * 
	 * kv：值为-1，这个值貌似并不影响结果，意义不明
	 * 
	 * tv：值为-1，是否搜索tlyric格式
	 * 
	 * @param context
	 * @param os
	 * @param id
	 */
	public static void Cloud_Muisc_getLrcAPI(String os, String id) {
		String url = UrlConstants.CLOUD_MUSIC_API_MUSICLRC + "os=" + os
				+ "&id=" + id + "&lv=-1&kv=-1&tv=-1";
		// RequestQueue requestQueue = InternetUtil.getmRequestqueue(context);
		// StringRequest straingRequest = new StringRequest(url,new
		// Response.Listener<String>(){
		// @Override
		// public void onResponse(String s){
		// try {
		// JSONObject json = new JSONObject(s);
		// Log.i("onResponse: ",json.toString());
		// } catch(JSONException e) {
		// e.printStackTrace();
		// }
		// }
		// },new Response.ErrorListener(){
		// @Override
		// public void onErrorResponse(VolleyError volleyError){
		// Log.i("onResponse: ",volleyError.toString());
		// }
		// });
		// requestQueue.add(straingRequest);
	}

	// public static JSONObject json = null;
	// public static JSONObject getInfoFromUrl_Volley(String url,Context
	// context)
	// {
	// json = null;
	// RequestQueue requestQueue = InternetUtil.getmRequestqueue(context);
	// StringRequest straingRequest = new StringRequest(url,new
	// Response.Listener<String>(){
	// @Override
	// public void onResponse(String s){
	// try {
	// json = new JSONObject(s);
	// Log.i("onResponse: ",json.toString());
	// } catch(JSONException e) {
	// e.printStackTrace();
	// }
	// }
	// },new Response.ErrorListener(){
	// @Override
	// public void onErrorResponse(VolleyError volleyError){
	// Log.i("onResponse: ",volleyError.toString());
	// }
	// });
	// requestQueue.add(straingRequest);
	// return json;
	// }
	public class UrlConstants {
		/**
		 * 云音乐搜索API网址
		 */
		// public static final String CLOUD_MUSIC_API_SEARCH =
		// "http://s.music.163.com/search/get/?";
		/**
		 * 通过mvID获取详细的信息
		 */
		public static final String CLOUD_MUSIC_API_MV_DETAIl = "http://music.163.com/api/mv/detail?id=";
		public static final String CLOUD_MUSIC_API_LYSIC = "http://music.163.com/api/song/lyric?os=pc&id=";
		public static final String CLOUD_MUSIC_API_SEARCH = "http://music.163.com/api/search/pc?";
		/**
		 * 歌曲信息API网址
		 */
		public static final String CLOUD_MUSIC_API_MUSICINGO = "http://music.163.com/api/song/detail/?";
		/**
		 * 获取歌曲的歌词
		 */
		public static final String CLOUD_MUSIC_API_MUSICLRC = "http://music.163.com/api/song/lyric?";
	}
}
