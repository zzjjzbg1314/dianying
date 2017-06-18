package com.gaofen.dianying.web.controller;

import com.gaofen.dianying.common.NewServiceResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;

/**
 * Created by zongjie on 2017/6/4.
 */
@Controller
@RequestMapping("/")
public class AuthController {

    private static String token = "zzjjzbg1314";

    private Logger log = LoggerFactory.getLogger(AuthController.class);


    @RequestMapping(value = "checkSignature", method = RequestMethod.GET)
    @ResponseBody
    private NewServiceResult checkSignature(HttpServletRequest request, @RequestParam(value = "signature") String signature,
                                            @RequestParam(value = "timestamp") String timestamp,
                                            @RequestParam(value = "nonce") String nonce) throws NoSuchAlgorithmException {

        NewServiceResult serviceResult = new NewServiceResult();

        try {
            log.info("!!!!!!!!!!!!!!!!![signature]:"+signature+"[timestamp]:"+timestamp+"[nonce:]"+nonce);
            String[] array = new String[]{token, timestamp, nonce};
            StringBuffer sb = new StringBuffer();
            // 字符串排序
            Arrays.sort(array);
            for (int i = 0; i < 3; i++) {
                sb.append(array[i]);
            }
            String str = sb.toString();
            // SHA1签名生成
            MessageDigest md = MessageDigest.getInstance("SHA-1");
            md.update(str.getBytes());
            byte[] digest = md.digest();
            StringBuffer hexstr = new StringBuffer();
            String shaHex = "";
            for (int i = 0; i < digest.length; i++) {
                shaHex = Integer.toHexString(digest[i] & 0xFF);
                if (shaHex.length() < 2) {
                    hexstr.append(0);
                }
                hexstr.append(shaHex);
            }
            log.info("!!!!!!!!!!!!!!![hexstr]:"+hexstr.toString());
            if (signature.equalsIgnoreCase(hexstr.toString())) {
                serviceResult.setCode(200);
                serviceResult.setData("success");
            }else{
                serviceResult.setCode(500);
                serviceResult.setData("failed");
            }
            return serviceResult;
        } catch (Exception e) {
            serviceResult.setCode(200);
            serviceResult.setData("success");
            return  serviceResult;
        }
    }
}

