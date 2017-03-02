package com.gaofen.dianying.utils;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

public class StringUtil {
	
    /**
     * Return true if the string is null or empty. Otherwise return false.
     * @param string
     * @return
     */
    public static boolean isNullOrEmpty(String string) {
        return ( (string == null) || (string.trim().length() == 0) );
    }
    
    /**
     * Return true if the string is not null and also not empty. Otherwise return false.
     * Opposite to isNullOrEmpty.
     * @param string
     * @return
     */
    public static boolean isNotNullAndNotEmpty(String string) {
        return !isNullOrEmpty(string);
    }
    
    @SuppressWarnings("unchecked")
	public static <T> List<T> stringToList(String src, String delimitor, Class<?> type) {
    	StringTokenizer tokenizer = new StringTokenizer(src, delimitor);
    	List<T> list = new ArrayList<T>();
    	while (tokenizer.hasMoreTokens()) {
    		String token = tokenizer.nextToken();
    		if (type.isAssignableFrom(Integer.class)) {
    			list.add((T) type.cast(Integer.parseInt(token)));
    		}
    		else {
    			list.add((T) token);
    		}
    	}
    	return list;
    }
    
   /* public static void main(String[] args) {
    	String a = "11,22,333";
    	List<Integer> list = stringToList(a, ",", Integer.class);
    	for (Integer i : list) {
    		System.out.println(i);
    	}
    }
    */

    /**
     * 将字符串中间内容处理为*
     * @param source
     * @param rep
     * @return
     */
    public static String replace(String source,Character rep){
    	if(rep == null){
    		rep = '*';
    	}
    	int len = source.length()/2;
    	int len1 = (source.length()-len)%2==0?(source.length()-len)/2:(source.length()-len)/2+1;
    	int len2 = len + len1;
    	StringBuilder result = new StringBuilder();
    	result.append(source.substring(0, len1));
    	for(int i = 0;i < len; i++){
    		result.append(rep);
    	}
    	result.append(source.substring(len2));
    	return result.toString();
    	
    }
    
}
