package com.ruanchuangsoft.platform.webservice;

import java.io.Serializable;

/**
 * Created by lidongfeng on 2017/6/5.
 */
public class SoapComResult implements Serializable{
    private int code;

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    private String message;
}
