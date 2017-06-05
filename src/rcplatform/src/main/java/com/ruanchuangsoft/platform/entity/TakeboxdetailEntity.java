package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 放箱计划明细表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-05-28 10:49:15
 */
public class TakeboxdetailEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//单据号
	private String billno;
	//序号
	private Long serialno;
	//运输公司
	private Long transcompanyid;
	//原起运地点
	private Long startplaceid1;
	//现起运点
	private Long startplaceid2;
	//目的地
	private Long endplaceid;
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
	//应收费用
	private Double yingshou;
	//应付费用
	private Double yingfu;

	private String transcompanyname;
	private String startplacename1;
	private String startplacename2;
	private String endplacename;


	public String getTranscompanyname() {
		return transcompanyname;
	}

	public void setTranscompanyname(String transcompanyname) {
		this.transcompanyname = transcompanyname;
	}

	public String getStartplacename1() {
		return startplacename1;
	}

	public void setStartplacename1(String startplacename1) {
		this.startplacename1 = startplacename1;
	}

	public String getStartplacename2() {
		return startplacename2;
	}

	public void setStartplacename2(String startplacename2) {
		this.startplacename2 = startplacename2;
	}

	public String getEndplacename() {
		return endplacename;
	}

	public void setEndplacename(String endplacename) {
		this.endplacename = endplacename;
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
	 * 设置：运输公司
	 */
	public void setTranscompanyid(Long transcompanyid) {
		this.transcompanyid = transcompanyid;
	}
	/**
	 * 获取：运输公司
	 */
	public Long getTranscompanyid() {
		return transcompanyid;
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
	public void setEndplaceid(Long endplaceid) {
		this.endplaceid = endplaceid;
	}
	/**
	 * 获取：目的地
	 */
	public Long getEndplaceid() {
		return endplaceid;
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
	 * 设置：应收费用
	 */
	public void setYingshou(Double yingshou) {
		this.yingshou = yingshou;
	}
	/**
	 * 获取：应收费用
	 */
	public Double getYingshou() {
		return yingshou;
	}
	/**
	 * 设置：应付费用
	 */
	public void setYingfu(Double yingfu) {
		this.yingfu = yingfu;
	}
	/**
	 * 获取：应付费用
	 */
	public Double getYingfu() {
		return yingfu;
	}
}