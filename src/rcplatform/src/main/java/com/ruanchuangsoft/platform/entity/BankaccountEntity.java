package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.util.Date;

import java.math.BigDecimal;



/**
 * 银行账户表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-20 19:02:25
 */
public class BankaccountEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//银行名称
	private String bankname;
	//开户支行
	private String subbank;
	//账号法人
	private String accountperson;
	//银行账号
	private String accountno;
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
	 * 设置：银行名称
	 */
	public void setBankname(String bankname) {
		this.bankname = bankname;
	}
	/**
	 * 获取：银行名称
	 */
	public String getBankname() {
		return bankname;
	}
	/**
	 * 设置：开户支行
	 */
	public void setSubbank(String subbank) {
		this.subbank = subbank;
	}
	/**
	 * 获取：开户支行
	 */
	public String getSubbank() {
		return subbank;
	}
	/**
	 * 设置：账号法人
	 */
	public void setAccountperson(String accountperson) {
		this.accountperson = accountperson;
	}
	/**
	 * 获取：账号法人
	 */
	public String getAccountperson() {
		return accountperson;
	}
	/**
	 * 设置：银行账号
	 */
	public void setAccountno(String accountno) {
		this.accountno = accountno;
	}
	/**
	 * 获取：银行账号
	 */
	public String getAccountno() {
		return accountno;
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
