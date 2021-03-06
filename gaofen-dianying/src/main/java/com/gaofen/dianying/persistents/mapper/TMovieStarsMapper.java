package com.gaofen.dianying.persistents.mapper;

import com.gaofen.dianying.persistents.entity.TMovieStars;
import com.gaofen.dianying.persistents.entity.TMovieStarsExample;
import com.gaofen.dianying.persistents.entity.TMovieStarsKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TMovieStarsMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_movie_stars
     *
     * @mbggenerated
     */
    int countByExample(TMovieStarsExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_movie_stars
     *
     * @mbggenerated
     */
    int deleteByExample(TMovieStarsExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_movie_stars
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(TMovieStarsKey key);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_movie_stars
     *
     * @mbggenerated
     */
    int insert(TMovieStars record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_movie_stars
     *
     * @mbggenerated
     */
    int insertSelective(TMovieStars record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_movie_stars
     *
     * @mbggenerated
     */
    List<TMovieStars> selectByExample(TMovieStarsExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_movie_stars
     *
     * @mbggenerated
     */
    TMovieStars selectByPrimaryKey(TMovieStarsKey key);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_movie_stars
     *
     * @mbggenerated
     */
    int updateByExampleSelective(@Param("record") TMovieStars record, @Param("example") TMovieStarsExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_movie_stars
     *
     * @mbggenerated
     */
    int updateByExample(@Param("record") TMovieStars record, @Param("example") TMovieStarsExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_movie_stars
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(TMovieStars record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_movie_stars
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(TMovieStars record);
}