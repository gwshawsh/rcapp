package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 空箱计划用箱单主表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-05-01 22:13:59
 */
public class PlanKongxiangMainEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//单据号
	private String billno;
	//组织id
	private Integer orgId;
	//组织编码
	private String orgcode;
	//提单号
	private String lazingno;
	//船名
	private String shipname;
	//航次
	private String voyage;
	//港口
	private Long portid;
	//箱量
	private Long boxqty;
	//箱型
	private String boxtype;
	//提箱场站
	private Long startplaceId;
	private String startplaceName;
	//放箱地点
	private Long endplaceId;
	private String endplaceName;

	public String getStartplaceName() {
		return startplaceName;
	}

	public void setStartplaceName(String startplaceName) {
		this.startplaceName = startplaceName;
	}

	public String getEndplaceName() {
		return endplaceName;
	}

	public void setEndplaceName(String endplaceName) {
		this.endplaceName = endplaceName;
	}

	//截港时间
	private Date closedate;
	//客户
	private String client;
	//业务员
	private String clerk;
	//最早到场时间
	private Date bgnplanarrtime;
	//最晚到场时间
	private Date endplanarrtime;
	//运输公司
	private Long trancompanyid;
	private String trancompanyName;
	//备注
	private String remark;
	//单据状态:0：新增 1：审核 2：已放箱 3：已提箱 4:已到场 5：已完成
	private String billstate;
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
	 * 设置：组织id
	 */
	public void setOrgId(Integer orgId) {
		this.orgId = orgId;
	}
	/**
	 * 获取：组织id
	 */
	public Integer getOrgId() {
		return orgId;
	}
	/**
	 * 设置：组织编码
	 */
	public void setOrgcode(String orgcode) {
		this.orgcode = orgcode;
	}
	/**
	 * 获取：组织编码
	 */
	public String getOrgcode() {
		return orgcode;
	}
	/**
	 * 设置：提单号
	 */
	public void setLazingno(String lazingno) {
		this.lazingno = lazingno;
	}
	/**
	 * 获取：提单号
	 */
	public String getLazingno() {
		return lazingno;
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
	public void setVoyage(String voyage) {
		this.voyage = voyage;
	}
	/**
	 * 获取：航次
	 */
	public String getVoyage() {
		return voyage;
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
	public void setStartplaceId(Long startplaceId) {
		this.startplaceId = startplaceId;
	}
	/**
	 * 获取：提箱场站
	 */
	public Long getStartplaceId() {
		return startplaceId;
	}
	/**
	 * 设置：放箱地点
	 */
	public void setEndplaceId(Long endplaceId) {
		this.endplaceId = endplaceId;
	}
	/**
	 * 获取：放箱地点
	 */
	public Long getEndplaceId() {
		return endplaceId;
	}
	/**
	 * 设置：截港时间
	 */
	public void setClosedate(Date closedate) {
		this.closedate = closedate;
	}
	/**
	 * 获取：截港时间
	 */
	public Date getClosedate() {
		return closedate;
	}
	/**
	 * 设置：客户
	 */
	public void setClient(String client) {
		this.client = client;
	}
	/**
	 * 获取：客户
	 */
	public String getClient() {
		return client;
	}
	/**
	 * 设置：业务员
	 */
	public void setClerk(String clerk) {
		this.clerk = clerk;
	}
	/**
	 * 获取：业务员
	 */
	public String getClerk() {
		return clerk;
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
	 * 设置：运输公司
	 */
	public void setTrancompanyid(Long trancompanyid) {
		this.trancompanyid = trancompanyid;
	}
	/**
	 * 获取：运输公司
	 */
	public Long getTrancompanyid() {
		return trancompanyid;
	}
	public String getTrancompanyName() {
		return trancompanyName;
	}

	public void setTrancompanyName(String trancompanyName) {
		this.trancompanyName = trancompanyName;
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
	public void setBillstate(String billstate) {
		this.billstate = billstate;
	}
	/**
	 * 获取：单据状态:0：新增 1：审核 2：已放箱 3：已提箱 4:已到场 5：已完成
	 */
	public String getBillstate() {
		return billstate;
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
}
