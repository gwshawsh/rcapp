package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 订购明细表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-10 19:20:37
 */
public class OrderdetailEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//单据号
	private String billno;
	//序号
	private Long serialno;
	//商品id
	private Long goodid;
	//品名
	private String goodsname;
	//数量
	private Integer goodscount;
	//规格
	private String goodsspec;
	//用途
	private String goodsuse;
	//单价
	private Double goodsprice;
	//金额
	private Double goodscost;
	//需用日期
	private Date enddate;

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
	 * 设置：商品id
	 */
	public void setGoodid(Long goodid) {
		this.goodid = goodid;
	}
	/**
	 * 获取：商品id
	 */
	public Long getGoodid() {
		return goodid;
	}
	/**
	 * 设置：品名
	 */
	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname;
	}
	/**
	 * 获取：品名
	 */
	public String getGoodsname() {
		return goodsname;
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
	 * 设置：单价
	 */
	public void setGoodsprice(Double goodsprice) {
		this.goodsprice = goodsprice;
	}
	/**
	 * 获取：单价
	 */
	public Double getGoodsprice() {
		return goodsprice;
	}
	/**
	 * 设置：金额
	 */
	public void setGoodscost(Double goodscost) {
		this.goodscost = goodscost;
	}
	/**
	 * 获取：金额
	 */
	public Double getGoodscost() {
		return goodscost;
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
}
