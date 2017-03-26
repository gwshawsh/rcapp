package com.ruanchuangsoft.platform.system.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 请假表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-03-26 17:42:15
 */
public class LeaveworkEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long leaveId;
	//
	private Long userId;
	//申请人
	private String name;
	//开始时间
	private Date startTime;
	//结束时间
	private Date endTime;
	//类型   0：生病   1：结婚   2：其他
	private Integer leavetype;
	//请假原因
	private String reason;
	//创建时间
	private Date createTime;
	//完结时间
	private Date realendTime;
	//流程ID
	private String pocessInstanceid;

	/**
	 * 设置：
	 */
	public void setLeaveId(Long leaveId) {
		this.leaveId = leaveId;
	}
	/**
	 * 获取：
	 */
	public Long getLeaveId() {
		return leaveId;
	}
	/**
	 * 设置：
	 */
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	/**
	 * 获取：
	 */
	public Long getUserId() {
		return userId;
	}
	/**
	 * 设置：申请人
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * 获取：申请人
	 */
	public String getName() {
		return name;
	}
	/**
	 * 设置：开始时间
	 */
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	/**
	 * 获取：开始时间
	 */
	public Date getStartTime() {
		return startTime;
	}
	/**
	 * 设置：结束时间
	 */
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	/**
	 * 获取：结束时间
	 */
	public Date getEndTime() {
		return endTime;
	}
	/**
	 * 设置：类型   0：生病   1：结婚   2：其他
	 */
	public void setLeavetype(Integer leavetype) {
		this.leavetype = leavetype;
	}
	/**
	 * 获取：类型   0：生病   1：结婚   2：其他
	 */
	public Integer getLeavetype() {
		return leavetype;
	}
	/**
	 * 设置：请假原因
	 */
	public void setReason(String reason) {
		this.reason = reason;
	}
	/**
	 * 获取：请假原因
	 */
	public String getReason() {
		return reason;
	}
	/**
	 * 设置：创建时间
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	/**
	 * 获取：创建时间
	 */
	public Date getCreateTime() {
		return createTime;
	}
	/**
	 * 设置：完结时间
	 */
	public void setRealendTime(Date realendTime) {
		this.realendTime = realendTime;
	}
	/**
	 * 获取：完结时间
	 */
	public Date getRealendTime() {
		return realendTime;
	}
	/**
	 * 设置：流程ID
	 */
	public void setPocessInstanceid(String pocessInstanceid) {
		this.pocessInstanceid = pocessInstanceid;
	}
	/**
	 * 获取：流程ID
	 */
	public String getPocessInstanceid() {
		return pocessInstanceid;
	}
}
