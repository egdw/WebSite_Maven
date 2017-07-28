package com.website.model;

/**
 * Created by hdy on 2017/7/25.
 * 用于在线聊天
 * 消息模型类
 */
public class Message {
    private int code;
    private String message;
    private String from;
    private String to;
    private String date;

    public Message(int code, String message, String from, String to, String date) {
        this.code = code;
        this.message = message;
        this.from = from;
        this.to = to;
        this.date = date;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Message{" +
                "code=" + code +
                ", message='" + message + '\'' +
                ", from='" + from + '\'' +
                ", to='" + to + '\'' +
                ", date='" + date + '\'' +
                '}';
    }
}
