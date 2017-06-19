package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.util.Date;

import java.math.BigDecimal;



/**
 * 疏港计划
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-19 23:53:29
 */
public class LeaveportmainEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//单据号
	private String billno;
	//港口
	private Long port;
	//船公司
	private Long shipcompany;
	//箱量
	private Integer boxqty;
	//箱型
	private Long boxtype;
	//提箱场站
	private Long takeboxplaceid;
	//目的地
	private Long endplaceid;
	//预计到港时间
	private Date planarrporttime;
	//预计到场时间
	private Date planarrtime;
	//制单人
	private String billuser;
	//制单日期
	private Date billdate;
	//审核人
	private String accuser;
	//审核日期
	private Date accdate;
	//更新时间
	private Date uptdate;


	


	


	        //港口
        private String portname;
	


	        //船公司
        private String shipcompanyname;
	


	


	        //箱型
        private String boxtypeboxsize;
	


	        //提箱场站
        private String takeboxplaceidname;
	


	        //目的地
        private String endplaceidname;
	


	


	


	


	


	


	


	


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
	 * 设置：港口
	 */
	public void setPort(Long port) {
		this.port = port;
	}
	/**
	 * 获取：港口
	 */
	public Long getPort() {
		return port;
	}
	/**
	 * 设置：船公司
	 */
	public void setShipcompany(Long shipcompany) {
		this.shipcompany = shipcompany;
	}
	/**
	 * 获取：船公司
	 */
	public Long getShipcompany() {
		return shipcompany;
	}
	/**
	 * 设置：箱量
	 */
	public void setBoxqty(Integer boxqty) {
		this.boxqty = boxqty;
	}
	/**
	 * 获取：箱量
	 */
	public Integer getBoxqty() {
		return boxqty;
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
	 * 设置：提箱场站
	 */
	public void setTakeboxplaceid(Long takeboxplaceid) {
		this.takeboxplaceid = takeboxplaceid;
	}
	/**
	 * 获取：提箱场站
	 */
	public Long getTakeboxplaceid() {
		return takeboxplaceid;
	}
	/**
	 * 设置：目的地
	 */
	public void setEndplaceid(Long endplaceid) {
		this.endplaceid = endplaceid;
	}
	/**
	 * 获取：目的地
	 */
	public Long getEndplaceid() {
		return endplaceid;
	}
	/**
	 * 设置：预计到港时间
	 */
	public void setPlanarrporttime(Date planarrporttime) {
		this.planarrporttime = planarrporttime;
	}
	/**
	 * 获取：预计到港时间
	 */
	public Date getPlanarrporttime() {
		return planarrporttime;
	}
	/**
	 * 设置：预计到场时间
	 */
	public void setPlanarrtime(Date planarrtime) {
		this.planarrtime = planarrtime;
	}
	/**
	 * 获取：预计到场时间
	 */
	public Date getPlanarrtime() {
		return planarrtime;
	}
	/**
	 * 设置：制单人
	 */
	public void setBilluser(String billuser) {
		this.billuser = billuser;
	}
	/**
	 * 获取：制单人
	 */
	public String getBilluser() {
		return billuser;
	}
	/**
	 * 设置：制单日期
	 */
	public void setBilldate(Date billdate) {
		this.billdate = billdate;
	}
	/**
	 * 获取：制单日期
	 */
	public Date getBilldate() {
		return billdate;
	}
	/**
	 * 设置：审核人
	 */
	public void setAccuser(String accuser) {
		this.accuser = accuser;
	}
	/**
	 * 获取：审核人
	 */
	public String getAccuser() {
		return accuser;
	}
	/**
	 * 设置：审核日期
	 */
	public void setAccdate(Date accdate) {
		this.accdate = accdate;
	}
	/**
	 * 获取：审核日期
	 */
	public Date getAccdate() {
		return accdate;
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
         * 设置：港口name
         */
        public void setPortname(String name) {
            this.portname = name;
        }
        /**
         * 获取：港口name
         */
        public String getPortname() {
            return portname;
        }
        			        /**
         * 设置：船公司name
         */
        public void setShipcompanyname(String name) {
            this.shipcompanyname = name;
        }
        /**
         * 获取：船公司name
         */
        public String getShipcompanyname() {
            return shipcompanyname;
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
         * 设置：提箱场站name
         */
        public void setTakeboxplaceidname(String name) {
            this.takeboxplaceidname = name;
        }
        /**
         * 获取：提箱场站name
         */
        public String getTakeboxplaceidname() {
            return takeboxplaceidname;
        }
        			        /**
         * 设置：目的地name
         */
        public void setEndplaceidname(String name) {
            this.endplaceidname = name;
        }
        /**
         * 获取：目的地name
         */
        public String getEndplaceidname() {
            return endplaceidname;
        }
        																						}
