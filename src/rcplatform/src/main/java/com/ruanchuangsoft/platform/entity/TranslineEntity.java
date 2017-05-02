package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 线路基础信息表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-05-02 23:01:31
 */
public class TranslineEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//编码
	private String code;
	//起始区域地点
	private String startlocation;
	//结束区域地点
	private String endlocation;
	//距离
	private Double distance;
	//运费
	private Double freight;

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
	public void setCode(String code) {
		this.code = code;
	}
	/**
	 * 获取：编码
	 */
	public String getCode() {
		return code;
	}
	/**
	 * 设置：起始区域地点
	 */
	public void setStartlocation(String startlocation) {
		this.startlocation = startlocation;
	}
	/**
	 * 获取：起始区域地点
	 */
	public String getStartlocation() {
		return startlocation;
	}
	/**
	 * 设置：结束区域地点
	 */
	public void setEndlocation(String endlocation) {
		this.endlocation = endlocation;
	}
	/**
	 * 获取：结束区域地点
	 */
	public String getEndlocation() {
		return endlocation;
	}
	/**
	 * 设置：距离
	 */
	public void setDistance(Double distance) {
		this.distance = distance;
	}
	/**
	 * 获取：距离
	 */
	public Double getDistance() {
		return distance;
	}
	/**
	 * 设置：运费
	 */
	public void setFreight(Double freight) {
		this.freight = freight;
	}
	/**
	 * 获取：运费
	 */
	public Double getFreight() {
		return freight;
	}
}
