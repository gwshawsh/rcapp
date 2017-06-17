package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 币别
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-17 16:28:44
 */
public class BoctypeEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//编码
	private String boctypecode;
	//币名
	private String boctypename;
	//汇率
	private Double rate;
	//单位
	private String unit;
	//更新时间
	private Date uptdate;
	//备注
	private String remark;


	


	


	


	


	


	


	


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
	 * 设置：编码
	 */
	public void setBoctypecode(String boctypecode) {
		this.boctypecode = boctypecode;
	}
	/**
	 * 获取：编码
	 */
	public String getBoctypecode() {
		return boctypecode;
	}
	/**
	 * 设置：币名
	 */
	public void setBoctypename(String boctypename) {
		this.boctypename = boctypename;
	}
	/**
	 * 获取：币名
	 */
	public String getBoctypename() {
		return boctypename;
	}
	/**
	 * 设置：汇率
	 */
	public void setRate(Double rate) {
		this.rate = rate;
	}
	/**
	 * 获取：汇率
	 */
	public Double getRate() {
		return rate;
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


																						}
