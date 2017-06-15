package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 付款明细表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-15 10:53:56
 */
public class PaymentdetailEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//单据号
	private String billno;
	//序号
	private Long serialno;
	//物品名
	private String goodsname;
	//物品数量
	private Integer goodscount;
	//物品单价
	private Double goodscost;
	//物品规格
	private String goodsspec;
	//物品用途
	private String goodsuse;
	//物品需用日期
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
	 * 设置：物品名
	 */
	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname;
	}
	/**
	 * 获取：物品名
	 */
	public String getGoodsname() {
		return goodsname;
	}
	/**
	 * 设置：物品数量
	 */
	public void setGoodscount(Integer goodscount) {
		this.goodscount = goodscount;
	}
	/**
	 * 获取：物品数量
	 */
	public Integer getGoodscount() {
		return goodscount;
	}
	/**
	 * 设置：物品单价
	 */
	public void setGoodscost(Double goodscost) {
		this.goodscost = goodscost;
	}
	/**
	 * 获取：物品单价
	 */
	public Double getGoodscost() {
		return goodscost;
	}
	/**
	 * 设置：物品规格
	 */
	public void setGoodsspec(String goodsspec) {
		this.goodsspec = goodsspec;
	}
	/**
	 * 获取：物品规格
	 */
	public String getGoodsspec() {
		return goodsspec;
	}
	/**
	 * 设置：物品用途
	 */
	public void setGoodsuse(String goodsuse) {
		this.goodsuse = goodsuse;
	}
	/**
	 * 获取：物品用途
	 */
	public String getGoodsuse() {
		return goodsuse;
	}
	/**
	 * 设置：物品需用日期
	 */
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}
	/**
	 * 获取：物品需用日期
	 */
	public Date getEnddate() {
		return enddate;
	}
}
