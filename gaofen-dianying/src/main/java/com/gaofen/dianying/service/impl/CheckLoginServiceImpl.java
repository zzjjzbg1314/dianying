package com.gaofen.dianying.service.impl;

import com.gaofen.dianying.beans.CheckLoginParam;
import com.gaofen.dianying.beans.CheckLoginResponse;
import com.gaofen.dianying.beans.UserInfoBean;
import com.gaofen.dianying.beans.UserLoginSession;
import com.gaofen.dianying.consistents.WxConsistent;
import com.gaofen.dianying.service.CheckLoginService;
import com.gaofen.dianying.utils.AES128Util;
import com.gaofen.dianying.utils.HttpClientUtil;
import com.gaofen.dianying.utils.JsonUtil;
import com.gaofen.dianying.utils.UuidUtil;
import net.sf.json.JSONObject;
import org.apache.commons.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.security.AlgorithmParameters;

/**
 * Created by zongjie on 2017/6/11.
 */
@Service
public class CheckLoginServiceImpl implements CheckLoginService {

    private Logger LOG = LoggerFactory.getLogger(CheckLoginServiceImpl.class);

    @Autowired
    UserLoginSesionImpl userLoginSesionimpl;

    public CheckLoginResponse checkLogin(CheckLoginParam param) {

        try {
            String requestUrl = WxConsistent.WECHAT_LOGIN_URL + "appid=" +
                    WxConsistent.WECHAT_APP_ID + "&secret=" + WxConsistent.WECHAT_APP_SECRET + "&js_code=" +
                    param.getCode() + "&grant_type=" + WxConsistent.WECHAT_APP_GRANT_TYPE;

            String getReturnStr = HttpClientUtil.sendGetRequest(requestUrl, "utf-8");
            JSONObject jsonObject = JSONObject.fromObject(getReturnStr);
            if (jsonObject.get("errcode") != null) {
                LOG.error(jsonObject.getString("errmsg"));
            } else {
                String openid = jsonObject.getString("openid");
                String session_key = jsonObject.getString("session_key");
                LOG.info("checkLogin session_key:"+session_key);
                LOG.info("checkLogin openid:"+openid);

                //保存起来
                UserLoginSession userLoginSession = new UserLoginSession();
                userLoginSession.setOpenid(openid);
                userLoginSession.setSession_key(session_key);
                String uuid = UuidUtil.getUuid();
                userLoginSesionimpl.saveUserLoginSession(userLoginSession, uuid);
                CheckLoginResponse response = new CheckLoginResponse();
                response.setUuid(uuid);
                return response;
            }
            return null;
        } catch (Exception e) {
            LOG.error(e.getMessage());
            throw new RuntimeException(e.getMessage());
        }
    }

    @Override
    public CheckLoginResponse decodeUserInfo(CheckLoginParam param) {
        try {
            //step 1     从缓存中获取session_key
            UserLoginSession userLoginSession = userLoginSesionimpl.getUserLoginSession(param.getUuid());
            LOG.info("userLoginSession getOpenid:" + userLoginSession.getOpenid());
            LOG.info("userLoginSession getSession_key:" + userLoginSession.getSession_key());
            if (StringUtils.isEmpty(userLoginSession.getSession_key())) {
                LOG.error("Session_key is null!");
                throw new RuntimeException("Session_key is null!");
            }
            LOG.info("开始解密");
            AlgorithmParameters iv = AES128Util.generateIV(Base64.decodeBase64(param.getIv()));
            byte[] data = AES128Util.decrypt(Base64.decodeBase64(param.getEncryptedData()), Base64.decodeBase64(userLoginSession.getSession_key()),iv);
            LOG.info("解密后得到的数字 :"+new String(data));
            UserInfoBean userInfo =JsonUtil.jsonStrToObject(new String(data), UserInfoBean.class);

            CheckLoginResponse response = new CheckLoginResponse();
            response.setUserInfo(userInfo);

            return response;
        } catch (Exception e) {
            String errMsg = "decodeUserInfo failed!"+e.getMessage();
            LOG.error(errMsg);
            throw new RuntimeException(errMsg);
        }
    }

    public static void main(String args []){

    }
}
