package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 船舶计划表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-05-27 20:14:30
 */
public class ShipplanEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//英文船名
	private String enshipname;
	//中文船名
	private String chshipname;
	//出口航次
	private String expvoyage;
	//进口航次
	private String impvoyage;
	//到港状态
	private String arrivalstate;
	//预计到港日期
	private Date arrivaldate;
	//船舶呼号
	private String shipid;
	//IMO编号
	private String imono;
	//码头代码
	private String dockcode;
	//码头名称
	private String dockname;
	//靠泊单位
	private String dockunit;
	//航线
	private String route;
	//预计到港时间
	private Date arrivaltime;
	//预计离港时间
	private Date leavetime;
	//船期
	private String shipment;
	//备注
	private String remark;

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
	 * 设置：英文船名
	 */
	public void setEnshipname(String enshipname) {
		this.enshipname = enshipname;
	}
	/**
	 * 获取：英文船名
	 */
	public String getEnshipname() {
		return enshipname;
	}
	/**
	 * 设置：中文船名
	 */
	public void setChshipname(String chshipname) {
		this.chshipname = chshipname;
	}
	/**
	 * 获取：中文船名
	 */
	public String getChshipname() {
		return chshipname;
	}
	/**
	 * 设置：出口航次
	 */
	public void setExpvoyage(String expvoyage) {
		this.expvoyage = expvoyage;
	}
	/**
	 * 获取：出口航次
	 */
	public String getExpvoyage() {
		return expvoyage;
	}
	/**
	 * 设置：进口航次
	 */
	public void setImpvoyage(String impvoyage) {
		this.impvoyage = impvoyage;
	}
	/**
	 * 获取：进口航次
	 */
	public String getImpvoyage() {
		return impvoyage;
	}
	/**
	 * 设置：到港状态
	 */
	public void setArrivalstate(String arrivalstate) {
		this.arrivalstate = arrivalstate;
	}
	/**
	 * 获取：到港状态
	 */
	public String getArrivalstate() {
		return arrivalstate;
	}
	/**
	 * 设置：预计到港日期
	 */
	public void setArrivaldate(Date arrivaldate) {
		this.arrivaldate = arrivaldate;
	}
	/**
	 * 获取：预计到港日期
	 */
	public Date getArrivaldate() {
		return arrivaldate;
	}
	/**
	 * 设置：船舶呼号
	 */
	public void setShipid(String shipid) {
		this.shipid = shipid;
	}
	/**
	 * 获取：船舶呼号
	 */
	public String getShipid() {
		return shipid;
	}
	/**
	 * 设置：IMO编号
	 */
	public void setImono(String imono) {
		this.imono = imono;
	}
	/**
	 * 获取：IMO编号
	 */
	public String getImono() {
		return imono;
	}
	/**
	 * 设置：码头代码
	 */
	public void setDockcode(String dockcode) {
		this.dockcode = dockcode;
	}
	/**
	 * 获取：码头代码
	 */
	public String getDockcode() {
		return dockcode;
	}
	/**
	 * 设置：码头名称
	 */
	public void setDockname(String dockname) {
		this.dockname = dockname;
	}
	/**
	 * 获取：码头名称
	 */
	public String getDockname() {
		return dockname;
	}
	/**
	 * 设置：靠泊单位
	 */
	public void setDockunit(String dockunit) {
		this.dockunit = dockunit;
	}
	/**
	 * 获取：靠泊单位
	 */
	public String getDockunit() {
		return dockunit;
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
	 * 设置：预计到港时间
	 */
	public void setArrivaltime(Date arrivaltime) {
		this.arrivaltime = arrivaltime;
	}
	/**
	 * 获取：预计到港时间
	 */
	public Date getArrivaltime() {
		return arrivaltime;
	}
	/**
	 * 设置：预计离港时间
	 */
	public void setLeavetime(Date leavetime) {
		this.leavetime = leavetime;
	}
	/**
	 * 获取：预计离港时间
	 */
	public Date getLeavetime() {
		return leavetime;
	}
	/**
	 * 设置：船期
	 */
	public void setShipment(String shipment) {
		this.shipment = shipment;
	}
	/**
	 * 获取：船期
	 */
	public String getShipment() {
		return shipment;
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
}
