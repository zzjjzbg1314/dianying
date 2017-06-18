package com.gaofen.dianying.common;

/**
 * Created by zongjie on 2017/5/2.
 */
public class NewServiceResult {

    public static final Integer INTERNAL_ERROR = 500;
    public static final Integer SERVICE_EXCEPTION = 501;
    public static final Integer PARAM_ERROR = 999;
    public static final int AUTHORITY_ERROR = 401;
    public static final Integer SUCCESS = 200;
    public static final Integer INPUT_ERROR = 402;

    private Integer code = SUCCESS;
    private String msg;
    private Object data;

    public NewServiceResult(Integer code, String msg, Object data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public NewServiceResult() {
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public Object getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public static NewServiceResult fail(String msg, Object data) {
        return new NewServiceResult(INTERNAL_ERROR, msg, data);
    }

    public static NewServiceResult fail() {
        NewServiceResult serviceResult = new NewServiceResult();
        serviceResult.setCode(INTERNAL_ERROR);
        serviceResult.setMsg("error");
        return serviceResult;
    }

    public static NewServiceResult success(String msg, Object data) {
        return new NewServiceResult(SUCCESS, msg, data);
    }

    public static NewServiceResult success( Object data) {
        NewServiceResult serviceResult = new NewServiceResult();
        serviceResult.setCode(SUCCESS);
        serviceResult.setData(data);
        serviceResult.setMsg("success");
        return serviceResult;

    }
}
