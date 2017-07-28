package com.website.interceptor;

import com.alibaba.fastjson.JSON;
import com.website.utils.ChatConstant;
import com.website.model.Message;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.*;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

/**
 * Created by hdy on 2017/7/25.
 * WebSocket 握手拦截器
 * 常用的类有 TextWebSocketHandler 和 BinaryWebSocketHandler.
 * 这两个类继承自 AbstractWebSocketHandler,
 * message 类型进行了判断
 * 不同类型的消息进行了分发
 */
@Component
public class WebServiceHandler extends TextWebSocketHandler {

    //接受到文本信息时调用
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        super.handleTextMessage(session, message);
        byte[] bytes = message.asBytes();
        String s = ChatConstant.getSessionByClass(session);
        ChatConstant.sendMessage(ChatConstant.getSessionByClass(session), new String(bytes));
    }

    //基于二进制的信息
    //用户文件的传输
    @Override
    protected void handleBinaryMessage(WebSocketSession session, BinaryMessage message) {
        super.handleBinaryMessage(session, message);
    }

    //pong信息
    @Override
    protected void handlePongMessage(WebSocketSession session, PongMessage message) throws Exception {
        super.handlePongMessage(session, message);
    }


    //消息传送出错时调用
    @Override
    public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
        super.handleTransportError(session, exception);
        Message message = new Message(400, "消息传输错误", "尊贵的服务器", ChatConstant.getSessionByClass(session), SimpleDateFormat.getInstance().format(new Date()));
        session.sendMessage(new TextMessage(JSON.toJSONString(message)));
    }

    //与客户端关闭后调用
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        super.afterConnectionClosed(session, status);
//        System.out.println("afterConnectionClosed");
        ChatConstant.removeSession(session);
    }


    //与客户端完成连接后调用
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        super.afterConnectionEstablished(session);
//        System.out.println("afterConnectionEstablished");
//        System.out.println("getId:" + session.getId());
//        System.out.println("getLocalAddress:" + session.getLocalAddress().toString());
//        System.out.println("getTextMessageSizeLimit:" + session.getTextMessageSizeLimit());
//        System.out.println("getUri:" + session.getUri().toString());
//        System.out.println("getPrincipal:" + session.getPrincipal());
        String random = UUID.randomUUID().toString().substring(0, 6);
        ChatConstant.addSession(random, session);
        session.sendMessage(new TextMessage(JSON.toJSONString(new Message(301, random, "尊贵的服务器", random, "null"))));
    }

}
