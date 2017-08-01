package com.website.model;

import com.alibaba.fastjson.annotation.JSONField;

/**
 * Created by hdy on 2017/7/31.
 * 用于多功能音乐播放器
 * title: 'あっちゅ～ま青春!',
 * author: '七森中☆ごらく部',
 * url: 'http://devtest.qiniudn.com/あっちゅ～ま青春!.mp3',
 * pic: 'http://devtest.qiniudn.com/あっちゅ～ま青春!.jpg',
 * lrc: 'あっちゅ～ま青春!.lrc'
 */
public class MusicSong {
    @JSONField(ordinal = 1)
    private String title;
    @JSONField(ordinal = 2)
    private String author;
    @JSONField(ordinal = 3)
    private String url;
    @JSONField(ordinal = 4)
    private String pic;
    @JSONField(ordinal = 5)
    private String lrc;


    public MusicSong(String title, String author, String url, String pic, String lrc) {
        this.title = title;
        this.author = author;
        this.url = url;
        this.pic = pic;
        this.lrc = lrc;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public String getLrc() {
        return lrc;
    }

    public void setLrc(String lrc) {
        this.lrc = lrc;
    }


    @Override
    public String toString() {
        return "MusicSong{" +
                "title='" + title + '\'' +
                ", author='" + author + '\'' +
                ", url='" + url + '\'' +
                ", pic='" + pic + '\'' +
                ", lrc='" + lrc + '\'' +
                '}';
    }
}
