package com.gaofen.dianying.utils;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.ConnectException;
import java.net.URL;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.gaofen.dianying.common.AppProperties;
/**
 * 
 *@Description:微信公共号开发基础UTils 
 *@author zongjie
 *@time:2017年3月1日 下午3:03:00
 */
public class WeiXinUtils {
	
	private static Logger LOG =LoggerFactory.getLogger(WeiXinUtils.class);
	/**
	 *@Description:获取AccessToken
	 *@return
	 *@author: zongjie
	 *@time:2017年3月1日 下午3:03:17
	 */
	public static String getAccessToken() {
		try {
			String getAccessTokenUrl = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential"
					+ "&appid=" + AppProperties.getAppid() + "&secret=" + AppProperties.getAppSecret();
			JSONObject jsonObj = JSON.parseObject(HttpClientUtil.get(getAccessTokenUrl));
			return jsonObj.getString("access_token");
		} catch (Exception e) {
			return "";
		}
	}
	
	/**
	 *@Description:发起https请求并获取结果
	 *@param:requestUrl 请求地址 requestMethod 请求方式  outputStr 提交的参数
	 *@return
	 *@exception	
	 *@author: zongjie
	 *@time:2017年3月1日 下午3:54:30
	 */
	public static JSONObject httpsRequest(String requestUrl, String requestMethod, String outputStr) {
		JSONObject jsonObject = null;
		StringBuffer buffer = new StringBuffer();
		try {
			X509TrustManager tm = new X509TrustManager() {
				@Override
				public void checkClientTrusted(X509Certificate[] chain, String authType) throws CertificateException {
				}

				@Override
				public void checkServerTrusted(X509Certificate[] chain, String authType) throws CertificateException {
				}

				@Override
				public X509Certificate[] getAcceptedIssuers() {
					return null;
				}
			};
			// 创建SSLContext对象，并使用我们指定的信任管理器初始化
			SSLContext sslContext = SSLContext.getInstance("SSL", "SunJSSE");
			sslContext.init(null, new TrustManager[]{tm}, new java.security.SecureRandom());
			// 从上述SSLContext对象中得到SSLSocketFactory对象
			SSLSocketFactory ssf = sslContext.getSocketFactory();

			URL url = new URL(requestUrl);
			HttpsURLConnection httpUrlConn = (HttpsURLConnection) url.openConnection();
			httpUrlConn.setSSLSocketFactory(ssf);

			httpUrlConn.setDoOutput(true);
			httpUrlConn.setDoInput(true);
			httpUrlConn.setUseCaches(false);
			// 设置请求方式（GET/POST）
			httpUrlConn.setRequestMethod(requestMethod);
			if ("GET".equalsIgnoreCase(requestMethod))
				httpUrlConn.connect();
			// 当有数据需要提交时
			if (null != outputStr) {
				OutputStream outputStream = httpUrlConn.getOutputStream();
				// 注意编码格式，防止中文乱码
				outputStream.write(outputStr.getBytes("UTF-8"));
				outputStream.close();
			}
			// 将返回的输入流转换成字符串
			InputStream inputStream = httpUrlConn.getInputStream();
			InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");
			BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
			String str = null;
			while ((str = bufferedReader.readLine()) != null) {
				buffer.append(str);
			}
			bufferedReader.close();
			inputStreamReader.close();
			// 释放资源
			inputStream.close();
			inputStream = null;
			httpUrlConn.disconnect();
			jsonObject = JSONObject.parseObject(buffer.toString());
		} catch (ConnectException ce) {
			LOG.error("Weixin server connection timed out.");
		} catch (Exception e) {
			LOG.error("https request error:{}", e);
		}
		return jsonObject;
	}

}

