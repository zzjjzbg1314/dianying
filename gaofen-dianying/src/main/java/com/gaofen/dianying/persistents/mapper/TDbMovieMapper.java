package com.gaofen.dianying.persistents.mapper;

import com.gaofen.dianying.persistents.entity.TDbMovie;
import com.gaofen.dianying.persistents.entity.TDbMovieExample;
import com.gaofen.dianying.persistents.entity.TDbMovieKey;
import com.gaofen.dianying.persistents.entity.TDbMovieWithBLOBs;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TDbMovieMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_db_movie
     *
     * @mbggenerated
     */
    int countByExample(TDbMovieExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_db_movie
     *
     * @mbggenerated
     */
    int deleteByExample(TDbMovieExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_db_movie
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(TDbMovieKey key);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_db_movie
     *
     * @mbggenerated
     */
    int insert(TDbMovieWithBLOBs record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_db_movie
     *
     * @mbggenerated
     */
    int insertSelective(TDbMovieWithBLOBs record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_db_movie
     *
     * @mbggenerated
     */
    List<TDbMovieWithBLOBs> selectByExampleWithBLOBs(TDbMovieExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_db_movie
     *
     * @mbggenerated
     */
    List<TDbMovie> selectByExample(TDbMovieExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_db_movie
     *
     * @mbggenerated
     */
    TDbMovieWithBLOBs selectByPrimaryKey(TDbMovieKey key);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_db_movie
     *
     * @mbggenerated
     */
    int updateByExampleSelective(@Param("record") TDbMovieWithBLOBs record, @Param("example") TDbMovieExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_db_movie
     *
     * @mbggenerated
     */
    int updateByExampleWithBLOBs(@Param("record") TDbMovieWithBLOBs record, @Param("example") TDbMovieExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_db_movie
     *
     * @mbggenerated
     */
    int updateByExample(@Param("record") TDbMovie record, @Param("example") TDbMovieExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_db_movie
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(TDbMovieWithBLOBs record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_db_movie
     *
     * @mbggenerated
     */
    int updateByPrimaryKeyWithBLOBs(TDbMovieWithBLOBs record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_db_movie
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(TDbMovie record);
}