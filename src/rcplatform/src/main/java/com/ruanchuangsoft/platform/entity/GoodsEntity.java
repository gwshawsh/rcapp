package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.util.Date;

import java.math.BigDecimal;



/**
 * 商品表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-20 18:02:55
 */
public class GoodsEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//类别
	private Long classid;
	//编码
	private String code;
	//名称
	private String name;
	//单价
	private Double price;
	//含税单价
	private Double pricetax;
	//库存
	private Integer gcount;


	


	        //类别
        private String classidname;
	


	


	


	


	


	


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
	 * 设置：类别
	 */
	public void setClassid(Long classid) {
		this.classid = classid;
	}
	/**
	 * 获取：类别
	 */
	public Long getClassid() {
		return classid;
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
	 * 设置：单价
	 */
	public void setPrice(Double price) {
		this.price = price;
	}
	/**
	 * 获取：单价
	 */
	public Double getPrice() {
		return price;
	}
	/**
	 * 设置：含税单价
	 */
	public void setPricetax(Double pricetax) {
		this.pricetax = pricetax;
	}
	/**
	 * 获取：含税单价
	 */
	public Double getPricetax() {
		return pricetax;
	}
	/**
	 * 设置：库存
	 */
	public void setGcount(Integer gcount) {
		this.gcount = gcount;
	}
	/**
	 * 获取：库存
	 */
	public Integer getGcount() {
		return gcount;
	}


						        /**
         * 设置：类别name
         */
        public void setClassidname(String name) {
            this.classidname = name;
        }
        /**
         * 获取：类别name
         */
        public String getClassidname() {
            return classidname;
        }
        																}
