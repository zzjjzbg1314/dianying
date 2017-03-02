package com.gaofen.dianying.service.weixin;


import com.gaofen.dianying.pojo.Menu;

/**
 * @Description:微信菜单service
 * @author zongjie
 * @time:2017年3月1日 下午4:34:44
 */
public interface MenuService {

	/**
	 *@Description:创建菜单
	 *@param
	 *@exception	
	 *@author: zongjie
	 *@time:2017年3月1日 下午4:36:20
	 */
	void createMenu(Menu menu, String accessToken);
	
}
