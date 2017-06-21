package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.util.Date;

import java.math.BigDecimal;



/**
 * 船舶管理
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-20 19:02:25
 */
public class ShipEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//编码
	private String code;
	//中文名称
	private String name;
	//英文名称
	private String enname;
	//所属区域
	private Long region;
	//UN代码
	private String uncode;
	//类型
	private String type;
	//所属船公司
	private Long company;
	//COS代码
	private String coscode;
	//COS船英文名
	private String cosshipenname;
	//所属国家
	private String country;
	//联系人
	private String contact;
	//地址
	private String address;
	//电话
	private String phone;
	//航线
	private String route;


	


	


	


	


	        //所属区域
        private String regionname;
	


	


	


	


	


	


	


	


	


	


	


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
	 * 设置：中文名称
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * 获取：中文名称
	 */
	public String getName() {
		return name;
	}
	/**
	 * 设置：英文名称
	 */
	public void setEnname(String enname) {
		this.enname = enname;
	}
	/**
	 * 获取：英文名称
	 */
	public String getEnname() {
		return enname;
	}
	/**
	 * 设置：所属区域
	 */
	public void setRegion(Long region) {
		this.region = region;
	}
	/**
	 * 获取：所属区域
	 */
	public Long getRegion() {
		return region;
	}
	/**
	 * 设置：UN代码
	 */
	public void setUncode(String uncode) {
		this.uncode = uncode;
	}
	/**
	 * 获取：UN代码
	 */
	public String getUncode() {
		return uncode;
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
	 * 设置：所属船公司
	 */
	public void setCompany(Long company) {
		this.company = company;
	}
	/**
	 * 获取：所属船公司
	 */
	public Long getCompany() {
		return company;
	}
	/**
	 * 设置：COS代码
	 */
	public void setCoscode(String coscode) {
		this.coscode = coscode;
	}
	/**
	 * 获取：COS代码
	 */
	public String getCoscode() {
		return coscode;
	}
	/**
	 * 设置：COS船英文名
	 */
	public void setCosshipenname(String cosshipenname) {
		this.cosshipenname = cosshipenname;
	}
	/**
	 * 获取：COS船英文名
	 */
	public String getCosshipenname() {
		return cosshipenname;
	}
	/**
	 * 设置：所属国家
	 */
	public void setCountry(String country) {
		this.country = country;
	}
	/**
	 * 获取：所属国家
	 */
	public String getCountry() {
		return country;
	}
	/**
	 * 设置：联系人
	 */
	public void setContact(String contact) {
		this.contact = contact;
	}
	/**
	 * 获取：联系人
	 */
	public String getContact() {
		return contact;
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
	 * 设置：航线
	 */
	public void setRoute(String route) {
		this.route = route;
	}
	/**
	 * 获取：航线
	 */
	public String getRoute() {
		return route;
	}


															        /**
         * 设置：所属区域name
         */
        public void setRegionname(String name) {
            this.regionname = name;
        }
        /**
         * 获取：所属区域name
         */
        public String getRegionname() {
            return regionname;
        }
        																															}
