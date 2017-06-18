package com.gaofen.dianying.utils;

import java.util.UUID;

/**
 * Created by zongjie on 2017/6/15.
 */
public class UuidUtil {

    public static String getUuid(){
        UUID uuid = UUID.randomUUID();
        String uuidStr =  uuid.toString();
        uuidStr = uuidStr.replace("-", "");
        return uuidStr;
    }

    public static void main(String[] args) {
        System.out.println(UuidUtil.getUuid());
    }
}
