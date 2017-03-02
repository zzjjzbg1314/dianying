package com.gaofen.dianying.service.weixin.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.gaofen.dianying.common.AppProperties;
import com.gaofen.dianying.pojo.Menu;
import com.gaofen.dianying.service.weixin.MenuService;
import com.gaofen.dianying.utils.WeiXinUtils;

@Service
public class MenuServiceImpl implements MenuService {

	private static Logger LOG = LoggerFactory.getLogger(MenuServiceImpl.class);

	@Override
	public void createMenu(Menu menu, String accessToken) {
		try {
			// 拼装创建菜单的url
			String url = AppProperties.getMenu_create_url() + accessToken;
			// 将菜单对象转换成json字符串
			String jsonMenu = JSONObject.toJSONString(menu);
			// 调用接口创建菜单
			JSONObject jsonObject = WeiXinUtils.httpsRequest(url, "POST", jsonMenu);
			if (null != jsonObject) {
				if (0 != jsonObject.getIntValue("errcode")) {
					LOG.error("创建菜单失败 errcode:{} errmsg:{}", jsonObject.getIntValue("errcode"),
							jsonObject.getString("errmsg"));
					throw new RuntimeException("创建菜单失败:" + jsonObject.getString("errmsg"));
				}
			} else {
				LOG.error("create menu failed!");
				throw new RuntimeException("create menu failed!");
			}
		} catch (Exception e) {
			LOG.error("create menu failed! fail msg:" + e.getMessage());
			throw new RuntimeException(e.getMessage());
		}
	}
	
}
