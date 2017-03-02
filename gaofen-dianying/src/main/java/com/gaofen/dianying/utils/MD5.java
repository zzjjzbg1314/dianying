package com.gaofen.dianying.utils;

import java.io.UnsupportedEncodingException;
import java.security.SignatureException;
import org.apache.commons.codec.digest.DigestUtils;

/** 
* 功能：MD5签名
* 版本：3.3
* 修改日期：2012-08-17
* */
public class MD5 {
    public static void main(String[] args) {
        String str = "bankAccount_accountCode_1=6222021001020546336&bankAccount_accountIndex_1=1&bankAccount_accountName_1=朱力军&bankAccount_accountType_1=2&bankAccount_bankId_1=中国工商银行&bankAccount_bankName_1=中国工商银行上海市五角场支行&bankAccount_city_1=090900&bankAccount_contactLine_1=102290022499&bankAccount_idCardType_1=1&bankAccount_idCard_1=231025198412221211&bankAccount_province_1=090000&mchPayConf_accountIndex=1&mchPayConf_apiCode=pay.weixin.native&mchPayConf_billRate=6&mch_id=100590000043&merchantDetail_address=上海市宝山区逸仙路2816号&merchantDetail_city=上海市&merchantDetail_industryId=111&merchantDetail_mobile=18717976858&merchantDetail_principal=朱力军&merchantDetail_province=上海市&merchant_name=微盟企业发展有限公司&merchant_outMerchantId=456&merchant_parentMerchant=100570000054&nonce_str=1341243eqraf&service=unified.cms.store.new";
        System.out.println(MD5.sign(str, "&key=f2e7265d026504e4c1d198f3bb116bd2", "utf-8"));
    }

    /**
     * 签名字符串
     * @param text 需要签名的字符串
     * @param key 密钥
     * @param input_charset 编码格式
     * @return 签名结果
     */
    public static String sign(String text, String key, String input_charset) {
    	text = text + key;
        return DigestUtils.md5Hex(getContentBytes(text, input_charset));
    }
    
    /**
     * 签名字符串
     * @param text 需要签名的字符串
     * @param sign 签名结果
     * @param key 密钥
     * @param input_charset 编码格式
     * @return 签名结果
     */
    public static boolean verify(String text, String sign, String key, String input_charset) {
    	text = text + key;
    	String mysign = DigestUtils.md5Hex(getContentBytes(text, input_charset));
    	if(mysign.equals(sign)) {
    		return true;
    	}
    	else {
    		return false;
    	}
    }

    /**
     * @param content
     * @param charset
     * @return
     * @throws SignatureException
     * @throws UnsupportedEncodingException 
     */
    private static byte[] getContentBytes(String content, String charset) {
        if (charset == null || "".equals(charset)) {
            return content.getBytes();
        }
        try {
            return content.getBytes(charset);
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("MD5签名过程中出现错误,指定的编码集不对,您目前指定的编码集是:" + charset);
        }
    }

}