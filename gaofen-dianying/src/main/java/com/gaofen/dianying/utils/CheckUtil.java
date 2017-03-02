package com.gaofen.dianying.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;

public class CheckUtil {

	// token为自己定义的一个字符串
	private static final String token = "zhengzongjie";

	public static boolean checkSignature(String signature, String timestamp, String nonce) {
		String[] arr = new String[] { token, timestamp, nonce };
		// 排序
		Arrays.sort(arr);
		// 生成字符串
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < arr.length; i++) {
			sb.append(arr[i]);
		}
		// sha1加密
		String tmpStr = getSHA1Str(sb.toString());
		// 加密字符串与signature比较的时候忽略大小写
		return tmpStr.equals(signature.toUpperCase());
	}
	
	private static String getSHA1Str(String content) {  
        MessageDigest md = null;  
        String tmpStr = null;  
        try {  
            md = MessageDigest.getInstance("SHA-1");  
            // 将三个参数字符串拼接成一个字符串进行 shal 加密  
            byte[] digest = md.digest(content.toString().getBytes());  
            tmpStr = byteToStr(digest);  
        } catch (NoSuchAlgorithmException e) {  
            e.printStackTrace();  
        }  
        return tmpStr;  
    }  
      
    /** 
     * 将字节数组转换为十六进制字符串 
     * @param digest 
     * @return 
     */  
    private static String byteToStr(byte[] digest) {  
        String strDigest = "";  
        for(int i = 0; i < digest.length; i++){  
            strDigest += byteToHexStr(digest[i]);  
        }  
        return strDigest;  
    }  
      
    /** 
     * 将字节转换为十六进制字符串 
     * @param b 
     * @return 
     */  
    private static String byteToHexStr(byte b) {  
        char[] Digit = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};  
        char[] tempArr = new char[2];  
        tempArr[0] = Digit[(b >>> 4) & 0X0F];  
        tempArr[1] = Digit[b & 0X0F];  
        String s = new String(tempArr);  
        return s;  
    }  

}