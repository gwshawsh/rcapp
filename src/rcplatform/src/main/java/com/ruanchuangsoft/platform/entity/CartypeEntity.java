package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 车辆类型
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-17 16:28:44
 */
public class CartypeEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//编码
	private String cartypecode;
	//姓名
	private String cartypename;
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
	public void setCartypecode(String cartypecode) {
		this.cartypecode = cartypecode;
	}
	/**
	 * 获取：编码
	 */
	public String getCartypecode() {
		return cartypecode;
	}
	/**
	 * 设置：姓名
	 */
	public void setCartypename(String cartypename) {
		this.cartypename = cartypename;
	}
	/**
	 * 获取：姓名
	 */
	public String getCartypename() {
		return cartypename;
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
