package com.gaofen.dianying.utils;

import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.URI;
import java.net.UnknownHostException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.net.ssl.SSLException;

import org.apache.http.HttpEntity;
import org.apache.http.HttpEntityEnclosingRequest;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpRequestRetryHandler;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.client.utils.HttpClientUtils;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.config.SocketConfig;
import org.apache.http.conn.ConnectTimeoutException;
import org.apache.http.conn.ConnectionKeepAliveStrategy;
import org.apache.http.conn.socket.LayeredConnectionSocketFactory;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.DefaultConnectionKeepAliveStrategy;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.JSON;

public class HttpClientUtil {

	private static final Logger LOG = LoggerFactory.getLogger(HttpClientUtil.class);

	private static final String JSON_DATA_KEY = "json_data";
	private static final String XML_DATA_KEY = "xml_data";

	private static final Integer SOCKET_TIMEOUT = 30000;
	private static final Integer CONN_TIMEOUT = 30000;
	private static final Integer CONN_REQUEST_TIMEOUT = 30000;

	public static final Integer DEFAULT_MAX_CONN_PER_ROUTE = 50;
	public static final Integer DEFAULT_MAX_CONN_TOTAL = 500;

	public static final Integer DEFAULT_KEEP_ALIVE = 5000;
	public static final Integer DEFAULT_RETRY_COUNT = 3;

	public static final Charset DEFAULT_CHARSET = Charset.forName("UTF-8");

	private static RequestConfig requestConfig;
	private static SocketConfig socketConfig;
	private static PoolingHttpClientConnectionManager connectionManager;

	private static CloseableHttpClient httpClient;

	static {
		requestConfig = RequestConfig.custom().setConnectTimeout(CONN_TIMEOUT).setSocketTimeout(SOCKET_TIMEOUT).setConnectionRequestTimeout(CONN_REQUEST_TIMEOUT).build();
		socketConfig = SocketConfig.custom().setTcpNoDelay(true).setSoTimeout(SOCKET_TIMEOUT).setSoKeepAlive(true).build();

		ConnectionKeepAliveStrategy keepAliveStrat = new DefaultConnectionKeepAliveStrategy() {
			public long getKeepAliveDuration(HttpResponse response, HttpContext context) {
				long keepAlive = super.getKeepAliveDuration(response, context);
				if (keepAlive == -1L) {

					keepAlive = DEFAULT_KEEP_ALIVE;
				}
				return keepAlive;
			}

		};

		HttpRequestRetryHandler retryHandler = new HttpRequestRetryHandler() {
			public boolean retryRequest(IOException exception, int executionCount, HttpContext context) {
				if (executionCount >= DEFAULT_RETRY_COUNT) {
					return false;
				}
				if ((exception instanceof InterruptedIOException)) {
					return false;
				}
				if ((exception instanceof UnknownHostException)) {
					return false;
				}
				if ((exception instanceof ConnectTimeoutException)) {
					return false;
				}
				if ((exception instanceof SSLException)) {
					return false;
				}
				HttpClientContext clientContext = HttpClientContext.adapt(context);

				HttpRequest request = clientContext.getRequest();
				boolean idempotent = !(request instanceof HttpEntityEnclosingRequest);
				if (idempotent) {
					return true;
				}
				return false;
			}
		};

		connectionManager = new PoolingHttpClientConnectionManager();
		connectionManager.setDefaultMaxPerRoute(DEFAULT_MAX_CONN_PER_ROUTE);
		connectionManager.setMaxTotal(DEFAULT_MAX_CONN_TOTAL);
		connectionManager.setDefaultSocketConfig(socketConfig);

		httpClient = HttpClients.custom().setConnectionManager(connectionManager).setDefaultRequestConfig(requestConfig).setRetryHandler(retryHandler)
				.setKeepAliveStrategy(keepAliveStrat).build();

	}

	/**
	 * GET请求
	 * 
	 * @param url
	 *            请求路径
	 * @return 请求返回数据
	 * 
	 * @throws Exception
	 */
	public static String get(String url) throws Exception {
		return doRequest(HttpMethod.GET, url, null, null);
	}

	/**
	 * GET请求
	 * 
	 * @param url
	 *            请求路径
	 * @param paramMap
	 *            请求参数
	 * @return 请求返回数据
	 * 
	 * @throws Exception
	 */
	public static String get(String url, Map<String, String> paramMap) throws Exception {
		return doRequest(HttpMethod.GET, url, paramMap, null);
	}

	/**
	 * GET请求
	 * 
	 * @param url
	 *            请求路径
	 * @param paramMap
	 *            请求参数
	 * @param headerMap
	 *            自定义头信息
	 * @return 请求返回数据
	 * 
	 * @throws Exception
	 */
	public static String get(String url, Map<String, String> paramMap, Map<String, String> headerMap) throws Exception {
		return doRequest(HttpMethod.GET, url, paramMap, headerMap);
	}

	/**
	 * GET请求
	 * 
	 * @param url
	 *            请求路径
	 * @return 请求返回数据
	 * 
	 * @throws Exception
	 */
	public static String post(String url) throws Exception {
		return doRequest(HttpMethod.POST, url, null, null);
	}

	/**
	 * GET请求
	 * 
	 * @param url
	 *            请求路径
	 * @param paramMap
	 *            请求参数
	 * @return 请求返回数据
	 * 
	 * @throws Exception
	 */
	public static String post(String url, Map<String, String> paramMap) throws Exception {
		return doRequest(HttpMethod.POST, url, paramMap, null);
	}

	/**
	 * GET请求
	 * 
	 * @param url
	 *            请求路径
	 * @param paramMap
	 *            请求参数
	 * @param headerMap
	 *            自定义头信息
	 * @return 请求返回数据
	 * 
	 * @throws Exception
	 */
	public static String post(String url, Map<String, String> paramMap, Map<String, String> headerMap) throws Exception {
		return doRequest(HttpMethod.POST, url, paramMap, headerMap);
	}

	/**
	 * 发起JSON Post请求
	 * 
	 * @param url
	 *            请求地址
	 * @param jsonData
	 *            JSON数据
	 * @return 请求返回数据
	 * 
	 * @throws Exception
	 */
	public static String postJson(String url, Map<String, Object> jsonData) throws Exception {
		Map<String, String> jsonMap = new HashMap<String, String>();
		jsonMap.put(JSON_DATA_KEY, JSON.toJSONString(jsonData));
		return doRequest(HttpMethod.POST_JSON, url, jsonMap, null);
	}
	
	
	/**
	 * 发起JSON Post请求
	 * 
	 * @param url
	 *            请求地址
	 * @param jsonData
	 *            JSON数据
	 * @param headerMap
	 *            头信息
	 * @return 请求返回数据
	 * 
	 * @throws Exception
	 */
	public static String postJson(String url, Map<String, Object> jsonData, Map<String, String> headerMap) throws Exception {
		Map<String, String> jsonMap = new HashMap<String, String>();
		jsonMap.put(JSON_DATA_KEY, JSON.toJSONString(jsonData));
		return doRequest(HttpMethod.POST_JSON, url, jsonMap, headerMap);
	}

	/**
	 * 发起XML Post请求
	 * 
	 * @param url
	 *            请求地址
	 * @param xmlData
	 *            XML数据
	 * @return 请求返回数据
	 * 
	 * @throws Exception
	 */
	public static String postXml(String url, String xmlData) throws Exception {
		Map<String, String> jsonMap = new HashMap<String, String>();
		jsonMap.put(XML_DATA_KEY, xmlData);
		return doRequest(HttpMethod.POST_XML, url, jsonMap, null);
	}

	/**
	 * 发起XML Post请求
	 * 
	 * @param url
	 *            请求地址
	 * @param xmlData
	 *            XML数据
	 * @param headerMap
	 *            头信息
	 * @return 请求返回数据
	 * 
	 * @throws Exception
	 */
	public static String postXml(String url, String xmlData, Map<String, String> headerMap) throws Exception {
		Map<String, String> jsonMap = new HashMap<String, String>();
		jsonMap.put(XML_DATA_KEY, xmlData);
		return doRequest(HttpMethod.POST_XML, url, jsonMap, headerMap);
	}

	// =======================SSL========================

	/**
	 * 发起JSON Post请求
	 * 
	 * @param url
	 *            请求地址
	 * @param jsonData
	 *            JSON数据
	 * @return 请求返回数据
	 * 
	 * @throws Exception
	 */
	public static String postJsonSSL(String url, Map<String, Object> jsonData, SSLEnvBuilder sslEnvBuilder) throws Exception {
		Map<String, String> jsonMap = new HashMap<String, String>();
		jsonMap.put(JSON_DATA_KEY, JSON.toJSONString(jsonData));
		return doRequestSSL(HttpMethod.POST_JSON, url, jsonMap, null, sslEnvBuilder);
	}

	/**
	 * 发起JSON Post请求
	 * 
	 * @param url
	 *            请求地址
	 * @param jsonData
	 *            JSON数据
	 * @param headerMap
	 *            头信息
	 * @return 请求返回数据
	 * 
	 * @throws Exception
	 */
	public static String postJsonSSL(String url, Map<String, Object> jsonData, Map<String, String> headerMap, SSLEnvBuilder sslEnvBuilder) throws Exception {
		Map<String, String> jsonMap = new HashMap<String, String>();
		jsonMap.put(JSON_DATA_KEY, JSON.toJSONString(jsonData));
		return doRequestSSL(HttpMethod.POST_JSON, url, jsonMap, headerMap, sslEnvBuilder);
	}

	/**
	 * 发起XML Post请求
	 * 
	 * @param url
	 *            请求地址
	 * @param xmlData
	 *            XML数据
	 * @return 请求返回数据
	 * 
	 * @throws Exception
	 */
	public static String postXmlSSL(String url, String xmlData, SSLEnvBuilder sslEnvBuilder) throws Exception {
		Map<String, String> jsonMap = new HashMap<String, String>();
		jsonMap.put(XML_DATA_KEY, xmlData);
		return doRequestSSL(HttpMethod.POST_XML, url, jsonMap, null, sslEnvBuilder);
	}

	/**
	 * 发起XML Post请求
	 * 
	 * @param url
	 *            请求地址
	 * @param xmlData
	 *            XML数据
	 * @param headerMap
	 *            头信息
	 * @return 请求返回数据
	 * 
	 * @throws Exception
	 */
	public static String postXmlSSL(String url, String xmlData, Map<String, String> headerMap, SSLEnvBuilder sslEnvBuilder) throws Exception {
		Map<String, String> jsonMap = new HashMap<String, String>();
		jsonMap.put(XML_DATA_KEY, xmlData);
		return doRequestSSL(HttpMethod.POST_XML, url, jsonMap, headerMap, sslEnvBuilder);
	}

	public interface SSLEnvBuilder {
		LayeredConnectionSocketFactory createSSLSocketFactory();
	}

	private static String doRequest(HttpMethod method, String url, Map<String, String> paramMap, Map<String, String> headerMap) throws Exception {
		return doRequestSSL(method, url, paramMap, headerMap, null);
	}

	private static String doRequestSSL(HttpMethod method, String url, Map<String, String> paramMap, Map<String, String> headerMap, SSLEnvBuilder sslEnvBuilder) throws Exception {

		if (url == null || "".equals(url))
			throw new IllegalArgumentException("url cannot be empty");

		HttpUriRequest request = null;
		CloseableHttpResponse response = null;

		try {
			switch (method) {
			case GET:
				URI uri = new URIBuilder(url).addParameters(convertToNameValuePairs(paramMap)).build();
				request = new HttpGet(uri);
				break;
			case POST:
				HttpEntity formEntity = new UrlEncodedFormEntity(convertToNameValuePairs(paramMap), DEFAULT_CHARSET);
				request = new HttpPost(url);
				((HttpPost) request).setEntity(formEntity);
				break;
			case POST_JSON:
				String jsonData = paramMap.get(JSON_DATA_KEY);
				LOG.debug("jsonData:{}", jsonData);
				HttpEntity jsonEntity = new StringEntity(jsonData, ContentType.APPLICATION_JSON);
				request = new HttpPost(url);
				((HttpPost) request).setEntity(jsonEntity);
				break;
			case POST_XML:
				String xmlData = paramMap.get(XML_DATA_KEY);
				HttpEntity xmlEntity = new StringEntity(xmlData, DEFAULT_CHARSET);
				request = new HttpPost(url);
				((HttpPost) request).setEntity(xmlEntity);
				break;

			default:
				break;
			}

			LOG.info("request:{}", request.toString());

			response = httpClient.execute(request, HttpClientContext.create());
			HttpEntity entity = response.getEntity();
			int statusCode = response.getStatusLine().getStatusCode();
			String resultData = EntityUtils.toString(entity, DEFAULT_CHARSET);

			LOG.info("statusCode：{}", statusCode);
			LOG.info("resultData：{}", resultData);

			return resultData;
		} catch (Exception e) {
			LOG.error("execute [{}] request error", method.name());
			throw e;
		} finally {
			if (null != request && !request.isAborted()) {
				request.abort();
			}
			HttpClientUtils.closeQuietly(response);
		}
	}

	private static List<NameValuePair> convertToNameValuePairs(Map<String, String> paramMap) {
		List<NameValuePair> nvps = new ArrayList<NameValuePair>();
		if (paramMap != null && paramMap.size() > 0) {
			for (Map.Entry<String, String> e : paramMap.entrySet()) {
				String value = e.getValue();
				if (value != null && !"".equals(value)) {
					nvps.add(new BasicNameValuePair(e.getKey(), value));
				}
			}
		}
		return nvps;
	}

	/**
	 * 标识HTTP请求类型枚举
	 */
	static enum HttpMethod {
		GET, POST, PUT, DELETE, POST_JSON, POST_XML
	}

	public static void main(String[] args) {
		long start = System.currentTimeMillis();
		try {
			System.out.println(get("http://210.74.1.225"));
		} catch (Exception e) {
			LOG.error("Unknown error", e);
		}
		LOG.info("costs " + (System.currentTimeMillis() - start) + " ms");
	}

}
