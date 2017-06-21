package com.gaofen.dianying.enums;

/**
 * Created by zongjie on 2017/6/21.
 */
public enum FilmCategoryEnum {

    ALL(100,"全部"),
    HOTANDNEW(101,"最新"),
    SIXTEEN_YEAR_TOP(102,"2016豆瓣年度最热"),
    SEVTEEN_YEER_TOP(103,"2017豆瓣年度最热"),
    DOUBAN_TOP(104,"豆瓣top50");



    private int code;
    private String desc;

    private FilmCategoryEnum(int code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }
}
