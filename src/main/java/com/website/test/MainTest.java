package com.website.test;

import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ListIterator;

import org.junit.Test;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.website.entites.NeteaseMusic;
import com.website.entites.NeteaseMusicMvModel;
import com.website.utils.NeteaseMusicUtils;

public class MainTest {

	@Test
	public void test() {
		// NeteaseMusicUtils.Cloud_Music_MusicInfoAPI("456185073", "456185073");
		NeteaseMusic neteaseMusic = NeteaseMusicUtils.SearchMusic("告白气球", 10,
				1, 1006);
		System.out.println(neteaseMusic);
	}

	@Test
	public void test2() {
		getNeteaseMusicMvModelFormJson();
	}

	private NeteaseMusicMvModel getNeteaseMusicMvModelFormJson() {
		NeteaseMusicMvModel parseObject = JSON.parseObject(get(),NeteaseMusicMvModel.class);
		JSONObject object = JSON.parseObject(get());
		System.out.println(object);
		JSONObject object2 = (JSONObject) object.get("data");
		System.out.println(object2);
		JSONObject object3 = (JSONObject) object2.get("brs");
		System.out.println(object3);
//		System.out.println(parseObject);
		Object object4 = object3.get("1080");
		System.out.println(object4);
		return parseObject;
	}
	
	private String get(){
		try {
			URL url = new URL("http://music.163.com/api/mv/detail?id=5382080&type=mp4");
			HttpURLConnection openConnection = (HttpURLConnection) url
					.openConnection();
			openConnection.setRequestProperty("Cookie", "appver=1.5.0.75771");
			openConnection.setRequestProperty("Referer", "http://music.163.com/");
			openConnection.setRequestMethod("POST");
			openConnection.connect();
			//转换成utf-8.解决页面乱码问题
			InputStreamReader inputStreamReader = new InputStreamReader(
					openConnection.getInputStream(),"UTF-8");
			StringBuffer sb = new StringBuffer();
			char[] bytes = new char[1024];
			int len = -1;
			while ((len = inputStreamReader.read(bytes)) != -1) {
				sb.append(new String(bytes, 0, len));
			}
			inputStreamReader.close();
			String string = sb.toString();
			return string;
		} catch (MalformedURLException e) {
		} catch (IOException e) {
		}
		return null;
	}
}
