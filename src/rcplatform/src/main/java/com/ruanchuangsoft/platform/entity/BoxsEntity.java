package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 箱型基础信息表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-05-02 23:03:41
 */
public class BoxsEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//编码
	private String code;
	//箱型尺寸
	private String boxSize;
	//重量
	private String weight;

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
	 * 设置：箱型尺寸
	 */
	public void setBoxSize(String boxSize) {
		this.boxSize = boxSize;
	}
	/**
	 * 获取：箱型尺寸
	 */
	public String getBoxSize() {
		return boxSize;
	}
	/**
	 * 设置：重量
	 */
	public void setWeight(String weight) {
		this.weight = weight;
	}
	/**
	 * 获取：重量
	 */
	public String getWeight() {
		return weight;
	}
}
