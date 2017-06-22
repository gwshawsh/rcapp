package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import com.ruanchuangsoft.platform.entity.BudgetdetailEntity;

import java.math.BigDecimal;



/**
 * 预算计划主表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 15:45:16
 */
public class BudgetmainEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//单据号
	private String billno;
	//计划开始日期
	private String begindate;
	//计划结束日期
	private String enddate;
	//部门
	private Long deptid;
	//预算类型
	private String billtype;
	//单据状态
	private Integer billstatus;
	//制单人
	private String makeuser;
	//制单日期
	private Date makedate;
	//审核人
	private String accuser;
	//审核日期
	private Date accdate;
	//签批人
	private String rzuser;
	//签批日期
	private Date rzdate;
	//更新时间
	private Date uptdate;


	
		

	
		

	
		

	
		

	
		            //部门
            private String deptidname;
		

	
		

	
		            //单据状态
            private String billstatusenumvaluename;
		

	
		

	
		

	
		

	
		

	
		

	
		

	
		

	
	//单据明细
	private List<BudgetdetailEntity> details;

	public void setDetails(List<BudgetdetailEntity> details) {
        this.details = details;
    }

    public List<BudgetdetailEntity> getDetails() {
        return details;
    }



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
	 * 设置：计划开始日期
	 */
	public void setBegindate(String begindate) {
		this.begindate = begindate;
	}
	/**
	 * 获取：计划开始日期
	 */
	public String getBegindate() {
		return begindate;
	}
	/**
	 * 设置：计划结束日期
	 */
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	/**
	 * 获取：计划结束日期
	 */
	public String getEnddate() {
		return enddate;
	}
	/**
	 * 设置：部门
	 */
	public void setDeptid(Long deptid) {
		this.deptid = deptid;
	}
	/**
	 * 获取：部门
	 */
	public Long getDeptid() {
		return deptid;
	}
	/**
	 * 设置：预算类型
	 */
	public void setBilltype(String billtype) {
		this.billtype = billtype;
	}
	/**
	 * 获取：预算类型
	 */
	public String getBilltype() {
		return billtype;
	}
	/**
	 * 设置：单据状态
	 */
	public void setBillstatus(Integer billstatus) {
		this.billstatus = billstatus;
	}
	/**
	 * 获取：单据状态
	 */
	public Integer getBillstatus() {
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
	 * 设置：签批人
	 */
	public void setRzuser(String rzuser) {
		this.rzuser = rzuser;
	}
	/**
	 * 获取：签批人
	 */
	public String getRzuser() {
		return rzuser;
	}
	/**
	 * 设置：签批日期
	 */
	public void setRzdate(Date rzdate) {
		this.rzdate = rzdate;
	}
	/**
	 * 获取：签批日期
	 */
	public Date getRzdate() {
		return rzdate;
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
         * 设置：部门name
         */
        public void setDeptidname(String name) {
            this.deptidname = name;
            }
    /**
     * 获取：部门name
     */
    public String getDeptidname() {
            return deptidname;
            }
			        /**
         * 设置：单据状态enumvaluename
         */
        public void setBillstatusenumvaluename(String enumvaluename) {
            this.billstatusenumvaluename = enumvaluename;
            }
    /**
     * 获取：单据状态enumvaluename
     */
    public String getBillstatusenumvaluename() {
            return billstatusenumvaluename;
            }
								}
