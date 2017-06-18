package com.gaofen.dianying.service;

import com.gaofen.dianying.beans.UserLoginSession;

/**
 * Created by zongjie on 2017/6/15.
 */
public interface UserLoginSessionDAO {

    void saveUserLoginSession(UserLoginSession userLoginSession,String rd_session);

    UserLoginSession getUserLoginSession(String rd_session);
}
