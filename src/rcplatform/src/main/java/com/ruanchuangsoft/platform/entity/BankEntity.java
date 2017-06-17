package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 银行管理
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-17 16:28:44
 */
public class BankEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//编码
	private String code;
	//名称
	private String name;
	//帐号
	private String accountno;
	//币别
	private Integer boctid;
	//地址
	private String address;
	//电话
	private String tel;
	//传真
	private String fax;
	//联系人
	private String man;
	//假删
	//创建人员
	private Integer addpid;
	//创建日期
	private Date adddate;
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
	 * 设置：帐号
	 */
	public void setAccountno(String accountno) {
		this.accountno = accountno;
	}
	/**
	 * 获取：帐号
	 */
	public String getAccountno() {
		return accountno;
	}
	/**
	 * 设置：币别
	 */
	public void setBoctid(Integer boctid) {
		this.boctid = boctid;
	}
	/**
	 * 获取：币别
	 */
	public Integer getBoctid() {
		return boctid;
	}
	/**
	 * 设置：地址
	 */
	public void setAddress(String address) {
		this.address = address;
	}
	/**
	 * 获取：地址
	 */
	public String getAddress() {
		return address;
	}
	/**
	 * 设置：电话
	 */
	public void setTel(String tel) {
		this.tel = tel;
	}
	/**
	 * 获取：电话
	 */
	public String getTel() {
		return tel;
	}
	/**
	 * 设置：传真
	 */
	public void setFax(String fax) {
		this.fax = fax;
	}
	/**
	 * 获取：传真
	 */
	public String getFax() {
		return fax;
	}
	/**
	 * 设置：联系人
	 */
	public void setMan(String man) {
		this.man = man;
	}
	/**
	 * 获取：联系人
	 */
	public String getMan() {
		return man;
	}
	/**
	 * 设置：假删
	 */
	/**
	 * 获取：假删
	 */
	/**
	 * 设置：创建人员
	 */
	public void setAddpid(Integer addpid) {
		this.addpid = addpid;
	}
	/**
	 * 获取：创建人员
	 */
	public Integer getAddpid() {
		return addpid;
	}
	/**
	 * 设置：创建日期
	 */
	public void setAdddate(Date adddate) {
		this.adddate = adddate;
	}
	/**
	 * 获取：创建日期
	 */
	public Date getAdddate() {
		return adddate;
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
