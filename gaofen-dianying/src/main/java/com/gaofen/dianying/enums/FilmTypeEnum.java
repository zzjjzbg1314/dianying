package com.gaofen.dianying.enums;

/**
 * Created by zongjie on 2017/5/25.
 */
public enum FilmTypeEnum {
    //1爱情 2励志 3家庭 4科幻  5奇幻  6动画  7犯罪  8悬疑  9战争  10记录 11华语   12印度      13冒险 14动作

    LOVE(1,"爱情"),
    INSPIRATIONAL(2,"励志"),
    HOME(3,"家庭"),
    SCIENCEFICTION(4,"科幻"),
    FANTASY(5,"奇幻"),
    ANIMATION(6,"动画"),
    CRIME(7,"犯罪"),
    SUSPENSE(8,"悬疑"),
    WAR(9,"战争"),
    RECORD(10,"记录"),
    CHINESE(11,"华语"),
    INDIA(12,"印度"),
    ADVENTURE(13,"冒险"),
    MOTION(14,"动作");


    private int code;
    private String desc;

    private FilmTypeEnum(int code, String desc){
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
