package com.gaofen.dianying.common;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.gaofen.dianying.utils.CheckUtil;
import com.gaofen.dianying.utils.StringUtil;

public class AuthServlet extends HttpServlet{

	private static final long serialVersionUID = 4811854972411905131L;
	private Logger LOG = LoggerFactory.getLogger(AuthServlet.class);
	
    @Override  
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {  
        String signature = req.getParameter("signature");  
        String timestamp = req.getParameter("timestamp");  
        String nonce = req.getParameter("nonce");  
        String echostr = req.getParameter("echostr"); 
        
        LOG.info("signature = " + signature);  
        LOG.info("timestamp = " + timestamp);  
        LOG.info("nonce = " + nonce);  
        LOG.info("echostr = " + signature);
        
        if(StringUtil.isNullOrEmpty(signature) ||
        		StringUtil.isNotNullAndNotEmpty(timestamp)||StringUtil.isNullOrEmpty(nonce)
        		||StringUtil.isNullOrEmpty(echostr)){
        	LOG.error("AuthServlet happen wrong!");
        } 
        
        if(CheckUtil.checkSignature(signature, timestamp, nonce)) {  
            resp.getWriter().print(echostr);  
        }  
    }  
}
