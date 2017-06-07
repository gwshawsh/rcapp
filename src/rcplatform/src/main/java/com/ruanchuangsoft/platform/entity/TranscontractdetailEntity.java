package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 运输合同明细
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-07 15:52:16
 */
public class TranscontractdetailEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//单据号
	private String billno;
	//序号
	private Long serialno;
	//线路
	private Long lineid;
	//箱型
	private String boxtype;
	//空重类型：0-空箱 1-重箱
	private String weighttype;
	//应付单价
	private Double boxprice;
	//含税应付单价
	private Double boxpricetax;
	//车型
	private String cartype;

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
	 * 设置：线路
	 */
	public void setLineid(Long lineid) {
		this.lineid = lineid;
	}
	/**
	 * 获取：线路
	 */
	public Long getLineid() {
		return lineid;
	}
	/**
	 * 设置：箱型
	 */
	public void setBoxtype(String boxtype) {
		this.boxtype = boxtype;
	}
	/**
	 * 获取：箱型
	 */
	public String getBoxtype() {
		return boxtype;
	}
	/**
	 * 设置：空重类型：0-空箱 1-重箱
	 */
	public void setWeighttype(String weighttype) {
		this.weighttype = weighttype;
	}
	/**
	 * 获取：空重类型：0-空箱 1-重箱
	 */
	public String getWeighttype() {
		return weighttype;
	}
	/**
	 * 设置：应付单价
	 */
	public void setBoxprice(Double boxprice) {
		this.boxprice = boxprice;
	}
	/**
	 * 获取：应付单价
	 */
	public Double getBoxprice() {
		return boxprice;
	}
	/**
	 * 设置：含税应付单价
	 */
	public void setBoxpricetax(Double boxpricetax) {
		this.boxpricetax = boxpricetax;
	}
	/**
	 * 获取：含税应付单价
	 */
	public Double getBoxpricetax() {
		return boxpricetax;
	}
	/**
	 * 设置：车型
	 */
	public void setCartype(String cartype) {
		this.cartype = cartype;
	}
	/**
	 * 获取：车型
	 */
	public String getCartype() {
		return cartype;
	}
}
