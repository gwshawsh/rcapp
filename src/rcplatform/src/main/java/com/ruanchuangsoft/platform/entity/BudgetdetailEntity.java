package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 预算明细表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-05-22 16:47:18
 */
public class BudgetdetailEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//单据号
	private String billno;
	//序号
	private Integer serialno;
	//预算科目
	private Long accountid;
	//名称
	private String name;
	//用途
	private String usage;
	//说明
	private String remark;
	//预算金额
	private Double planmoney;
	//已用预算
	private String usagemoney;
	//剩余预算
	private Date leftmoney;
	//更新时间
	private Date uptdate;

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
	public void setSerialno(Integer serialno) {
		this.serialno = serialno;
	}
	/**
	 * 获取：序号
	 */
	public Integer getSerialno() {
		return serialno;
	}
	/**
	 * 设置：预算科目
	 */
	public void setAccountid(Long accountid) {
		this.accountid = accountid;
	}
	/**
	 * 获取：预算科目
	 */
	public Long getAccountid() {
		return accountid;
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
	 * 设置：用途
	 */
	public void setUsage(String usage) {
		this.usage = usage;
	}
	/**
	 * 获取：用途
	 */
	public String getUsage() {
		return usage;
	}
	/**
	 * 设置：说明
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}
	/**
	 * 获取：说明
	 */
	public String getRemark() {
		return remark;
	}
	/**
	 * 设置：预算金额
	 */
	public void setPlanmoney(Double planmoney) {
		this.planmoney = planmoney;
	}
	/**
	 * 获取：预算金额
	 */
	public Double getPlanmoney() {
		return planmoney;
	}
	/**
	 * 设置：已用预算
	 */
	public void setUsagemoney(String usagemoney) {
		this.usagemoney = usagemoney;
	}
	/**
	 * 获取：已用预算
	 */
	public String getUsagemoney() {
		return usagemoney;
	}
	/**
	 * 设置：剩余预算
	 */
	public void setLeftmoney(Date leftmoney) {
		this.leftmoney = leftmoney;
	}
	/**
	 * 获取：剩余预算
	 */
	public Date getLeftmoney() {
		return leftmoney;
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
}
