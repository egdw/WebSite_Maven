package com.website.controller;

import com.alibaba.fastjson.JSON;
import com.website.model.Message;
import com.website.utils.ChatConstant;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by hdy on 2017/7/27.
 * 聊天控制器
 */
@RequestMapping("/chat")
@Controller
public class ChatController {

    @RequestMapping(value = "/size", produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String getSize() {
        Message message = new Message(200, ChatConstant.getSessionSize() + "", "尊贵的服务器", "everyOne", "null");
        return JSON.toJSONString(message);
    }

}
