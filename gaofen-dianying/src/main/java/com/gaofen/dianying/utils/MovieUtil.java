package com.gaofen.dianying.utils;

import org.apache.commons.lang.StringUtils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by zongjie on 2017/7/3.
 */
public class MovieUtil {

    /**
     * @param originImageUrl
     * @return
     */
    public static String transforMovieImageUrl(String originImageUrl) {
        if (StringUtils.isNotEmpty(originImageUrl)) {
            //取得所有的数字
            String regEx = "[^0-9]";
            Pattern p = Pattern.compile(regEx);
            Matcher m = p.matcher(originImageUrl);
            String number = m.replaceAll("").trim().substring(1);
            String url = "https://img1.doubanio.com/view/photo/photo/public/p" + number + ".png";
            return url;
        } else {
            return null;
        }
    }
}
