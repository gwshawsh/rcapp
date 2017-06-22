package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.util.Date;


import java.math.BigDecimal;



/**
 * 仓储合同明细
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 14:10:00
 */
public class StorecontractdetailEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//单据号
	private String billno;
	//序号
	private Long serialno;
	//线路
	private Long lineid;
	//箱型
	private Long boxtype;
	//空重类型
	private Long weighttype;
	//应收单价
	private BigDecimal boxprice;
	//更新时间
	private Date uptdate;

				        //线路
        private String lineidname;
		        //箱型
        private String boxtypeboxsize;
		        //空重类型
        private String weighttypeenumvaluename;
			
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
	 * 设置：单据号
	 */
	public void setBillno(String billno) {
		this.billno = billno;
	}
	/**
	 * 获取：单据号
	 */
	public String getBillno() {
		return billno;
	}
	/**
	 * 设置：序号
	 */
	public void setSerialno(Long serialno) {
		this.serialno = serialno;
	}
	/**
	 * 获取：序号
	 */
	public Long getSerialno() {
		return serialno;
	}
	/**
	 * 设置：线路
	 */
	public void setLineid(Long lineid) {
		this.lineid = lineid;
	}
	/**
	 * 获取：线路
	 */
	public Long getLineid() {
		return lineid;
	}
	/**
	 * 设置：箱型
	 */
	public void setBoxtype(Long boxtype) {
		this.boxtype = boxtype;
	}
	/**
	 * 获取：箱型
	 */
	public Long getBoxtype() {
		return boxtype;
	}
	/**
	 * 设置：空重类型
	 */
	public void setWeighttype(Long weighttype) {
		this.weighttype = weighttype;
	}
	/**
	 * 获取：空重类型
	 */
	public Long getWeighttype() {
		return weighttype;
	}
	/**
	 * 设置：应收单价
	 */
	public void setBoxprice(BigDecimal boxprice) {
		this.boxprice = boxprice;
	}
	/**
	 * 获取：应收单价
	 */
	public BigDecimal getBoxprice() {
		return boxprice;
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
         * 设置：线路name
         */
        public void setLineidname(String name) {
            this.lineidname = name;
        }
        /**
         * 获取：线路name
         */
        public String getLineidname() {
            return lineidname;
        }
        			        /**
         * 设置：箱型boxsize
         */
        public void setBoxtypeboxsize(String boxsize) {
            this.boxtypeboxsize = boxsize;
        }
        /**
         * 获取：箱型boxsize
         */
        public String getBoxtypeboxsize() {
            return boxtypeboxsize;
        }
        			        /**
         * 设置：空重类型enumvaluename
         */
        public void setWeighttypeenumvaluename(String enumvaluename) {
            this.weighttypeenumvaluename = enumvaluename;
        }
        /**
         * 获取：空重类型enumvaluename
         */
        public String getWeighttypeenumvaluename() {
            return weighttypeenumvaluename;
        }
        							}
