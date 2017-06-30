package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.ruanchuangsoft.platform.entity.RequisitiondetailEntity;

import java.math.BigDecimal;



/**
 * 请购主表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-30 13:35:04
 */
public class RequisitionmainEntity  extends AbstractEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//单据号
	private String billno;
	//请购人
	private String requser;
	//所属部门
	private Long deptid;
	//请购类别
	private Integer reqtype;
	//预算计划
	private Long budgetmainid;
	//单据状态
	private Integer billstatus;
	//制单人
	private Long makeuser;
	//制单日期
	private Date makedate;
	//审核人
	private Long accuser;
	//审核日期
	private Date accdate;
	//更新时间
	private Date uptdate;
	//备注
	private String remark;
	//流程ID
	private String pocessinstanceid;


	
		

	
		

	
		            //请购人
            private String requserusername;
		

	
		            //所属部门
            private String deptidname;
		

	
		            //请购类别
            private String reqtypeenumvaluename;
		

	
		            //预算计划
            private String budgetmainidbillno;
		

	
		            //单据状态
            private String billstatusenumvaluename;
		

	
		            //制单人
            private String makeuserusername;
		

	
		

	
		            //审核人
            private String accuserusername;
		

	
		

	
		

	
		

	
		

	
	//单据明细
	private List<RequisitiondetailEntity> details;

	public void setDetails(List<RequisitiondetailEntity> details) {
        this.details = details;
    }

    public List<RequisitiondetailEntity> getDetails() {
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
	 * 设置：请购人
	 */
	public void setRequser(String requser) {
		this.requser = requser;
	}
	/**
	 * 获取：请购人
	 */
	public String getRequser() {
		return requser;
	}
	/**
	 * 设置：所属部门
	 */
	public void setDeptid(Long deptid) {
		this.deptid = deptid;
	}
	/**
	 * 获取：所属部门
	 */
	public Long getDeptid() {
		return deptid;
	}
	/**
	 * 设置：请购类别
	 */
	public void setReqtype(Integer reqtype) {
		this.reqtype = reqtype;
	}
	/**
	 * 获取：请购类别
	 */
	public Integer getReqtype() {
		return reqtype;
	}
	/**
	 * 设置：预算计划
	 */
	public void setBudgetmainid(Long budgetmainid) {
		this.budgetmainid = budgetmainid;
	}
	/**
	 * 获取：预算计划
	 */
	public Long getBudgetmainid() {
		return budgetmainid;
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
	public void setMakeuser(Long makeuser) {
		this.makeuser = makeuser;
	}
	/**
	 * 获取：制单人
	 */
	public Long getMakeuser() {
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
	public void setAccuser(Long accuser) {
		this.accuser = accuser;
	}
	/**
	 * 获取：审核人
	 */
	public Long getAccuser() {
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
	 * 设置：流程ID
	 */
	public void setPocessinstanceid(String pocessinstanceid) {
		this.pocessinstanceid = pocessinstanceid;
	}
	/**
	 * 获取：流程ID
	 */
	public String getPocessinstanceid() {
		return pocessinstanceid;
	}

			        /**
         * 设置：请购人username
         */
        public void setRequserusername(String username) {
            this.requserusername = username;
            }
    /**
     * 获取：请购人username
     */
    public String getRequserusername() {
            return requserusername;
            }
		        /**
         * 设置：所属部门name
         */
        public void setDeptidname(String name) {
            this.deptidname = name;
            }
    /**
     * 获取：所属部门name
     */
    public String getDeptidname() {
            return deptidname;
            }
		        /**
         * 设置：请购类别enumvaluename
         */
        public void setReqtypeenumvaluename(String enumvaluename) {
            this.reqtypeenumvaluename = enumvaluename;
            }
    /**
     * 获取：请购类别enumvaluename
     */
    public String getReqtypeenumvaluename() {
            return reqtypeenumvaluename;
            }
		        /**
         * 设置：预算计划billno
         */
        public void setBudgetmainidbillno(String billno) {
            this.budgetmainidbillno = billno;
            }
    /**
     * 获取：预算计划billno
     */
    public String getBudgetmainidbillno() {
            return budgetmainidbillno;
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
		        /**
         * 设置：制单人username
         */
        public void setMakeuserusername(String username) {
            this.makeuserusername = username;
            }
    /**
     * 获取：制单人username
     */
    public String getMakeuserusername() {
            return makeuserusername;
            }
			        /**
         * 设置：审核人username
         */
        public void setAccuserusername(String username) {
            this.accuserusername = username;
            }
    /**
     * 获取：审核人username
     */
    public String getAccuserusername() {
            return accuserusername;
            }
					}
