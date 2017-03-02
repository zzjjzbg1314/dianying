/**
 * Project Name:pay-protocol
 * File Name:Xml.java
 * Package Name:cn.swiftpass.pay.protocol
 * Date:2014-8-10下午10:48:21
 *
*/

package com.gaofen.dianying.utils;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.SortedMap;
import java.util.TreeMap;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.xml.sax.InputSource;

/**
 * ClassName:Xml
 * Function: XML的工具方法
 * Date:     2014-8-10 下午10:48:21 
 * @author    
 */
@SuppressWarnings({"rawtypes","unchecked"})
public class XmlUtils {
    
    /** <一句话功能简述>
     * <功能详细描述>request转字符串
     * @param request
     * @return
     * @see [类、类#方法、类#成员]
     */
    public static String parseRequst(HttpServletRequest request){
        String body = "";
        try {
            ServletInputStream inputStream = request.getInputStream(); 
            BufferedReader br = new BufferedReader(new InputStreamReader(inputStream));
            while(true){
                String info = br.readLine();
                if(info == null){
                    break;
                }
                if(body == null || "".equals(body)){
                    body = info;
                }else{
                    body += info;
                }
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }            
        return body;
    }
    
    public static String parseXML(SortedMap<String, String> parameters) {
        StringBuffer sb = new StringBuffer();
        sb.append("<xml>");
        Set es = parameters.entrySet();
        Iterator it = es.iterator();
        while (it.hasNext()) {
            Map.Entry entry = (Map.Entry)it.next();
            String k = (String)entry.getKey();
            String v = (String)entry.getValue();
            if (null != v && !"".equals(v) && !"appkey".equals(k)) {
                sb.append("<" + k + ">" + parameters.get(k) + "</" + k + ">\n");
            }
        }
        sb.append("</xml>");
        return sb.toString();
    }

    /**
     * 从request中获得参数Map，并返回可读的Map
     * 
     * @param request
     * @return
     */
    public static SortedMap getParameterMap(HttpServletRequest request) {
        // 参数Map
        Map properties = request.getParameterMap();
        // 返回值Map
        SortedMap returnMap = new TreeMap();
        Iterator entries = properties.entrySet().iterator();
        Map.Entry entry;
        String name = "";
        String value = "";
        while (entries.hasNext()) {
            entry = (Map.Entry) entries.next();
            name = (String) entry.getKey();
            Object valueObj = entry.getValue();
            if(null == valueObj){
                value = "";
            }else if(valueObj instanceof String[]){
                String[] values = (String[])valueObj;
                for(int i=0;i<values.length;i++){
                    value = values[i] + ",";
                }
                value = value.substring(0, value.length()-1);
            }else{
                value = valueObj.toString();
            }
            returnMap.put(name, value.trim());
        }
        returnMap.remove("method");
        return returnMap;
    }
    
    /**
     * 转XMLmap
     * @author  
     * @param xmlBytes
     * @param charset
     * @return
     * @throws Exception
     */
    public static Map<String, String> toMap(byte[] xmlBytes,String charset) throws Exception{
        SAXReader reader = new SAXReader(false);
        InputSource source = new InputSource(new ByteArrayInputStream(xmlBytes));
        source.setEncoding(charset);
        Document doc = reader.read(source);
        Map<String, String> params = XmlUtils.toMap(doc.getRootElement());
        return params;
    }
    
    /**
     * 转MAP
     * @author  
     * @param element
     * @return
     */
    public static Map<String, String> toMap(Element element){
        Map<String, String> rest = new HashMap<String, String>();
        List<Element> els = element.elements();
        for(Element el : els){
            rest.put(el.getName().toLowerCase(), el.getTextTrim());
        }
        return rest;
    }
    
    public static String toXml(Map<String, String> params){
        StringBuilder buf = new StringBuilder();
        List<String> keys = new ArrayList<String>(params.keySet());
        Collections.sort(keys);
        buf.append("<xml>");
        for(String key : keys){
            buf.append("<").append(key).append(">");
            buf.append("<![CDATA[").append(params.get(key)).append("]]>");
            buf.append("</").append(key).append(">\n");
        }
        buf.append("</xml>");
        return buf.toString();
    }
    
    public static String toStr(Map<String, String> params){
        StringBuilder buf = new StringBuilder();
        List<String> keys = new ArrayList<String>(params.keySet());
        Collections.sort(keys);
        for(String key : keys){
            buf.append("&").append(key.toLowerCase()).append("=");
            buf.append(params.get(key));
        }
        return buf.toString();
    }
    
    public static void main(String[] args) {
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("service", "unified.cms.store.new");//接口类型
    	map.put("mch_id", "100590000043");//授权渠道编号
    	map.put("nonce_str", "1341243eqraf");//随机字符串
    	map.put("merchant_name", "会所123");//商户名称
    	map.put("merchant_parentMerchant", "100570000054");//父商户    100570000054为分配的父商户号
    	map.put("merchant_outMerchantId", "12398771");//外商户号
    	map.put("merchantDetail_industryId", "111");//行业类别
    	map.put("merchantDetail_province", "上海市");//省份
    	map.put("merchantDetail_city", "上海市");//城市
    	map.put("merchantDetail_address", "上海市宝山区逸仙路2816号");//地址
    	map.put("merchantDetail_principal", "朱力军");//负责人
    	map.put("merchantDetail_mobile", "18717976858");//负责人手机号
    	map.put("bankAccount_accountIndex_1", "1");//账户序号
    	map.put("bankAccount_accountCode_1", "6222021001020546336");//银行卡号
    	map.put("bankAccount_bankId_1", "1");//开户银行
    	map.put("bankAccount_accountName_1", "朱力军");//开户人
    	map.put("bankAccount_accountType_1", "2");//账户类型
    	map.put("bankAccount_contactLine_1", "102290022499");//联行号
    	map.put("bankAccount_bankName_1", "中国工商银行上海市五角场支行");//开户支行名称
    	map.put("bankAccount_province_1", "090000");//开户支行所在省 省份编号
    	map.put("bankAccount_city_1", "090900");//开户支行所在市  城市编号
    	map.put("bankAccount_idCardType_1", "1");//持卡人证件类型
    	map.put("bankAccount_idCard_1", "231025198412221211");//持卡人证件号码
    	map.put("mchPayConf_apiCode_1", "pay.weixin.jspay");//支付类型
    	map.put("mchPayConf_accountIndex_1", "1");//结算账户
    	map.put("mchPayConf_billRate_1", "6");//结算费率
    	
    	String key = "f2e7265d026504e4c1d198f3bb116bd2";
    	Map<String, String> params = SignUtils.paraFilter(map);
		StringBuilder buf = new StringBuilder((params.size() + 1) * 10);
		SignUtils.buildPayParams(buf, params, false);
		String preStr = buf.toString();
		System.out.println("原串-->"+preStr);
		String sign = MD5.sign(preStr, "&key="+key, "utf-8").toUpperCase();
		System.out.println("签名后-->"+sign);
		map.put("sign", sign);
    	System.out.println("请求报文-->"+toXml(map));
        System.out.println("验签结果-->"+MD5.verify(preStr,sign, "&key="+key, "utf-8"));
        
	}
}

