package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 待办事项
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-05-17 12:11:08
 */
public class TodolistEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//待办名称
	private String title;
	//待办类型
	private Integer todotype;
	//创建日期
	private Date billdate;
	//业务数据
	private String billdata;
	//备注
	private String remark;
	//功能路径
	private String todourl;

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
	 * 设置：待办名称
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * 获取：待办名称
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * 设置：待办类型
	 */
	public void setTodotype(Integer todotype) {
		this.todotype = todotype;
	}
	/**
	 * 获取：待办类型
	 */
	public Integer getTodotype() {
		return todotype;
	}
	/**
	 * 设置：创建日期
	 */
	public void setBilldate(Date billdate) {
		this.billdate = billdate;
	}
	/**
	 * 获取：创建日期
	 */
	public Date getBilldate() {
		return billdate;
	}
	/**
	 * 设置：业务数据
	 */
	public void setBilldata(String billdata) {
		this.billdata = billdata;
	}
	/**
	 * 获取：业务数据
	 */
	public String getBilldata() {
		return billdata;
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
	/**
	 * 设置：功能路径
	 */
	public void setTodourl(String todourl) {
		this.todourl = todourl;
	}
	/**
	 * 获取：功能路径
	 */
	public String getTodourl() {
		return todourl;
	}
}
