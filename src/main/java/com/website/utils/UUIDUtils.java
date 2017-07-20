package com.website.utils;

import java.util.UUID;

public class UUIDUtils {
	public static String getUUID(){
		UUID uuid  =  UUID.randomUUID(); 
		String string = uuid.toString();
		return string;
	}
}
