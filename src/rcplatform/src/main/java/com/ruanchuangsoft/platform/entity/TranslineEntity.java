package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 线路管理
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-07 15:36:40
 */
public class TranslineEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//编码
	private String code;
	//起始地点
	private Long startlocation;
	//结束地点
	private Long endlocation;
	//距离
	private Double distance;
	//助记码
	private String helpcode;


	private String startname;
	private String endname;

	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStartname() {
		return startname;
	}

	public void setStartname(String startname) {
		this.startname = startname;
	}

	public String getEndname() {
		return endname;
	}

	public void setEndname(String endname) {
		this.endname = endname;
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
	 * 设置：起始地点
	 */
	public void setStartlocation(Long startlocation) {
		this.startlocation = startlocation;
	}
	/**
	 * 获取：起始地点
	 */
	public Long getStartlocation() {
		return startlocation;
	}
	/**
	 * 设置：结束地点
	 */
	public void setEndlocation(Long endlocation) {
		this.endlocation = endlocation;
	}
	/**
	 * 获取：结束地点
	 */
	public Long getEndlocation() {
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
	 * 设置：助记码
	 */
	public void setHelpcode(String helpcode) {
		this.helpcode = helpcode;
	}
	/**
	 * 获取：助记码
	 */
	public String getHelpcode() {
		return helpcode;
	}
}
