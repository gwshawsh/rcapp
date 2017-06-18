package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.util.Date;

import java.math.BigDecimal;



/**
 * 司机管理
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-19 00:18:30
 */
public class DriversEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//编码
	private String code;
	//姓名
	private String name;
	//电话
	private String phone;
	//所属车队
	private Long transteam;
	//证件号
	private String documentno;
	//驾龄
	private Integer driveage;
	//类型
	private String type;


	


	


	


	


	        //所属车队
        private String transteamname;
	


	


	


	        //类型
        private String typeenumvaluename;
	


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
	 * 设置：姓名
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * 获取：姓名
	 */
	public String getName() {
		return name;
	}
	/**
	 * 设置：电话
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}
	/**
	 * 获取：电话
	 */
	public String getPhone() {
		return phone;
	}
	/**
	 * 设置：所属车队
	 */
	public void setTransteam(Long transteam) {
		this.transteam = transteam;
	}
	/**
	 * 获取：所属车队
	 */
	public Long getTransteam() {
		return transteam;
	}
	/**
	 * 设置：证件号
	 */
	public void setDocumentno(String documentno) {
		this.documentno = documentno;
	}
	/**
	 * 获取：证件号
	 */
	public String getDocumentno() {
		return documentno;
	}
	/**
	 * 设置：驾龄
	 */
	public void setDriveage(Integer driveage) {
		this.driveage = driveage;
	}
	/**
	 * 获取：驾龄
	 */
	public Integer getDriveage() {
		return driveage;
	}
	/**
	 * 设置：类型
	 */
	public void setType(String type) {
		this.type = type;
	}
	/**
	 * 获取：类型
	 */
	public String getType() {
		return type;
	}


															        /**
         * 设置：所属车队name
         */
        public void setTransteamname(String name) {
            this.transteamname = name;
        }
        /**
         * 获取：所属车队name
         */
        public String getTransteamname() {
            return transteamname;
        }
        									        /**
         * 设置：类型enumvaluename
         */
        public void setTypeenumvaluename(String enumvaluename) {
            this.typeenumvaluename = enumvaluename;
        }
        /**
         * 获取：类型enumvaluename
         */
        public String getTypeenumvaluename() {
            return typeenumvaluename;
        }
        	}
