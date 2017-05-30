package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 运输计划
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-05-30 23:44:01
 */
public class TransboxmainEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//单据号
	private String billno;
	//放箱计划单据号
	private String reftakebillno;
	//要箱计划单据号
	private String refbillno;
	//要箱计划类型:0:无参照  1-空箱计划  2:重箱计划  3:门点计划 4:司机预约
	private Integer refbilltype;
	//客户id
	private Long orgid;
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
	//提箱场站
	private Long takeboxplaceid;
	//运输公司
	private Long transcompanyid;
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
	 * 设置：放箱计划单据号
	 */
	public void setReftakebillno(String reftakebillno) {
		this.reftakebillno = reftakebillno;
	}
	/**
	 * 获取：放箱计划单据号
	 */
	public String getReftakebillno() {
		return reftakebillno;
	}
	/**
	 * 设置：要箱计划单据号
	 */
	public void setRefbillno(String refbillno) {
		this.refbillno = refbillno;
	}
	/**
	 * 获取：要箱计划单据号
	 */
	public String getRefbillno() {
		return refbillno;
	}
	/**
	 * 设置：要箱计划类型:0:无参照  1-空箱计划  2:重箱计划  3:门点计划 4:司机预约
	 */
	public void setRefbilltype(Integer refbilltype) {
		this.refbilltype = refbilltype;
	}
	/**
	 * 获取：要箱计划类型:0:无参照  1-空箱计划  2:重箱计划  3:门点计划 4:司机预约
	 */
	public Integer getRefbilltype() {
		return refbilltype;
	}
	/**
	 * 设置：客户id
	 */
	public void setOrgid(Long orgid) {
		this.orgid = orgid;
	}
	/**
	 * 获取：客户id
	 */
	public Long getOrgid() {
		return orgid;
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
	 * 设置：运输公司
	 */
	public void setTranscompanyid(Long transcompanyid) {
		this.transcompanyid = transcompanyid;
	}
	/**
	 * 获取：运输公司
	 */
	public Long getTranscompanyid() {
		return transcompanyid;
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
}
