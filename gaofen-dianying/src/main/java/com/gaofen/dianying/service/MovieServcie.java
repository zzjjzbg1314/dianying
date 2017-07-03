package com.gaofen.dianying.service;

import com.gaofen.dianying.beans.MovieDetailInfo;
import com.gaofen.dianying.persistents.entity.TDbMovieWithBLOBs;
import com.gaofen.dianying.persistents.entity.TMovieComments;
import com.gaofen.dianying.persistents.entity.TMoviePhotos;
import com.gaofen.dianying.persistents.entity.TMovieStars;

import java.util.List;

/**
 * Created by zongjie on 2017/5/2.
 */
public interface MovieServcie {

    /**
     * 返回所有的电影信息
     * @return
     */
    List<TDbMovieWithBLOBs> queryAllMovies();

    /**
     * 通过type查找电影
     * @param type
     * @return
     */
    List<TDbMovieWithBLOBs> queryMoviesByType(String type);

    /**
     * 通过movieId 查找电影信息
     * @param movieId
     * @return
     */
    TDbMovieWithBLOBs queryMovieByMovieId(Integer movieId);

    /**
     * 通过MovieId返回电影详细信息
     * @param movieId
     * @return
     */
    MovieDetailInfo queryMovieDetailInfoByMovieId(Integer movieId);


    /**
     * 通过movieId 返回电影评论信息
     * @param movieId
     * @return
     */
    List<TMovieComments> findMovieCommentsByMovieId(Integer movieId);

    /**
     * 通过movieId 返回剧照信息
     * @param movieId
     * @return
     */
    List<TMoviePhotos> findMoviePhotosByMovieId(Integer movieId);

    /**
     * 通过movieId返回电影人信息
     * @param movieId
     * @return
     */
    List<TMovieStars> findMovieStarsByMovieId(Integer movieId);

    /**
     * 通过豆瓣api插入数据
     * @param dbId
     * @param film_review
     * @param type
     */
    void insertDbMovieByDbApi(Integer dbId ,String film_review,Integer type);

    /**
     * 发送百度云信息消息
     * @param movieId
     * @param uuid
     * @param form_id
     */
    void sendBdyMsg(Integer movieId,String uuid,String form_id);

    /**
     * 通过movieIDS 返回所有的电影信息
     * @param movieIDS
     * @return
     */
    List<TDbMovieWithBLOBs> queryByMovieIds(List<Integer> movieIDS);


    /**
     * 查询电影的剧照
     * @param movieId
     * @return
     */
    List<String> queryImageListByMovieId(Integer movieId);




}
