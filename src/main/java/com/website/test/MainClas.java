package com.website.test;

import com.alibaba.fastjson.JSON;
import com.website.model.Movie;
import com.website.model.MovieTop;
import com.website.model.MovieType;
import com.website.utils.MovieUtils;
import com.website.utils.ParseUtils;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/**
 * Created by hdy on 2017/8/23.
 */
public class MainClas {
    public static void main(String[] args) {
        Map<String, String> map = ParseUtils.getType();
        String s = JSON.toJSONString(map);
        Map map2 = JSON.parseObject(s, Map.class);
    }
}
