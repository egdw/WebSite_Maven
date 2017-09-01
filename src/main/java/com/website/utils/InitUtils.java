package com.website.utils;

import org.springframework.stereotype.Component;

import java.io.*;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

/**
 * Created by hdy on 2017/8/29.
 */
public class InitUtils {
    //文件保存地址
    private String filePath;
    private File file;
    private Properties pps = new Properties();

    public InitUtils(String filePath) {
        this.filePath = filePath;
        file = new File(filePath, "setting.properties");
    }

    public String get(String key, String defaultString) {
        String property = pps.getProperty(key);
        if (property == null || property.equals("")) {
            return defaultString;
        }
        return property;
    }

    public void set(String key, String value) {
        FileOutputStream outputStream = null;
        FileInputStream inputStream = null;
        try {
            inputStream = new FileInputStream(file);
            pps.load(inputStream);
            inputStream.close();
            outputStream = new FileOutputStream(file);
            pps.setProperty(key, value);
            pps.store(outputStream, null);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                outputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public void setArraylist(Map<String, String> map) {
        Iterator<Map.Entry<String, String>> iterator = map.entrySet().iterator();
        while (iterator.hasNext()) {
            Map.Entry<String, String> next = iterator.next();
            String key = next.getKey();
            String value = next.getValue();
            pps.setProperty(key, value);
        }
        FileOutputStream outputStream = null;
        try {
            outputStream = new FileOutputStream(file);
            pps.store(outputStream, null);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                outputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public Set<Map.Entry<Object, Object>> getAll() {
        Set<Map.Entry<Object, Object>> entries = pps.entrySet();
        return entries;
    }

    public boolean exists() {
        if (file != null && file.exists()) {
            return true;
        } else {
            file.mkdirs();
            return false;
        }
    }

}
