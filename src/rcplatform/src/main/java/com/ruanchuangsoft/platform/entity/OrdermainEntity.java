package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.ruanchuangsoft.platform.entity.OrderdetailEntity;

import java.math.BigDecimal;


/**
 * 订购单
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-23 17:35:42
 */
public class OrdermainEntity extends AbstractEntity implements Serializable {
    private static final long serialVersionUID = 1L;
    public static final String type = "order";

    public  String getType() {
        return type;
    }
    //
    private Long id;
    //单据号
    private String billno;
    //供应商
    private Long supplyid;
    //请购单据号
    private String reqbillno;
    //请购人
    private Long requser;
    //请购部门
    private Long deptid;
    //请购日期
    private Date reqdate;
    //订购单来源
    private Integer ordersource;
    //订购类别
    private Integer ordertype;
    //预算计划
    private Long budgetmainid;
    //总金额
    private BigDecimal total;
    //已支付金额
    private BigDecimal paytotal;
    //单据状态
    private Integer billstatus;
    //备注
    private String remark;
    //制单人
    private Long makeuser;
    //制单日期
    private Date makedate;
    //审核人
    private Long accuser;
    //审核日期
    private Date accdate;
    //更新时间
    private Date uptdate;
    //流程ID
    private String pocessinstanceid;


    //供应商
    private String supplyidname;


    //请购人
    private String requserfullname;


    //请购部门
    private String deptidname;


    //订购单来源
    private String ordersourceenumvaluename;


    //订购类别
    private String ordertypeenumvaluename;


    //预算计划
    private String budgetmainidbillno;


    //单据状态
    private String billstatusenumvaluename;


    //制单人
    private String makeuserfullname;


    //审核人
    private String accuserfullname;


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
     * 设置：供应商
     */
    public void setSupplyid(Long supplyid) {
        this.supplyid = supplyid;
    }

    /**
     * 获取：供应商
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
    public void setRequser(Long requser) {
        this.requser = requser;
    }

    /**
     * 获取：请购人
     */
    public Long getRequser() {
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
     * 设置：预算计划
     */
    public void setBudgetmainid(Long budgetmainid) {
        this.budgetmainid = budgetmainid;
    }

    /**
     * 获取：预算计划
     */
    public Long getBudgetmainid() {
        return budgetmainid;
    }

    /**
     * 设置：总金额
     */
    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    /**
     * 获取：总金额
     */
    public BigDecimal getTotal() {
        return total;
    }

    /**
     * 设置：已支付金额
     */
    public void setPaytotal(BigDecimal paytotal) {
        this.paytotal = paytotal;
    }

    /**
     * 获取：已支付金额
     */
    public BigDecimal getPaytotal() {
        return paytotal;
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
     * 设置：备注
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * 获取：备注
     */
    public String getRemark() {
        return remark;
    }

    /**
     * 设置：制单人
     */
    public void setMakeuser(Long makeuser) {
        this.makeuser = makeuser;
    }

    /**
     * 获取：制单人
     */
    public Long getMakeuser() {
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
    public void setAccuser(Long accuser) {
        this.accuser = accuser;
    }

    /**
     * 获取：审核人
     */
    public Long getAccuser() {
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
     * 设置：流程ID
     */
    public void setPocessinstanceid(String pocessinstanceid) {
        this.pocessinstanceid = pocessinstanceid;
    }

    /**
     * 获取：流程ID
     */
    public String getPocessinstanceid() {
        return pocessinstanceid;
    }

    /**
     * 设置：供应商name
     */
    public void setSupplyidname(String name) {
        this.supplyidname = name;
    }

    /**
     * 获取：供应商name
     */
    public String getSupplyidname() {
        return supplyidname;
    }

    /**
     * 设置：请购人fullname
     */
    public void setRequserfullname(String fullname) {
        this.requserfullname = fullname;
    }

    /**
     * 获取：请购人fullname
     */
    public String getRequserfullname() {
        return requserfullname;
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
     * 设置：预算计划billno
     */
    public void setBudgetmainidbillno(String billno) {
        this.budgetmainidbillno = billno;
    }

    /**
     * 获取：预算计划billno
     */
    public String getBudgetmainidbillno() {
        return budgetmainidbillno;
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

    /**
     * 设置：制单人fullname
     */
    public void setMakeuserfullname(String fullname) {
        this.makeuserfullname = fullname;
    }

    /**
     * 获取：制单人fullname
     */
    public String getMakeuserfullname() {
        return makeuserfullname;
    }

    /**
     * 设置：审核人fullname
     */
    public void setAccuserfullname(String fullname) {
        this.accuserfullname = fullname;
    }

    /**
     * 获取：审核人fullname
     */
    public String getAccuserfullname() {
        return accuserfullname;
    }

    /**
     * To string string.
     * 构造单据的描述内容
     *
     * @return the string
     */
    @Override
    public String toString() {
        StringBuffer sb = new StringBuffer("<form class=\"el-form rcp-table-expand el-form--label-left el-form--inline\">");

        sb.append(" <div class=\"el-form-item\">\n" +
                "  <label class=\"el-form-item__label\">单据号</label>" +
                "  <div class=\"el-form-item__content\"><a class='billno' onclick=\"openfunc('ordermain/index','订购单')\"><span>" + getBillno() + "</span></a>\n" +
                "  </div> </div>");

        sb.append(" <div class=\"el-form-item\">\n" +
                "  <label class=\"el-form-item__label\">供应商</label>" +
                "  <div class=\"el-form-item__content\"><span>" + getSupplyidname() + "</span>\n" +
                "  </div> </div>");

        sb.append(" <div class=\"el-form-item\">\n" +
                "  <label class=\"el-form-item__label\">请购单据号</label>" +
                "  <div class=\"el-form-item__content\"><span>" + getReqbillno() + "</span>\n" +
                "  </div> </div>");

        sb.append(" <div class=\"el-form-item\">\n" +
                "  <label class=\"el-form-item__label\">请购人</label>" +
                "  <div class=\"el-form-item__content\"><span>" + getRequserfullname() + "</span>\n" +
                "  </div> </div>");

        sb.append(" <div class=\"el-form-item\">\n" +
                "  <label class=\"el-form-item__label\">请购部门</label>" +
                "  <div class=\"el-form-item__content\"><span>" + getDeptidname() + "</span>\n" +
                "  </div> </div>");

        sb.append(" <div class=\"el-form-item\">\n" +
                "  <label class=\"el-form-item__label\">请购日期</label>" +
                "  <div class=\"el-form-item__content\"><span>" + getReqdate() + "</span>\n" +
                "  </div> </div>");

        sb.append(" <div class=\"el-form-item\">\n" +
                "  <label class=\"el-form-item__label\">订购单来源</label>" +
                "  <div class=\"el-form-item__content\"><span>" + getOrdersourceenumvaluename() + "</span>\n" +
                "  </div> </div>");

        sb.append(" <div class=\"el-form-item\">\n" +
                "  <label class=\"el-form-item__label\">订购类别</label>" +
                "  <div class=\"el-form-item__content\"><span>" + getOrdertypeenumvaluename() + "</span>\n" +
                "  </div> </div>");

        sb.append(" <div class=\"el-form-item\">\n" +
                "  <label class=\"el-form-item__label\">预算计划</label>" +
                "  <div class=\"el-form-item__content\"><span>" + getBudgetmainidbillno() + "</span>\n" +
                "  </div> </div>");

        sb.append(" <div class=\"el-form-item\">\n" +
                "  <label class=\"el-form-item__label\">总金额</label>" +
                "  <div class=\"el-form-item__content\"><span>" + getTotal() + "</span>\n" +
                "  </div> </div>");

        sb.append(" <div class=\"el-form-item\">\n" +
                "  <label class=\"el-form-item__label\">已支付金额</label>" +
                "  <div class=\"el-form-item__content\"><span>" + getPaytotal() + "</span>\n" +
                "  </div> </div>");

        sb.append(" <div class=\"el-form-item\">\n" +
                "  <label class=\"el-form-item__label\">单据状态</label>" +
                "  <div class=\"el-form-item__content\"><span>" + getBillstatusenumvaluename() + "</span>\n" +
                "  </div> </div>");

        sb.append(" <div class=\"el-form-item\">\n" +
                "  <label class=\"el-form-item__label\">备注</label>" +
                "  <div class=\"el-form-item__content\"><span>" + getRemark() + "</span>\n" +
                "  </div> </div>");

        sb.append(" <div class=\"el-form-item\">\n" +
                "  <label class=\"el-form-item__label\">制单人</label>" +
                "  <div class=\"el-form-item__content\"><span>" + getMakeuserfullname() + "</span>\n" +
                "  </div> </div>");

        sb.append(" <div class=\"el-form-item\">\n" +
                "  <label class=\"el-form-item__label\">制单日期</label>" +
                "  <div class=\"el-form-item__content\"><span>" + getMakedate() + "</span>\n" +
                "  </div> </div>");

        sb.append(" <div class=\"el-form-item\">\n" +
                "  <label class=\"el-form-item__label\">审核人</label>" +
                "  <div class=\"el-form-item__content\"><span>" + getAccuserfullname() + "</span>\n" +
                "  </div> </div>");

        sb.append(" <div class=\"el-form-item\">\n" +
                "  <label class=\"el-form-item__label\">审核日期</label>" +
                "  <div class=\"el-form-item__content\"><span>" + getAccdate() + "</span>\n" +
                "  </div> </div>");

        sb.append(" <div class=\"el-form-item\">\n" +
                "  <label class=\"el-form-item__label\">更新时间</label>" +
                "  <div class=\"el-form-item__content\"><span>" + getUptdate() + "</span>\n" +
                "  </div> </div>");


        sb.append("</form>");
        return sb.toString();

    }
}
