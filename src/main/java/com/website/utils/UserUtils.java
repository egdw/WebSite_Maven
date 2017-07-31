package com.website.utils;

import java.util.Random;

public class UserUtils {
    /**
     * 获取随机的数字和字母
     *
     * @param times 个数
     */
    public static String getRandomText(int times) {
        String randomText = "";
        Random random = new Random();
        String[] r = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J",
                "K", "L", "M", "N", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f",
                "g", "h", "i", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"};
        for (int i = 1; i <= times; i++) {
            int j = random.nextInt(r.length);
            randomText += r[j];
        }
        return randomText;
    }
}
