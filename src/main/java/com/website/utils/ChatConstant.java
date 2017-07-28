package com.website.utils;

import com.alibaba.fastjson.JSON;
import com.website.model.Message;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * Created by hdy on 2017/7/25.
 */
public class ChatConstant {
    private static Map<String, WebSocketSession> sessions = new HashMap<String, WebSocketSession>();

    public static void addSession(String name, WebSocketSession session) {
        sessions.put(name, session);
    }

    //通过用户名获取session对象
    public static WebSocketSession getSessionById(String name) {
        WebSocketSession session = sessions.get(name);
        return session;
    }

    //通过session对象获取用户名
    public static String getSessionByClass(WebSocketSession session) {
        Iterator<Map.Entry<String, WebSocketSession>> iterator =
                sessions.entrySet().iterator();
        String name = null;
        while (iterator.hasNext()) {
            Map.Entry<String, WebSocketSession> next = iterator.next();
            if (session == next.getValue()) {
                //说明是相同的
                name = next.getKey();
                break;
            }
        }
        return name;
    }

    //判断name是否已经存在
    public static boolean isExist(String name) {
        WebSocketSession session = sessions.get(name);
        if (session == null) {
            return false;
        }
        return true;
    }

    //删除session对象
    public static boolean removeSession(WebSocketSession session) {
        Iterator<Map.Entry<String, WebSocketSession>> iterator =
                sessions.entrySet().iterator();
        boolean flag = false;
        while (iterator.hasNext()) {
            Map.Entry<String, WebSocketSession> next = iterator.next();
            if (session == next.getValue()) {
                //说明是相同的
                String name = next.getKey();
                sessions.remove(name);
                flag = true;
                break;
            }
        }
        return flag;
    }

    //获取session在线人数
    public static int getSessionSize() {
        return sessions.size();
    }


    //向所有列表的对象发送转发的信息
    public static void sendMessage(String name, String message) {
        Iterator<Map.Entry<String, WebSocketSession>> iterator =
                sessions.entrySet().iterator();
        while (iterator.hasNext()) {
            Map.Entry<String, WebSocketSession> next = iterator.next();
            if (next.getKey().equals(name)) {
                //如果用户名相同.说明就是表示发送者自身.就不进行发送.
            } else {
                //进行转发的操作
                try {
                    next.getValue().sendMessage(new TextMessage(JSON.toJSONString(new Message(200, message, name, "everyone", SimpleDateFormat.getInstance().format(new Date())))));
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }


    //向单个用户转发
    public static void sendMessageFriend(String to, String message) {
        Iterator<Map.Entry<String, WebSocketSession>> iterator =
                sessions.entrySet().iterator();
        while (iterator.hasNext()) {
            Map.Entry<String, WebSocketSession> next = iterator.next();
            if (next.getKey().equals(to)) {
                //如果用户名相同.说明就是表示接受者.进行发送.
                try {
                    next.getValue().sendMessage(new TextMessage(message));
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
