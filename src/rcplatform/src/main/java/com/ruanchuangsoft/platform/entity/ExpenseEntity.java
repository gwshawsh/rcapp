package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.util.Date;


import java.math.BigDecimal;



/**
 * 报销单
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 17:01:14
 */
public class ExpenseEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//报销单号
	private String billno;
	//申请人
	private String applyuser;
	//部门
	private Long deptid;
	//申请日期
	private Date applydate;
	//费用项目
	private Long costcategoryid;
	//报销金额
	private Double expensemoney;
	//报销事由
	private String reason;
	//收款人
	private String receiver;
	//支付方式
	private String paytype;
	//银行账户
	private String bankaccount;
	//制单人
	private String makeuser;
	//制单日期
	private Date makedate;
	//审核人
	private String accuser;
	//审核日期
	private Date accdate;
	//更新时间
	private Date uptdate;

						        //费用项目
        private String costcategoryidname;
											
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
	public void setDeptid(Long deptid) {
		this.deptid = deptid;
	}
	/**
	 * 获取：部门
	 */
	public Long getDeptid() {
		return deptid;
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
	public void setCostcategoryid(Long costcategoryid) {
		this.costcategoryid = costcategoryid;
	}
	/**
	 * 获取：费用项目
	 */
	public Long getCostcategoryid() {
		return costcategoryid;
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
	 * 设置：银行账户
	 */
	public void setBankaccount(String bankaccount) {
		this.bankaccount = bankaccount;
	}
	/**
	 * 获取：银行账户
	 */
	public String getBankaccount() {
		return bankaccount;
	}
	/**
	 * 设置：制单人
	 */
	public void setMakeuser(String makeuser) {
		this.makeuser = makeuser;
	}
	/**
	 * 获取：制单人
	 */
	public String getMakeuser() {
		return makeuser;
	}
	/**
	 * 设置：制单日期
	 */
	public void setMakedate(Date makedate) {
		this.makedate = makedate;
	}
	/**
	 * 获取：制单日期
	 */
	public Date getMakedate() {
		return makedate;
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
         * 设置：费用项目name
         */
        public void setCostcategoryidname(String name) {
            this.costcategoryidname = name;
        }
        /**
         * 获取：费用项目name
         */
        public String getCostcategoryidname() {
            return costcategoryidname;
        }
        																															}
