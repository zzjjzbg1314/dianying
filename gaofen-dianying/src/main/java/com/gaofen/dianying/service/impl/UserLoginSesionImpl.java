package com.gaofen.dianying.service.impl;

import com.gaofen.dianying.beans.UserLoginSession;
import com.gaofen.dianying.service.UserLoginSessionDAO;
import com.gaofen.dianying.utils.KryoUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.io.Serializable;

/**
 * Created by zongjie on 2017/6/15.
 */
@Service
public class UserLoginSesionImpl implements UserLoginSessionDAO {

    @Autowired
    protected RedisTemplate<Serializable, Serializable> redisTemplate;

    @Override
    public void saveUserLoginSession(final UserLoginSession userLoginSession, final String rd_session) {

        redisTemplate.execute(new RedisCallback<Object>() {

            @Override
            public Object doInRedis(RedisConnection connection) throws DataAccessException {
                connection.set(redisTemplate.getStringSerializer().serialize("usersession.rd_session" + rd_session),
                        redisTemplate.getStringSerializer().serialize(new String(KryoUtils.serializationObject(userLoginSession))));
                return null;
            }
        });
    }

    @Override
    public UserLoginSession getUserLoginSession(final String rd_session) {
        return redisTemplate.execute(new RedisCallback<UserLoginSession>() {
            @Override
            public UserLoginSession doInRedis(RedisConnection connection) throws DataAccessException {
                byte[] key = redisTemplate.getStringSerializer().serialize("usersession.rd_session" + rd_session);
                if (connection.exists(key)) {
                    byte[] value = connection.get(key);
                    Object obj = KryoUtils.deserializationObject(new String(value),UserLoginSession.class);
                    if (obj instanceof UserLoginSession) {
                        UserLoginSession userLoginSession = new UserLoginSession();
                        userLoginSession.setSession_key(((UserLoginSession) obj).getSession_key());
                        userLoginSession.setOpenid(((UserLoginSession) obj).getOpenid());
                        return userLoginSession;
                    }
                }
                return null;
            }
        });
    }
}
