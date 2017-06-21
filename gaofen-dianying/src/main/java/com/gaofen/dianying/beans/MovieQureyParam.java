package com.gaofen.dianying.beans;

import java.util.List;

/**
 * Created by zongjie on 2017/5/23.
 */
public class MovieQureyParam {

    private  Integer movieId;

    private String typeStr;

    private String form_id;

    private String uuid;

    private List<Integer> movieIds;

    private String welcomeFlag;

    public Integer getMovieId() {
        return movieId;
    }

    public void setMovieId(Integer movieId) {
        this.movieId = movieId;
    }

    public String getTypeStr() {
        return typeStr;
    }

    public void setTypeStr(String typeStr) {
        this.typeStr = typeStr;
    }

    public String getForm_id() {
        return form_id;
    }

    public void setForm_id(String form_id) {
        this.form_id = form_id;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public List<Integer> getMovieIds() {
        return movieIds;
    }

    public void setMovieIds(List<Integer> movieIds) {
        this.movieIds = movieIds;
    }

    public String getWelcomeFlag() {
        return welcomeFlag;
    }

    public void setWelcomeFlag(String welcomeFlag) {
        this.welcomeFlag = welcomeFlag;
    }
}
