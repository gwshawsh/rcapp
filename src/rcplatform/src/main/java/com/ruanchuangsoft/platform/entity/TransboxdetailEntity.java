package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 运输计划明细表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-05-30 23:44:01
 */
public class TransboxdetailEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//单据号
	private String billno;
	//序号
	private Long serialno;
	//放箱计划单据号
	private String reftakebillno;
	//放箱计划序号
	private Long refserialno;
	//原起运地点
	private Long startplaceid1;
	//现起运点
	private Long startplaceid2;
	//目的地
	private Long endplaceid2;
	//箱号
	private String boxno;
	//计划提箱时间
	private Date plantaketime;
	//实际提箱时间
	private Date realtaketime;
	//计划到场时间
	private Date planarrvetime;
	//实际到场时间
	private Date realarrvetime;
	//车牌号
	private String carno;
	//车型
	private String cartype;
	//司机编码
	private Long driversid;
	//司机姓名
	private String driversname;

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
	 * 设置：放箱计划单据号
	 */
	public void setReftakebillno(String reftakebillno) {
		this.reftakebillno = reftakebillno;
	}
	/**
	 * 获取：放箱计划单据号
	 */
	public String getReftakebillno() {
		return reftakebillno;
	}
	/**
	 * 设置：放箱计划序号
	 */
	public void setRefserialno(Long refserialno) {
		this.refserialno = refserialno;
	}
	/**
	 * 获取：放箱计划序号
	 */
	public Long getRefserialno() {
		return refserialno;
	}
	/**
	 * 设置：原起运地点
	 */
	public void setStartplaceid1(Long startplaceid1) {
		this.startplaceid1 = startplaceid1;
	}
	/**
	 * 获取：原起运地点
	 */
	public Long getStartplaceid1() {
		return startplaceid1;
	}
	/**
	 * 设置：现起运点
	 */
	public void setStartplaceid2(Long startplaceid2) {
		this.startplaceid2 = startplaceid2;
	}
	/**
	 * 获取：现起运点
	 */
	public Long getStartplaceid2() {
		return startplaceid2;
	}
	/**
	 * 设置：目的地
	 */
	public void setEndplaceid2(Long endplaceid2) {
		this.endplaceid2 = endplaceid2;
	}
	/**
	 * 获取：目的地
	 */
	public Long getEndplaceid2() {
		return endplaceid2;
	}
	/**
	 * 设置：箱号
	 */
	public void setBoxno(String boxno) {
		this.boxno = boxno;
	}
	/**
	 * 获取：箱号
	 */
	public String getBoxno() {
		return boxno;
	}
	/**
	 * 设置：计划提箱时间
	 */
	public void setPlantaketime(Date plantaketime) {
		this.plantaketime = plantaketime;
	}
	/**
	 * 获取：计划提箱时间
	 */
	public Date getPlantaketime() {
		return plantaketime;
	}
	/**
	 * 设置：实际提箱时间
	 */
	public void setRealtaketime(Date realtaketime) {
		this.realtaketime = realtaketime;
	}
	/**
	 * 获取：实际提箱时间
	 */
	public Date getRealtaketime() {
		return realtaketime;
	}
	/**
	 * 设置：计划到场时间
	 */
	public void setPlanarrvetime(Date planarrvetime) {
		this.planarrvetime = planarrvetime;
	}
	/**
	 * 获取：计划到场时间
	 */
	public Date getPlanarrvetime() {
		return planarrvetime;
	}
	/**
	 * 设置：实际到场时间
	 */
	public void setRealarrvetime(Date realarrvetime) {
		this.realarrvetime = realarrvetime;
	}
	/**
	 * 获取：实际到场时间
	 */
	public Date getRealarrvetime() {
		return realarrvetime;
	}
	/**
	 * 设置：车牌号
	 */
	public void setCarno(String carno) {
		this.carno = carno;
	}
	/**
	 * 获取：车牌号
	 */
	public String getCarno() {
		return carno;
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
	/**
	 * 设置：司机编码
	 */
	public void setDriversid(Long driversid) {
		this.driversid = driversid;
	}
	/**
	 * 获取：司机编码
	 */
	public Long getDriversid() {
		return driversid;
	}
	/**
	 * 设置：司机姓名
	 */
	public void setDriversname(String driversname) {
		this.driversname = driversname;
	}
	/**
	 * 获取：司机姓名
	 */
	public String getDriversname() {
		return driversname;
	}
}
