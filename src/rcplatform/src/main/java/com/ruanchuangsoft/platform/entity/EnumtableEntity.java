package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 枚举表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-16 19:00:00
 */
public class EnumtableEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//枚举类型
	private String enumtype;
	//枚举值
	private Integer enumvalueid;
	//枚举名称
	private String enumvaluename;
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
	 * 设置：枚举类型
	 */
	public void setEnumtype(String enumtype) {
		this.enumtype = enumtype;
	}
	/**
	 * 获取：枚举类型
	 */
	public String getEnumtype() {
		return enumtype;
	}
	/**
	 * 设置：枚举值
	 */
	public void setEnumvalueid(Integer enumvalueid) {
		this.enumvalueid = enumvalueid;
	}
	/**
	 * 获取：枚举值
	 */
	public Integer getEnumvalueid() {
		return enumvalueid;
	}
	/**
	 * 设置：枚举名称
	 */
	public void setEnumvaluename(String enumvaluename) {
		this.enumvaluename = enumvaluename;
	}
	/**
	 * 获取：枚举名称
	 */
	public String getEnumvaluename() {
		return enumvaluename;
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
