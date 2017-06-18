package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.util.Date;

import java.math.BigDecimal;



/**
 * 地点管理
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-19 00:18:30
 */
public class PlaceEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//编码
	private String code;
	//名称
	private String name;
	//联系人
	private String linkman;
	//联系电话
	private String phone;
	//地址
	private String address;
	//经度
	private String longitude;
	//纬度
	private String latitude;
	//所属组织
	private String organization;
	//地点类型
	private Integer placetype;


	


	


	


	


	


	


	


	


	        //所属组织
        private String organizationname;
	


	        //地点类型
        private String placetypeenumvaluename;
	


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
	 * 设置：联系人
	 */
	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}
	/**
	 * 获取：联系人
	 */
	public String getLinkman() {
		return linkman;
	}
	/**
	 * 设置：联系电话
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}
	/**
	 * 获取：联系电话
	 */
	public String getPhone() {
		return phone;
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
	 * 设置：经度
	 */
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	/**
	 * 获取：经度
	 */
	public String getLongitude() {
		return longitude;
	}
	/**
	 * 设置：纬度
	 */
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	/**
	 * 获取：纬度
	 */
	public String getLatitude() {
		return latitude;
	}
	/**
	 * 设置：所属组织
	 */
	public void setOrganization(String organization) {
		this.organization = organization;
	}
	/**
	 * 获取：所属组织
	 */
	public String getOrganization() {
		return organization;
	}
	/**
	 * 设置：地点类型
	 */
	public void setPlacetype(Integer placetype) {
		this.placetype = placetype;
	}
	/**
	 * 获取：地点类型
	 */
	public Integer getPlacetype() {
		return placetype;
	}


																											        /**
         * 设置：所属组织name
         */
        public void setOrganizationname(String name) {
            this.organizationname = name;
        }
        /**
         * 获取：所属组织name
         */
        public String getOrganizationname() {
            return organizationname;
        }
        			        /**
         * 设置：地点类型enumvaluename
         */
        public void setPlacetypeenumvaluename(String enumvaluename) {
            this.placetypeenumvaluename = enumvaluename;
        }
        /**
         * 获取：地点类型enumvaluename
         */
        public String getPlacetypeenumvaluename() {
            return placetypeenumvaluename;
        }
        	}
