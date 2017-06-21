package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.util.Date;

import java.math.BigDecimal;



/**
 * 车辆管理
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-20 19:02:25
 */
public class CarEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//编码
	private String carcode;
	//车牌号
	private String carname;
	//车辆辨识信息
	private String carinfo;
	//主司机编码
	private String driverid;
	//主司机姓名
	private String drivername;
	//车辆所属
	private String ownertype;
	//所属车队
	private Long transteam;
	//车辆类型
	private Long cartype;


	


	


	


	


	


	


	        //车辆所属
        private String ownertypeenumvaluename;
	


	        //所属车队
        private String transteamname;
	


	        //车辆类型
        private String cartypename;
	


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
	public void setCarcode(String carcode) {
		this.carcode = carcode;
	}
	/**
	 * 获取：编码
	 */
	public String getCarcode() {
		return carcode;
	}
	/**
	 * 设置：车牌号
	 */
	public void setCarname(String carname) {
		this.carname = carname;
	}
	/**
	 * 获取：车牌号
	 */
	public String getCarname() {
		return carname;
	}
	/**
	 * 设置：车辆辨识信息
	 */
	public void setCarinfo(String carinfo) {
		this.carinfo = carinfo;
	}
	/**
	 * 获取：车辆辨识信息
	 */
	public String getCarinfo() {
		return carinfo;
	}
	/**
	 * 设置：主司机编码
	 */
	public void setDriverid(String driverid) {
		this.driverid = driverid;
	}
	/**
	 * 获取：主司机编码
	 */
	public String getDriverid() {
		return driverid;
	}
	/**
	 * 设置：主司机姓名
	 */
	public void setDrivername(String drivername) {
		this.drivername = drivername;
	}
	/**
	 * 获取：主司机姓名
	 */
	public String getDrivername() {
		return drivername;
	}
	/**
	 * 设置：车辆所属
	 */
	public void setOwnertype(String ownertype) {
		this.ownertype = ownertype;
	}
	/**
	 * 获取：车辆所属
	 */
	public String getOwnertype() {
		return ownertype;
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
	 * 设置：车辆类型
	 */
	public void setCartype(Long cartype) {
		this.cartype = cartype;
	}
	/**
	 * 获取：车辆类型
	 */
	public Long getCartype() {
		return cartype;
	}


																					        /**
         * 设置：车辆所属enumvaluename
         */
        public void setOwnertypeenumvaluename(String enumvaluename) {
            this.ownertypeenumvaluename = enumvaluename;
        }
        /**
         * 获取：车辆所属enumvaluename
         */
        public String getOwnertypeenumvaluename() {
            return ownertypeenumvaluename;
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
         * 设置：车辆类型name
         */
        public void setCartypename(String name) {
            this.cartypename = name;
        }
        /**
         * 获取：车辆类型name
         */
        public String getCartypename() {
            return cartypename;
        }
        	}
