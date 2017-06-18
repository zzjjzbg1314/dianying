package com.gaofen.dianying.enums;

/**
 * Created by zongjie on 2017/5/1.
 */
public enum FlagEnum {

    DELETE(0,"刪除"),
    NORMAL(1,"正常");

    private int code;
    private String desc;

    private FlagEnum(int code, String desc){
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
