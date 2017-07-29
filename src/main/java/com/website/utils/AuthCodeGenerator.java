package com.website.utils;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.util.Random;

/**
 * 验证码生成器
 *
 * @author egdw
 */
public class AuthCodeGenerator {
    private String randomText = "";
    private Random random = new Random();
    private int times = 0;

    public Object[] getAuthCodeImage(int times) {
        this.times = times;
        getRandomText(times);
        Object[] objects = getRanomImage();
        return objects;
    }

    /**
     * 获取随机的数字和字母
     *
     * @param times 个数
     */
    private void getRandomText(int times) {
        String[] r = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J",
                "K", "L", "M", "N", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f",
                "g", "h", "i", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"};
        for (int i = 1; i <= times; i++) {
            int j = random.nextInt(r.length);
            randomText += r[j];
        }
    }

    /**
     * 通过随机数生成相应的随机图像
     */
    private Object[] getRanomImage() {
        int imageWidth = 16 * times;
        BufferedImage image = new BufferedImage(imageWidth, 40, BufferedImage.TYPE_INT_RGB);
        Graphics2D graphics = image.createGraphics();
        // 设置背景随机颜色
        Color backgroudColor = new Color(random.nextInt(255), random.nextInt(255), random.nextInt(255));
        graphics.setBackground(backgroudColor);
        // 设置随机线条
        for (int i = 0; i < times * 4; i++) {
            Color randomLineColor = new Color(random.nextInt(255), random.nextInt(255), random.nextInt(255));
            int tempx = random.nextInt(image.getWidth());
            int tempy = random.nextInt(image.getHeight());
            graphics.setPaint(randomLineColor);
            graphics.drawLine(tempx, tempy, random.nextInt(image.getWidth() / 2) + tempx,
                    random.nextInt(image.getHeight() / 2) + tempy);
        }
        // 设置随机杂点
        for (int i = 0; i < times * 8; i++) {
            Color randomRectColor = new Color(random.nextInt(255), random.nextInt(255), random.nextInt(255));
            graphics.setPaint(randomRectColor);
            graphics.drawRect(random.nextInt(image.getWidth()), random.nextInt(image.getHeight()), 1, 1);
        }
        // 设置字体
        Font font = new Font("", Font.ITALIC, 20);
        graphics.setFont(font);
        // 设置文字字体
        Color fontColor = new Color(random.nextInt(255), random.nextInt(255), random.nextInt(255));
        graphics.setPaint(fontColor);
        // 文字写入
        graphics.drawString(randomText, 10, 30);
        graphics.rotate(0d);
        graphics.dispose();
//        try {
//            ImageIO.write(image, "JPEG", new File("/Users/hdy/Downloads/pic/image.jpg"));
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
        Object[] obj = {randomText, image};
        return obj;
    }
}
