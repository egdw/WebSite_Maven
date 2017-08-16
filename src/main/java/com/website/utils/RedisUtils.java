package com.website.utils;

import redis.clients.jedis.Jedis;

/**
 * Created by hdy on 17-8-15.
 * Redis的简易工具类
 */
public class RedisUtils {

    /**
     * 判断字段是否存在
     * @param jedis 操作的redis对象
     * @param key 关键字
     * @return
     */
    public static boolean exist(Jedis jedis, String key) {
        String s = jedis.get(key);
        if (s == null) {
            return false;
        }
        return true;
    }

    /**
     * 添加数据
     * @param jedis
     * @param key 关键字
     * @param param 参数
     * @param close 是否关闭
     */
    public static void set(Jedis jedis, String key, String param, boolean close) {
        String s = jedis.set(key, param);
        if (close) {
            jedis.close();
        }
    }


    /**
     * 添加数据并且添加过期时间
     * @param jedis
     * @param key 关键词
     * @param param 参数
     * @param times 时间
     * @param close 是否关闭
     */
    public static void setAndExpire(Jedis jedis, String key, String param, int times, boolean close) {
        String s = jedis.set(key, param);
        jedis.expire(key, times);
        if (close) {
            jedis.close();
        }
    }


    /**
     * 获取数据
     * @param jedis
     * @param key 关键词
     * @return 获取的参数
     */
    public static String get(Jedis jedis, String key) {
        String s = jedis.get(key);
        return s;
    }

}
