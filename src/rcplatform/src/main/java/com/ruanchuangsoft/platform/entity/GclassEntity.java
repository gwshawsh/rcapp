package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.util.Date;

import java.math.BigDecimal;



/**
 * 品类表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-20 19:02:25
 */
public class GclassEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//上级类别ID
	private Long parentid;
	//名称
	private String name;
	//编码
	private Integer code;


	


	


	


	


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
	 * 设置：上级类别ID
	 */
	public void setParentid(Long parentid) {
		this.parentid = parentid;
	}
	/**
	 * 获取：上级类别ID
	 */
	public Long getParentid() {
		return parentid;
	}
	/**
	 * 设置：名称
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * 获取：名称
	 */
	public String getName() {
		return name;
	}
	/**
	 * 设置：编码
	 */
	public void setCode(Integer code) {
		this.code = code;
	}
	/**
	 * 获取：编码
	 */
	public Integer getCode() {
		return code;
	}


													}
