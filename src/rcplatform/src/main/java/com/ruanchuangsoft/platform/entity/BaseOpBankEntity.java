package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 银行表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-05 17:23:06
 */
public class BaseOpBankEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Integer bobTid;
	//编码
	private String bobJobcode;
	//名称
	private String bobName;
	//帐号
	private String bobAccountno;
	//币别
	private Integer bobBoctid;
	//地址
	private String bobAddress;
	//电话
	private String bobTel;
	//传真
	private String bobFax;
	//联系人
	private String bobMan;
	//假删
	private Integer bobDel;
	//创建人员
	private Integer bobAddpid;
	//创建日期
	private Date bobAdddate;
	//备注
	private String bobNote;

	/**
	 * 设置：
	 */
	public void setBobTid(Integer bobTid) {
		this.bobTid = bobTid;
	}
	/**
	 * 获取：
	 */
	public Integer getBobTid() {
		return bobTid;
	}
	/**
	 * 设置：编码
	 */
	public void setBobJobcode(String bobJobcode) {
		this.bobJobcode = bobJobcode;
	}
	/**
	 * 获取：编码
	 */
	public String getBobJobcode() {
		return bobJobcode;
	}
	/**
	 * 设置：名称
	 */
	public void setBobName(String bobName) {
		this.bobName = bobName;
	}
	/**
	 * 获取：名称
	 */
	public String getBobName() {
		return bobName;
	}
	/**
	 * 设置：帐号
	 */
	public void setBobAccountno(String bobAccountno) {
		this.bobAccountno = bobAccountno;
	}
	/**
	 * 获取：帐号
	 */
	public String getBobAccountno() {
		return bobAccountno;
	}
	/**
	 * 设置：币别
	 */
	public void setBobBoctid(Integer bobBoctid) {
		this.bobBoctid = bobBoctid;
	}
	/**
	 * 获取：币别
	 */
	public Integer getBobBoctid() {
		return bobBoctid;
	}
	/**
	 * 设置：地址
	 */
	public void setBobAddress(String bobAddress) {
		this.bobAddress = bobAddress;
	}
	/**
	 * 获取：地址
	 */
	public String getBobAddress() {
		return bobAddress;
	}
	/**
	 * 设置：电话
	 */
	public void setBobTel(String bobTel) {
		this.bobTel = bobTel;
	}
	/**
	 * 获取：电话
	 */
	public String getBobTel() {
		return bobTel;
	}
	/**
	 * 设置：传真
	 */
	public void setBobFax(String bobFax) {
		this.bobFax = bobFax;
	}
	/**
	 * 获取：传真
	 */
	public String getBobFax() {
		return bobFax;
	}
	/**
	 * 设置：联系人
	 */
	public void setBobMan(String bobMan) {
		this.bobMan = bobMan;
	}
	/**
	 * 获取：联系人
	 */
	public String getBobMan() {
		return bobMan;
	}
	/**
	 * 设置：假删
	 */
	public void setBobDel(Integer bobDel) {
		this.bobDel = bobDel;
	}
	/**
	 * 获取：假删
	 */
	public Integer getBobDel() {
		return bobDel;
	}
	/**
	 * 设置：创建人员
	 */
	public void setBobAddpid(Integer bobAddpid) {
		this.bobAddpid = bobAddpid;
	}
	/**
	 * 获取：创建人员
	 */
	public Integer getBobAddpid() {
		return bobAddpid;
	}
	/**
	 * 设置：创建日期
	 */
	public void setBobAdddate(Date bobAdddate) {
		this.bobAdddate = bobAdddate;
	}
	/**
	 * 获取：创建日期
	 */
	public Date getBobAdddate() {
		return bobAdddate;
	}
	/**
	 * 设置：备注
	 */
	public void setBobNote(String bobNote) {
		this.bobNote = bobNote;
	}
	/**
	 * 获取：备注
	 */
	public String getBobNote() {
		return bobNote;
	}
}
