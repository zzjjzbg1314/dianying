package com.gaofen.dianying.pojo;

/**
 * @Description:微信通用接口凭证
 * @author zongjie
 * @time:2017年3月1日 下午3:49:37
 */
public class AccessToken {

	// 获取到的凭证
	private String token;

	// 凭证有效时间，单位：秒
	private int expiresIn;

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public int getExpiresIn() {
		return expiresIn;
	}

	public void setExpiresIn(int expiresIn) {
		this.expiresIn = expiresIn;
	}

}
