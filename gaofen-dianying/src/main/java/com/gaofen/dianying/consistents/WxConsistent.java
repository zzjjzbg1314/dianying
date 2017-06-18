package com.gaofen.dianying.consistents;

/**
 * Created by zongjie on 2017/6/11.
 */
public class WxConsistent {

       public static final String WECHAT_APP_ID = "wx5fbbe3fd1ad39112";

       public static final String WECHAT_APP_SECRET = "859df005599736598fe4da1dfa2d36e1";

       public static final String WECHAT_APP_GRANT_TYPE = "authorization_code";

       //获取用户信息url
       public static final String WECHAT_LOGIN_URL = "https://api.weixin.qq.com/sns/jscode2session?";
       //获取access_token url
       public static final String WECHAT_ACCESS_TOOKEN_URL = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential";
       //消息模板ID
       public static final String WECHAT_TEMPLATE_ID="S464Q2VHCJh7yF1KeJlp-P4IvpIFzHzJ7EYeiXgbvoQ";
       //发送模板消息url
       public static final String WECHAT_SEND_TEMPLATE_MSG_URL="https://api.weixin.qq.com/cgi-bin/message/wxopen/template/send?access_token=";



}