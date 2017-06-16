package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 报销管理
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-07 13:27:49
 */
public class ExpenseEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//报销单号
	private String billno;
	//申请人
	private String applyuser;
	//部门Id
	private Long deptId;
	//部门名称
	private String deptName;
	//申请日期
	private Date applydate;
	//费用项目Id
	private Long costcategoryId;
	//费用项目
	private Long costcategoryName;

	//报销金额
	private Double expensemoney;
	//报销事由
	private String reason;
	//收款人
	private String receiver;
	//支付方式
	private String paytype;
	//审批人
	private String accuser;
	//审核日期
	private Date accdate;

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
	 * 设置：报销单号
	 */
	public void setBillno(String billno) {
		this.billno = billno;
	}
	/**
	 * 获取：报销单号
	 */
	public String getBillno() {
		return billno;
	}
	/**
	 * 设置：申请人
	 */
	public void setApplyuser(String applyuser) {
		this.applyuser = applyuser;
	}
	/**
	 * 获取：申请人
	 */
	public String getApplyuser() {
		return applyuser;
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
	 * 设置：申请日期
	 */
	public void setApplydate(Date applydate) {
		this.applydate = applydate;
	}
	/**
	 * 获取：申请日期
	 */
	public Date getApplydate() {
		return applydate;
	}
	/**
	 * 设置：费用项目
	 */
	public void setCostcategoryId(Long costcategoryId) {
		this.costcategoryId = costcategoryId;
	}
	/**
	 * 获取：费用项目
	 */
	public Long getCostcategoryId() {
		return costcategoryId;
	}
	/**
	 * 设置：报销金额
	 */
	public void setExpensemoney(Double expensemoney) {
		this.expensemoney = expensemoney;
	}
	/**
	 * 获取：报销金额
	 */
	public Double getExpensemoney() {
		return expensemoney;
	}
	/**
	 * 设置：报销事由
	 */
	public void setReason(String reason) {
		this.reason = reason;
	}
	/**
	 * 获取：报销事由
	 */
	public String getReason() {
		return reason;
	}
	/**
	 * 设置：收款人
	 */
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	/**
	 * 获取：收款人
	 */
	public String getReceiver() {
		return receiver;
	}
	/**
	 * 设置：支付方式
	 */
	public void setPaytype(String paytype) {
		this.paytype = paytype;
	}
	/**
	 * 获取：支付方式
	 */
	public String getPaytype() {
		return paytype;
	}
	/**
	 * 设置：审批人
	 */
	public void setAccuser(String accuser) {
		this.accuser = accuser;
	}
	/**
	 * 获取：审批人
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

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public Long getCostcategoryName() {
		return costcategoryName;
	}

	public void setCostcategoryName(Long costcategoryName) {
		this.costcategoryName = costcategoryName;
	}
}
