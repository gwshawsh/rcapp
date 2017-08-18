package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;

/**
 * 用来给手机端查询当前需要审批的任务
 * Created by lidongfeng on 2017/7/17.
 */
public class TodoQueryParam implements Serializable {
    private String usercode;
    private String billtype;
    private int page =1;
    private int limit = 100;

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

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }
}
