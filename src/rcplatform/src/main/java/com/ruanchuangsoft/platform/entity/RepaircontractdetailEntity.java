package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.util.Date;


import java.math.BigDecimal;



/**
 * 机械维修合同明细
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 14:07:53
 */
public class RepaircontractdetailEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//单据号
	private String billno;
	//序号
	private Long serialno;
	//设备
	private Long goodsid;
	//箱型
	private Long boxtype;
	//空重类型
	private Long weighttype;
	//维修单价
	private BigDecimal price;
	//运输单价
	private BigDecimal transprice;
	//数量
	private BigDecimal goodsqty;
	//维修费用
	private BigDecimal total;

				        //设备
        private String goodsidname;
		        //箱型
        private String boxtypeboxsize;
		        //空重类型
        private String weighttypeenumvaluename;
					
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
	 * 设置：设备
	 */
	public void setGoodsid(Long goodsid) {
		this.goodsid = goodsid;
	}
	/**
	 * 获取：设备
	 */
	public Long getGoodsid() {
		return goodsid;
	}
	/**
	 * 设置：箱型
	 */
	public void setBoxtype(Long boxtype) {
		this.boxtype = boxtype;
	}
	/**
	 * 获取：箱型
	 */
	public Long getBoxtype() {
		return boxtype;
	}
	/**
	 * 设置：空重类型
	 */
	public void setWeighttype(Long weighttype) {
		this.weighttype = weighttype;
	}
	/**
	 * 获取：空重类型
	 */
	public Long getWeighttype() {
		return weighttype;
	}
	/**
	 * 设置：维修单价
	 */
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	/**
	 * 获取：维修单价
	 */
	public BigDecimal getPrice() {
		return price;
	}
	/**
	 * 设置：运输单价
	 */
	public void setTransprice(BigDecimal transprice) {
		this.transprice = transprice;
	}
	/**
	 * 获取：运输单价
	 */
	public BigDecimal getTransprice() {
		return transprice;
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
	 * 设置：维修费用
	 */
	public void setTotal(BigDecimal total) {
		this.total = total;
	}
	/**
	 * 获取：维修费用
	 */
	public BigDecimal getTotal() {
		return total;
	}


												        /**
         * 设置：设备name
         */
        public void setGoodsidname(String name) {
            this.goodsidname = name;
        }
        /**
         * 获取：设备name
         */
        public String getGoodsidname() {
            return goodsidname;
        }
        			        /**
         * 设置：箱型boxsize
         */
        public void setBoxtypeboxsize(String boxsize) {
            this.boxtypeboxsize = boxsize;
        }
        /**
         * 获取：箱型boxsize
         */
        public String getBoxtypeboxsize() {
            return boxtypeboxsize;
        }
        			        /**
         * 设置：空重类型enumvaluename
         */
        public void setWeighttypeenumvaluename(String enumvaluename) {
            this.weighttypeenumvaluename = enumvaluename;
        }
        /**
         * 获取：空重类型enumvaluename
         */
        public String getWeighttypeenumvaluename() {
            return weighttypeenumvaluename;
        }
        													}
