package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;

/**
 * Created by lidongfeng on 2017/7/17.
 */
public class TodoAuditParam implements Serializable {
    private String usercode;
    private String billtype;
    private String billno;
    private String comments;
    private boolean pass;//是否通过

    public String getUsercode() {
        return usercode;
    }

    public void setUsercode(String usercode) {
        this.usercode = usercode;
    }

    public String getBilltype() {
        return billtype;
    }

    public void setBilltype(String billtype) {
        this.billtype = billtype;
    }

    public String getBillno() {
        return billno;
    }

    public void setBillno(String billno) {
        this.billno = billno;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public boolean isPass() {
        return pass;
    }

    public void setPass(boolean pass) {
        this.pass = pass;
    }
}
