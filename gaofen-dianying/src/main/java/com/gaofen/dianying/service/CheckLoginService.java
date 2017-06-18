package com.gaofen.dianying.service;

import com.gaofen.dianying.beans.CheckLoginParam;
import com.gaofen.dianying.beans.CheckLoginResponse;

/**
 * Created by zongjie on 2017/6/11.
 */
public interface CheckLoginService {

    /**
     * 登陆
     * @param param
     * @return
     */
    CheckLoginResponse checkLogin(CheckLoginParam param);

    /**
     * 解析getUserInfo加密信息
     * @param param
     * @return
     */
    CheckLoginResponse decodeUserInfo(CheckLoginParam param);
}
