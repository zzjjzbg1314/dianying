package com.gaofen.dianying.persistent.mapper;

import com.gaofen.dianying.persistent.entity.TMovie;
import com.gaofen.dianying.persistent.entity.TMovieExample;
import com.gaofen.dianying.persistent.entity.TMovieKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TMovieMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_movie
     *
     * @mbggenerated
     */
    int countByExample(TMovieExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_movie
     *
     * @mbggenerated
     */
    int deleteByExample(TMovieExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_movie
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(TMovieKey key);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_movie
     *
     * @mbggenerated
     */
    int insert(TMovie record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_movie
     *
     * @mbggenerated
     */
    int insertSelective(TMovie record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_movie
     *
     * @mbggenerated
     */
    List<TMovie> selectByExample(TMovieExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_movie
     *
     * @mbggenerated
     */
    TMovie selectByPrimaryKey(TMovieKey key);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_movie
     *
     * @mbggenerated
     */
    int updateByExampleSelective(@Param("record") TMovie record, @Param("example") TMovieExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_movie
     *
     * @mbggenerated
     */
    int updateByExample(@Param("record") TMovie record, @Param("example") TMovieExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_movie
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(TMovie record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_movie
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(TMovie record);
}