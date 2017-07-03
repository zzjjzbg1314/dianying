package com.gaofen.dianying.persistents.mapper.menu.test;

import com.gaofen.dianying.consistents.MovieConfig;
import com.gaofen.dianying.enums.FlagEnum;
import com.gaofen.dianying.persistents.entity.TDbMovieExample;
import com.gaofen.dianying.persistents.entity.TDbMovieWithBLOBs;
import com.gaofen.dianying.persistents.entity.TMoviePhotos;
import com.gaofen.dianying.persistents.entity.TMoviePhotosExample;
import com.gaofen.dianying.persistents.mapper.TDbMovieMapper;
import com.gaofen.dianying.persistents.mapper.TMoviePhotosMapper;
import com.gaofen.dianying.service.MovieServcie;
import com.gaofen.dianying.service.impl.UserLoginSesionImpl;
import com.gaofen.dianying.utils.HttpClientUtil;
import com.gaofen.dianying.utils.MovieUtil;
import net.sf.json.JSONObject;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/spring-context.xml")
public class TMovieTest {

    @Autowired
    MovieServcie movieServcie;

    @Autowired
    UserLoginSesionImpl userLoginSesionimpl;

    @Autowired
    private TDbMovieMapper tDbMovieMapper;


    @Autowired
    private TMoviePhotosMapper tMoviePhotosMapper;



    @Test
    public void TestMovie() {
        //1爱情 2励志 3家庭 4科幻  5奇幻  6动画  7犯罪  8悬疑  9战争  10记录 11华语   12印度      13冒险 14动作

        //MovieDetailInfo movieDetailInfo =movieServcie.queryMovieDetailInfoByMovieId(1);
        //movieServcie.insertDbMovieByDbApi(25824686,"脑残粉来了", 4);
        //movieServcie.queryMoviesByType("102");

        //this.testChangePohtosImageUrl();
    }


    private  void testChangePohtosImageUrl(){
        TMoviePhotosExample example = new TMoviePhotosExample();
        TMoviePhotosExample.Criteria c = example.createCriteria();
        c.andFlagEqualTo(FlagEnum.NORMAL.getCode());
        List<TMoviePhotos> list = tMoviePhotosMapper.selectByExample(example);
        if (CollectionUtils.isNotEmpty(list)) {
            //update
            for(TMoviePhotos tMoviePhoto:list) {
                this.updatePhotosImageUrl(tMoviePhoto);
            }
        }
    }


    private  void  updatePhotosImageUrl(TMoviePhotos photos){
        TMoviePhotosExample example = new TMoviePhotosExample();
        TMoviePhotosExample.Criteria c = example.createCriteria();
        c.andFlagEqualTo(FlagEnum.NORMAL.getCode());
        c.andIdEqualTo(photos.getId());
        TMoviePhotos newPhotos = new TMoviePhotos();
        if(StringUtils.isNotEmpty(photos.getPic_url())){
            newPhotos.setPic_url(MovieUtil.transforMovieImageUrl(photos.getPic_url()));
            tMoviePhotosMapper.updateByExampleSelective(newPhotos,example);
        }
    }
    private void testImageUrl(){
        /*List<TDbMovieWithBLOBs> list = movieServcie.queryAllMovies();
        if(CollectionUtils.isNotEmpty(list)){
            for(TDbMovieWithBLOBs movie:list){
                TDbMovieExample example = new TDbMovieExample();
                TDbMovieExample.Criteria c =example.createCriteria();
                c.andIdEqualTo(movie.getId());
                TDbMovieWithBLOBs newMovie = new TDbMovieWithBLOBs();
                *//*String getUrl = MovieConfig.DB_INFO + movie.getDb_id();
                String jsonReturn = HttpClientUtil.sendGetRequest(getUrl, "utf-8");
                JSONObject obj = new JSONObject().fromObject(jsonReturn);*//*
                // if (obj != null) {
                //String imgage=obj.getJSONObject("images").getString("medium");
                newMovie.setImages(MovieUtil.transforMovieImageUrl(movie.getImages()));
                //}
                tDbMovieMapper.updateByExampleSelective(newMovie,example);
            }
        }*/
    }

}
