package com.gaofen.dianying.persistents.entity;

public class TDbMovieWithBLOBs extends TDbMovie {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_db_movie.summary
     *
     * @mbggenerated
     */
    private String summary;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_db_movie.summary
     *
     * @return the value of t_db_movie.summary
     *
     * @mbggenerated
     */
    public String getSummary() {
        return summary;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_db_movie.summary
     *
     * @param summary the value for t_db_movie.summary
     *
     * @mbggenerated
     */
    public void setSummary(String summary) {
        this.summary = summary == null ? null : summary.trim();
    }
}