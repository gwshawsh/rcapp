package com.ruanchuangsoft.platform.entity;

import com.ruanchuangsoft.platform.entity.AbstractEntity;

import java.io.Serializable;
import java.util.Date;


import java.math.BigDecimal;


/**
 * 请购明细表
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-28 12:03:18
 */
public class RequisitiondetailEntity extends AbstractEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    //
    private Long id;
    //单据号
    private String billno;
    //序号
    private Long serialno;
    //商品
    private Long goodsid;
    //采购部门
    private Long deptid;
    //数量
    private Integer goodscount;
    //规格
    private String goodsspec;
    //单位
    private String goodsunit;
    //用途
    private String goodsuse;
    //需用日期
    private Date enddate;
    //更新时间
    private Date uptdate;

    //商品
    private String goodsidname;
    //采购部门
    private String deptidname;

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
     * 设置：序号
     */
    public void setSerialno(Long serialno) {
        this.serialno = serialno;
    }

    /**
     * 获取：序号
     */
    public Long getSerialno() {
        return serialno;
    }

    /**
     * 设置：商品
     */
    public void setGoodsid(Long goodsid) {
        this.goodsid = goodsid;
    }

    /**
     * 获取：商品
     */
    public Long getGoodsid() {
        return goodsid;
    }

    /**
     * 设置：采购部门
     */
    public void setDeptid(Long deptid) {
        this.deptid = deptid;
    }

    /**
     * 获取：采购部门
     */
    public Long getDeptid() {
        return deptid;
    }

    /**
     * 设置：数量
     */
    public void setGoodscount(Integer goodscount) {
        this.goodscount = goodscount;
    }

    /**
     * 获取：数量
     */
    public Integer getGoodscount() {
        return goodscount;
    }

    /**
     * 设置：规格
     */
    public void setGoodsspec(String goodsspec) {
        this.goodsspec = goodsspec;
    }

    /**
     * 获取：规格
     */
    public String getGoodsspec() {
        return goodsspec;
    }

    /**
     * 设置：单位
     */
    public void setGoodsunit(String goodsunit) {
        this.goodsunit = goodsunit;
    }

    /**
     * 获取：单位
     */
    public String getGoodsunit() {
        return goodsunit;
    }

    /**
     * 设置：用途
     */
    public void setGoodsuse(String goodsuse) {
        this.goodsuse = goodsuse;
    }

    /**
     * 获取：用途
     */
    public String getGoodsuse() {
        return goodsuse;
    }

    /**
     * 设置：需用日期
     */
    public void setEnddate(Date enddate) {
        this.enddate = enddate;
    }

    /**
     * 获取：需用日期
     */
    public Date getEnddate() {
        return enddate;
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
     * 设置：商品name
     */
    public void setGoodsidname(String name) {
        this.goodsidname = name;
    }

    /**
     * 获取：商品name
     */
    public String getGoodsidname() {
        return goodsidname;
    }

    /**
     * 设置：采购部门name
     */
    public void setDeptidname(String name) {
        this.deptidname = name;
    }

    /**
     * 获取：采购部门name
     */
    public String getDeptidname() {
        return deptidname;
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
                "  <div class=\"el-form-item__content\"><a class='billno' onclick=\"openfunc('requisitiondetail/index','请购明细表')\"><span>" + getBillno() + "</span></a>\n" +
                "  </div> </div>");

        sb.append(" <div class=\"el-form-item\">\n" +
                "  <label class=\"el-form-item__label\">序号</label>" +
                "  <div class=\"el-form-item__content\"><span>" + getSerialno() + "</span>\n" +
                "  </div> </div>");

        sb.append(" <div class=\"el-form-item\">\n" +
                "  <label class=\"el-form-item__label\">商品</label>" +
                "  <div class=\"el-form-item__content\"><span>" + getGoodsidname() + "</span>\n" +
                "  </div> </div>");

        sb.append(" <div class=\"el-form-item\">\n" +
                "  <label class=\"el-form-item__label\">采购部门</label>" +
                "  <div class=\"el-form-item__content\"><span>" + getDeptidname() + "</span>\n" +
                "  </div> </div>");

        sb.append(" <div class=\"el-form-item\">\n" +
                "  <label class=\"el-form-item__label\">数量</label>" +
                "  <div class=\"el-form-item__content\"><span>" + getGoodscount() + "</span>\n" +
                "  </div> </div>");

        sb.append(" <div class=\"el-form-item\">\n" +
                "  <label class=\"el-form-item__label\">规格</label>" +
                "  <div class=\"el-form-item__content\"><span>" + getGoodsspec() + "</span>\n" +
                "  </div> </div>");

        sb.append(" <div class=\"el-form-item\">\n" +
                "  <label class=\"el-form-item__label\">单位</label>" +
                "  <div class=\"el-form-item__content\"><span>" + getGoodsunit() + "</span>\n" +
                "  </div> </div>");

        sb.append(" <div class=\"el-form-item\">\n" +
                "  <label class=\"el-form-item__label\">用途</label>" +
                "  <div class=\"el-form-item__content\"><span>" + getGoodsuse() + "</span>\n" +
                "  </div> </div>");

        sb.append(" <div class=\"el-form-item\">\n" +
                "  <label class=\"el-form-item__label\">需用日期</label>" +
                "  <div class=\"el-form-item__content\"><span>" + getEnddate() + "</span>\n" +
                "  </div> </div>");

        sb.append(" <div class=\"el-form-item\">\n" +
                "  <label class=\"el-form-item__label\">更新时间</label>" +
                "  <div class=\"el-form-item__content\"><span>" + getUptdate() + "</span>\n" +
                "  </div> </div>");

        sb.append("</form>");
        return sb.toString();

    }
}
