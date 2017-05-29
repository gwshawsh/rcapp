package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 重箱计划
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-05-28 11:51:56
 */
public class HeavymainEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//单据号
	private String billno;
	//客户id
	private Long orgId;
	//提单号
	private String ladingcode;
	//船名
	private String shipname;
	//航次
	private String flight;
	//港口
	private Long portid;
	//箱量
	private Long boxqty;
	//箱型
	private String boxtype;
	//目的地
	private Long endplaceId;
	//集港时间
	private Date bgnshipdate;
	//截港时间
	private Date endshipdate;
	//最早到场时间
	private Date bgnplanarrtime;
	//最晚到场时间
	private Date endplanarrtime;
	//备注
	private String remark;
	//单据状态:0：新增 1：审核 2：已放箱 3：已提箱 4:已到场 5：已完成
	private String billstatus;
	//制单人
	private String makeuser;
	//制单日期
	private Date makedate;
	//审核人
	private String accuser;
	//审核日期
	private Date accdate;
	//更新时间
	private Date uptdate;

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
	 * 设置：客户id
	 */
	public void setOrgId(Long orgId) {
		this.orgId = orgId;
	}
	/**
	 * 获取：客户id
	 */
	public Long getOrgId() {
		return orgId;
	}
	/**
	 * 设置：提单号
	 */
	public void setLadingcode(String ladingcode) {
		this.ladingcode = ladingcode;
	}
	/**
	 * 获取：提单号
	 */
	public String getLadingcode() {
		return ladingcode;
	}
	/**
	 * 设置：船名
	 */
	public void setShipname(String shipname) {
		this.shipname = shipname;
	}
	/**
	 * 获取：船名
	 */
	public String getShipname() {
		return shipname;
	}
	/**
	 * 设置：航次
	 */
	public void setFlight(String flight) {
		this.flight = flight;
	}
	/**
	 * 获取：航次
	 */
	public String getFlight() {
		return flight;
	}
	/**
	 * 设置：港口
	 */
	public void setPortid(Long portid) {
		this.portid = portid;
	}
	/**
	 * 获取：港口
	 */
	public Long getPortid() {
		return portid;
	}
	/**
	 * 设置：箱量
	 */
	public void setBoxqty(Long boxqty) {
		this.boxqty = boxqty;
	}
	/**
	 * 获取：箱量
	 */
	public Long getBoxqty() {
		return boxqty;
	}
	/**
	 * 设置：箱型
	 */
	public void setBoxtype(String boxtype) {
		this.boxtype = boxtype;
	}
	/**
	 * 获取：箱型
	 */
	public String getBoxtype() {
		return boxtype;
	}
	/**
	 * 设置：目的地
	 */
	public void setEndplaceId(Long endplaceId) {
		this.endplaceId = endplaceId;
	}
	/**
	 * 获取：目的地
	 */
	public Long getEndplaceId() {
		return endplaceId;
	}
	/**
	 * 设置：集港时间
	 */
	public void setBgnshipdate(Date bgnshipdate) {
		this.bgnshipdate = bgnshipdate;
	}
	/**
	 * 获取：集港时间
	 */
	public Date getBgnshipdate() {
		return bgnshipdate;
	}
	/**
	 * 设置：截港时间
	 */
	public void setEndshipdate(Date endshipdate) {
		this.endshipdate = endshipdate;
	}
	/**
	 * 获取：截港时间
	 */
	public Date getEndshipdate() {
		return endshipdate;
	}
	/**
	 * 设置：最早到场时间
	 */
	public void setBgnplanarrtime(Date bgnplanarrtime) {
		this.bgnplanarrtime = bgnplanarrtime;
	}
	/**
	 * 获取：最早到场时间
	 */
	public Date getBgnplanarrtime() {
		return bgnplanarrtime;
	}
	/**
	 * 设置：最晚到场时间
	 */
	public void setEndplanarrtime(Date endplanarrtime) {
		this.endplanarrtime = endplanarrtime;
	}
	/**
	 * 获取：最晚到场时间
	 */
	public Date getEndplanarrtime() {
		return endplanarrtime;
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
	/**
	 * 设置：单据状态:0：新增 1：审核 2：已放箱 3：已提箱 4:已到场 5：已完成
	 */
	public void setBillstatus(String billstatus) {
		this.billstatus = billstatus;
	}
	/**
	 * 获取：单据状态:0：新增 1：审核 2：已放箱 3：已提箱 4:已到场 5：已完成
	 */
	public String getBillstatus() {
		return billstatus;
	}
	/**
	 * 设置：制单人
	 */
	public void setMakeuser(String makeuser) {
		this.makeuser = makeuser;
	}
	/**
	 * 获取：制单人
	 */
	public String getMakeuser() {
		return makeuser;
	}
	/**
	 * 设置：制单日期
	 */
	public void setMakedate(Date makedate) {
		this.makedate = makedate;
	}
	/**
	 * 获取：制单日期
	 */
	public Date getMakedate() {
		return makedate;
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



	//以下为虚拟字段
	private String orgname;
	private String portname;
	private String takeboxplacename;
	private String endplacename;

	public String getOrgname() {
		return orgname;
	}

	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}

	public String getPortname() {
		return portname;
	}

	public void setPortname(String portname) {
		this.portname = portname;
	}

	public String getTakeboxplacename() {
		return takeboxplacename;
	}

	public void setTakeboxplacename(String takeboxplacename) {
		this.takeboxplacename = takeboxplacename;
	}

	public String getEndplacename() {
		return endplacename;
	}

	public void setEndplacename(String endplacename) {
		this.endplacename = endplacename;
	}
}
