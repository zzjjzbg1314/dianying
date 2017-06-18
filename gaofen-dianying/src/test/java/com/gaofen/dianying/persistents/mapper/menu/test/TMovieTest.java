package com.gaofen.dianying.persistents.mapper.menu.test;

import com.gaofen.dianying.service.MovieServcie;
import com.gaofen.dianying.service.impl.UserLoginSesionImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/spring-context.xml")
public class TMovieTest {

    @Autowired
    MovieServcie movieServcie;

    @Autowired
    UserLoginSesionImpl userLoginSesionimpl;


    @Test
    public void TestMovie() {
        //1爱情 2励志 3家庭 4科幻  5奇幻  6动画  7犯罪  8悬疑  9战争  10记录 11华语   12印度      13冒险 14动作

        //MovieDetailInfo movieDetailInfo =movieServcie.queryMovieDetailInfoByMovieId(1);
        //movieServcie.insertDbMovieByDbApi(6311303,"说一句，年轻的船长真他妈的帅!", 5);
        movieServcie.queryByJsonConfig();


    }

}
