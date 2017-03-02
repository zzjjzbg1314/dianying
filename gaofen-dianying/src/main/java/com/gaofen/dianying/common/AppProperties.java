package com.gaofen.dianying.common;

/**
 *@Description:常量配置信息 
 *@author zongjie
 *@time:2017年3月1日 下午2:37:26
 */
public class AppProperties {
	
	//appid
	public static String  appid="wxc1098a60ad25b01f";
	
	//AppSecret
	public static String AppSecret ="1eed40a413fa389127de5ab280f79780";
	
	//菜单创建url
	public static String menu_create_url ="https://api.weixin.qq.com/cgi-bin/menu/create?access_token=";
	
	
	
	public static String getAppid() {
		return appid;
	}

	public static void setAppid(String appid) {
		AppProperties.appid = appid;
	}

	public static String getAppSecret() {
		return AppSecret;
	}

	public static void setAppSecret(String appSecret) {
		AppSecret = appSecret;
	}

	public static String getMenu_create_url() {
		return menu_create_url;
	}

	public static void setMenu_create_url(String menu_create_url) {
		AppProperties.menu_create_url = menu_create_url;
	}
	
}
