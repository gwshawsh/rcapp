package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;


/**
 * 预算计划主表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-05-22 16:37:43
 */
public class BudgetformEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//单据号
	private String billno;
	//计划开始日期
	private String begindate;
	//计划结束日期
	private String enddate;
	//部门
	private Long deptId;
	//预算类型
	private String billtype;
	//状态
	private Integer billstatus;
	//制单人
	private String mkuser;
	//制单日期
	private Date mkdate;
	//审核人
	private String accuser;
	//审核日期
	private Date accdate;
	//签批人
	private String rzuser;
	//签批日期
	private Date rzdate;
	//更新时间
	private Date uptdate;

	private List<BudgetdetailEntity> details;

	public List<BudgetdetailEntity> getDetails() {
		return details;
	}

	public void setDetails(List<BudgetdetailEntity> details) {
		this.details = details;
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
	 * 设置：计划开始日期
	 */
	public void setBegindate(String begindate) {
		this.begindate = begindate;
	}
	/**
	 * 获取：计划开始日期
	 */
	public String getBegindate() {
		return begindate;
	}
	/**
	 * 设置：计划结束日期
	 */
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	/**
	 * 获取：计划结束日期
	 */
	public String getEnddate() {
		return enddate;
	}
	/**
	 * 设置：部门
	 */
	public void setDeptId(Long deptId) {
		this.deptId = deptId;
	}
	/**
	 * 获取：部门
	 */
	public Long getDeptId() {
		return deptId;
	}
	/**
	 * 设置：预算类型
	 */
	public void setBilltype(String billtype) {
		this.billtype = billtype;
	}
	/**
	 * 获取：预算类型
	 */
	public String getBilltype() {
		return billtype;
	}
	/**
	 * 设置：状态
	 */
	public void setBillstatus(Integer billstatus) {
		this.billstatus = billstatus;
	}
	/**
	 * 获取：状态
	 */
	public Integer getBillstatus() {
		return billstatus;
	}
	/**
	 * 设置：制单人
	 */
	public void setMkuser(String mkuser) {
		this.mkuser = mkuser;
	}
	/**
	 * 获取：制单人
	 */
	public String getMkuser() {
		return mkuser;
	}
	/**
	 * 设置：制单日期
	 */
	public void setMkdate(Date mkdate) {
		this.mkdate = mkdate;
	}
	/**
	 * 获取：制单日期
	 */
	public Date getMkdate() {
		return mkdate;
	}
	/**
	 * 设置：审核人
	 */
	public void setAccuser(String accuser) {
		this.accuser = accuser;
	}
	/**
	 * 获取：审核人
	 */
	public String getAccuser() {
		return accuser;
	}
	/**
	 * 设置：审核日期
	 */
	public void setAccdate(Date accdate) {
		this.accdate = accdate;
	}
	/**
	 * 获取：审核日期
	 */
	public Date getAccdate() {
		return accdate;
	}
	/**
	 * 设置：签批人
	 */
	public void setRzuser(String rzuser) {
		this.rzuser = rzuser;
	}
	/**
	 * 获取：签批人
	 */
	public String getRzuser() {
		return rzuser;
	}
	/**
	 * 设置：签批日期
	 */
	public void setRzdate(Date rzdate) {
		this.rzdate = rzdate;
	}
	/**
	 * 获取：签批日期
	 */
	public Date getRzdate() {
		return rzdate;
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
