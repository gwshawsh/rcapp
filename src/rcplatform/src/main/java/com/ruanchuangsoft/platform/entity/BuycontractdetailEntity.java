package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.util.Date;


import java.math.BigDecimal;



/**
 * 采购合同明细
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 14:05:05
 */
public class BuycontractdetailEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//单据号
	private String billno;
	//序号
	private Long serialno;
	//品名
	private Long goodsid;
	//规格
	private String spec;
	//单位
	private String unit;
	//单价
	private BigDecimal price;
	//数量
	private BigDecimal goodsqty;
	//金额
	private BigDecimal total;
	//更新时间
	private Date uptdate;

				        //品名
        private String goodsidname;
							
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
	 * 设置：品名
	 */
	public void setGoodsid(Long goodsid) {
		this.goodsid = goodsid;
	}
	/**
	 * 获取：品名
	 */
	public Long getGoodsid() {
		return goodsid;
	}
	/**
	 * 设置：规格
	 */
	public void setSpec(String spec) {
		this.spec = spec;
	}
	/**
	 * 获取：规格
	 */
	public String getSpec() {
		return spec;
	}
	/**
	 * 设置：单位
	 */
	public void setUnit(String unit) {
		this.unit = unit;
	}
	/**
	 * 获取：单位
	 */
	public String getUnit() {
		return unit;
	}
	/**
	 * 设置：单价
	 */
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	/**
	 * 获取：单价
	 */
	public BigDecimal getPrice() {
		return price;
	}
	/**
	 * 设置：数量
	 */
	public void setGoodsqty(BigDecimal goodsqty) {
		this.goodsqty = goodsqty;
	}
	/**
	 * 获取：数量
	 */
	public BigDecimal getGoodsqty() {
		return goodsqty;
	}
	/**
	 * 设置：金额
	 */
	public void setTotal(BigDecimal total) {
		this.total = total;
	}
	/**
	 * 获取：金额
	 */
	public BigDecimal getTotal() {
		return total;
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
         * 设置：品名name
         */
        public void setGoodsidname(String name) {
            this.goodsidname = name;
        }
        /**
         * 获取：品名name
         */
        public String getGoodsidname() {
            return goodsidname;
        }
        																			}
