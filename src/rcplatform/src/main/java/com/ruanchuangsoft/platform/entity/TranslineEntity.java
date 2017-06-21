package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.util.Date;

import java.math.BigDecimal;



/**
 * 线路管理
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-20 19:02:25
 */
public class TranslineEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//编码
	private String code;
	//名称
	private String name;
	//起始地点
	private Long startlocation;
	//结束地点
	private Long endlocation;
	//距离
	private Double distance;
	//助记码
	private String helpcode;


	


	


	


	        //起始地点
        private String startlocationname;
	


	        //结束地点
        private String endlocationname;
	


	


	


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
	 * 设置：起始地点
	 */
	public void setStartlocation(Long startlocation) {
		this.startlocation = startlocation;
	}
	/**
	 * 获取：起始地点
	 */
	public Long getStartlocation() {
		return startlocation;
	}
	/**
	 * 设置：结束地点
	 */
	public void setEndlocation(Long endlocation) {
		this.endlocation = endlocation;
	}
	/**
	 * 获取：结束地点
	 */
	public Long getEndlocation() {
		return endlocation;
	}
	/**
	 * 设置：距离
	 */
	public void setDistance(Double distance) {
		this.distance = distance;
	}
	/**
	 * 获取：距离
	 */
	public Double getDistance() {
		return distance;
	}
	/**
	 * 设置：助记码
	 */
	public void setHelpcode(String helpcode) {
		this.helpcode = helpcode;
	}
	/**
	 * 获取：助记码
	 */
	public String getHelpcode() {
		return helpcode;
	}


												        /**
         * 设置：起始地点name
         */
        public void setStartlocationname(String name) {
            this.startlocationname = name;
        }
        /**
         * 获取：起始地点name
         */
        public String getStartlocationname() {
            return startlocationname;
        }
        			        /**
         * 设置：结束地点name
         */
        public void setEndlocationname(String name) {
            this.endlocationname = name;
        }
        /**
         * 获取：结束地点name
         */
        public String getEndlocationname() {
            return endlocationname;
        }
        							}
