package com.gaofen.dianying.web.controller;

import com.gaofen.dianying.beans.CheckLoginParam;
import com.gaofen.dianying.beans.CheckLoginResponse;
import com.gaofen.dianying.common.NewServiceResult;
import com.gaofen.dianying.service.CheckLoginService;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by zongjie on 2017/6/11.
 */
@Controller
@RequestMapping("/")
public class CheckLoginController {

    @Autowired
    private CheckLoginService checkLoginService;

    private Logger LOG = LoggerFactory.getLogger(CheckLoginController.class);

    @RequestMapping(value = "checkLogin", method = RequestMethod.POST)
    @ResponseBody
    private NewServiceResult checkLogin(HttpServletRequest request, @RequestBody CheckLoginParam param) {

        NewServiceResult serviceResult = new NewServiceResult();

        try {
            LOG.info(">>>>>>>>>check login code:["+param.getCode()+"]");

            if(StringUtils.isEmpty(param.getCode())){
                String errMsg="code is null";
                throw new RuntimeException(errMsg);
            }
            CheckLoginResponse response=checkLoginService.checkLogin(param);
            serviceResult.setCode(200);
            serviceResult.setData("success");
            serviceResult.setData(response);
            return serviceResult;
        } catch (Exception e) {
            serviceResult.setCode(500);
            serviceResult.setData("failed");
            serviceResult.setMsg(e.getMessage());
            return  serviceResult;
        }
    }


    @RequestMapping(value = "decodeUserInfo", method = RequestMethod.POST)
    @ResponseBody
    private NewServiceResult decodeUserInfo(HttpServletRequest request, @RequestBody CheckLoginParam param) {

        NewServiceResult serviceResult = new NewServiceResult();

        try {
            LOG.info(">>>>>>>>>decodeUserInfo  iv:["+param.getIv()+"]");
            LOG.info(">>>>>>>>>decodeUserInfo  uuid:["+param.getUuid()+"]");
            LOG.info(">>>>>>>>>decodeUserInfo  encryptedData:["+param.getEncryptedData()+"]");

            if(StringUtils.isEmpty(param.getUuid())){
                LOG.info("uuid is empty!");
                throw  new RuntimeException("uuid is empty!");
            }
            if(StringUtils.isEmpty(param.getEncryptedData())){
                LOG.info("encryptedData is empty!");
                throw  new RuntimeException("encryptedData is empty!");
            }
            CheckLoginResponse response=checkLoginService.decodeUserInfo(param);
            serviceResult.setCode(200);
            serviceResult.setMsg("success");
            serviceResult.setData(response);
            return serviceResult;
        } catch (Exception e) {
            serviceResult.setCode(500);
            serviceResult.setData("failed");
            serviceResult.setMsg(e.getMessage());
            return  serviceResult;
        }
    }



}
