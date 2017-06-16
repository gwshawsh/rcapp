package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.ruanchuangsoft.platform.entity.OrderdetailEntity;


/**
 * 订购主表
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-16 19:17:49
 */
public class OrdermainEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    //
    private Long id;
    //单据号
    private String billno;
    //供应商id
    private Long supplyid;
    //请购单据号
    private String reqbillno;
    //请购人
    private String requser;
    //请购部门
    private Long deptid;
    //请购日期
    private Date reqdate;
    //订购单来源
    private Integer ordersource;
    //订购类别
    private Integer ordertype;
    //单据状态
    private Integer billstatus;
    //制单人
    private String makeuser;
    //制单日期
    private Date makedate;
    //审核人
    private String accuser;
    //审核日期
    private Date accdate;
    //更新时间
    private Date uptdate;


    //请购部门
    private String deptidname;


    //订购单来源
    private String ordersourceenumvaluename;


    //订购类别
    private String ordertypeenumvaluename;


    //单据状态
    private String billstatusenumvaluename;


    //单据明细
    private List<OrderdetailEntity> details;

    public void setDetails(List<OrderdetailEntity> details) {
        this.details = details;
    }

    public List<OrderdetailEntity> getDetails() {
        return details;
    }


    /**
     * 设置：
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * 获取：
     */
    public Long getId() {
        return id;
    }

    /**
     * 设置：单据号
     */
    public void setBillno(String billno) {
        this.billno = billno;
    }

    /**
     * 获取：单据号
     */
    public String getBillno() {
        return billno;
    }

    /**
     * 设置：供应商id
     */
    public void setSupplyid(Long supplyid) {
        this.supplyid = supplyid;
    }

    /**
     * 获取：供应商id
     */
    public Long getSupplyid() {
        return supplyid;
    }

    /**
     * 设置：请购单据号
     */
    public void setReqbillno(String reqbillno) {
        this.reqbillno = reqbillno;
    }

    /**
     * 获取：请购单据号
     */
    public String getReqbillno() {
        return reqbillno;
    }

    /**
     * 设置：请购人
     */
    public void setRequser(String requser) {
        this.requser = requser;
    }

    /**
     * 获取：请购人
     */
    public String getRequser() {
        return requser;
    }

    /**
     * 设置：请购部门
     */
    public void setDeptid(Long deptid) {
        this.deptid = deptid;
    }

    /**
     * 获取：请购部门
     */
    public Long getDeptid() {
        return deptid;
    }

    /**
     * 设置：请购日期
     */
    public void setReqdate(Date reqdate) {
        this.reqdate = reqdate;
    }

    /**
     * 获取：请购日期
     */
    public Date getReqdate() {
        return reqdate;
    }

    /**
     * 设置：订购单来源
     */
    public void setOrdersource(Integer ordersource) {
        this.ordersource = ordersource;
    }

    /**
     * 获取：订购单来源
     */
    public Integer getOrdersource() {
        return ordersource;
    }

    /**
     * 设置：订购类别
     */
    public void setOrdertype(Integer ordertype) {
        this.ordertype = ordertype;
    }

    /**
     * 获取：订购类别
     */
    public Integer getOrdertype() {
        return ordertype;
    }

    /**
     * 设置：单据状态
     */
    public void setBillstatus(Integer billstatus) {
        this.billstatus = billstatus;
    }

    /**
     * 获取：单据状态
     */
    public Integer getBillstatus() {
        return billstatus;
    }

    /**
     * 设置：制单人
     */
    public void setMakeuser(String makeuser) {
        this.makeuser = makeuser;
    }

    /**
     * 获取：制单人
     */
    public String getMakeuser() {
        return makeuser;
    }

    /**
     * 设置：制单日期
     */
    public void setMakedate(Date makedate) {
        this.makedate = makedate;
    }

    /**
     * 获取：制单日期
     */
    public Date getMakedate() {
        return makedate;
    }

    /**
     * 设置：审核人
     */
    public void setAccuser(String accuser) {
        this.accuser = accuser;
    }

    /**
     * 获取：审核人
     */
    public String getAccuser() {
        return accuser;
    }

    /**
     * 设置：审核日期
     */
    public void setAccdate(Date accdate) {
        this.accdate = accdate;
    }

    /**
     * 获取：审核日期
     */
    public Date getAccdate() {
        return accdate;
    }

    /**
     * 设置：更新时间
     */
    public void setUptdate(Date uptdate) {
        this.uptdate = uptdate;
    }

    /**
     * 获取：更新时间
     */
    public Date getUptdate() {
        return uptdate;
    }

    /**
     * 设置：请购部门name
     */
    public void setDeptidname(String name) {
        this.deptidname = name;
    }

    /**
     * 获取：请购部门name
     */
    public String getDeptidname() {
        return deptidname;
    }

    /**
     * 设置：订购单来源enumvaluename
     */
    public void setOrdersourceenumvaluename(String enumvaluename) {
        this.ordersourceenumvaluename = enumvaluename;
    }

    /**
     * 获取：订购单来源enumvaluename
     */
    public String getOrdersourceenumvaluename() {
        return ordersourceenumvaluename;
    }

    /**
     * 设置：订购类别enumvaluename
     */
    public void setOrdertypeenumvaluename(String enumvaluename) {
        this.ordertypeenumvaluename = enumvaluename;
    }

    /**
     * 获取：订购类别enumvaluename
     */
    public String getOrdertypeenumvaluename() {
        return ordertypeenumvaluename;
    }

    /**
     * 设置：单据状态enumvaluename
     */
    public void setBillstatusenumvaluename(String enumvaluename) {
        this.billstatusenumvaluename = enumvaluename;
    }

    /**
     * 获取：单据状态enumvaluename
     */
    public String getBillstatusenumvaluename() {
        return billstatusenumvaluename;
    }
}
