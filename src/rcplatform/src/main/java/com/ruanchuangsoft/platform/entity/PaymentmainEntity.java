package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import com.ruanchuangsoft.platform.entity.PaymentdetailEntity;

import java.math.BigDecimal;



/**
 * 付款主表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 15:54:18
 */
public class PaymentmainEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//单据号
	private String billno;
	//请购单据号
	private String reqbillno;
	//请购人
	private String requser;
	//请购部门
	private String deptid;
	//请购日期
	private String reqdate;
	//订购单据号
	private String orderbillno;
	//付款比例
	private BigDecimal percent;
	//付款金额
	private BigDecimal paytotal;
	//付款来源
	private Integer paysource;
	//收款人
	private String payee;
	//收款人账号
	private Long payeeaccount;
	//付款方式
	private Long paytype;
	//说明
	private String payreason;
	//物品类别
	private Integer ordertype;
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
	//更新时间
	private Date uptdate;


	
		

	
		

	
		

	
		

	
		            //请购部门
            private String deptidname;
		

	
		

	
		

	
		

	
		

	
		            //付款来源
            private String paysourceenumvaluename;
		

	
		

	
		            //收款人账号
            private String payeeaccountaccountno;
		

	
		            //付款方式
            private String paytypename;
		

	
		

	
		            //物品类别
            private String ordertypeenumvaluename;
		

	
		            //单据状态
            private String billstatusenumvaluename;
		

	
		

	
		

	
		

	
		

	
		

	
	//单据明细
	private List<PaymentdetailEntity> details;

	public void setDetails(List<PaymentdetailEntity> details) {
        this.details = details;
    }

    public List<PaymentdetailEntity> getDetails() {
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
	 * 设置：请购单据号
	 */
	public void setReqbillno(String reqbillno) {
		this.reqbillno = reqbillno;
	}
	/**
	 * 获取：请购单据号
	 */
	public String getReqbillno() {
		return reqbillno;
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
	 * 设置：请购部门
	 */
	public void setDeptid(String deptid) {
		this.deptid = deptid;
	}
	/**
	 * 获取：请购部门
	 */
	public String getDeptid() {
		return deptid;
	}
	/**
	 * 设置：请购日期
	 */
	public void setReqdate(String reqdate) {
		this.reqdate = reqdate;
	}
	/**
	 * 获取：请购日期
	 */
	public String getReqdate() {
		return reqdate;
	}
	/**
	 * 设置：订购单据号
	 */
	public void setOrderbillno(String orderbillno) {
		this.orderbillno = orderbillno;
	}
	/**
	 * 获取：订购单据号
	 */
	public String getOrderbillno() {
		return orderbillno;
	}
	/**
	 * 设置：付款比例
	 */
	public void setPercent(BigDecimal percent) {
		this.percent = percent;
	}
	/**
	 * 获取：付款比例
	 */
	public BigDecimal getPercent() {
		return percent;
	}
	/**
	 * 设置：付款金额
	 */
	public void setPaytotal(BigDecimal paytotal) {
		this.paytotal = paytotal;
	}
	/**
	 * 获取：付款金额
	 */
	public BigDecimal getPaytotal() {
		return paytotal;
	}
	/**
	 * 设置：付款来源
	 */
	public void setPaysource(Integer paysource) {
		this.paysource = paysource;
	}
	/**
	 * 获取：付款来源
	 */
	public Integer getPaysource() {
		return paysource;
	}
	/**
	 * 设置：收款人
	 */
	public void setPayee(String payee) {
		this.payee = payee;
	}
	/**
	 * 获取：收款人
	 */
	public String getPayee() {
		return payee;
	}
	/**
	 * 设置：收款人账号
	 */
	public void setPayeeaccount(Long payeeaccount) {
		this.payeeaccount = payeeaccount;
	}
	/**
	 * 获取：收款人账号
	 */
	public Long getPayeeaccount() {
		return payeeaccount;
	}
	/**
	 * 设置：付款方式
	 */
	public void setPaytype(Long paytype) {
		this.paytype = paytype;
	}
	/**
	 * 获取：付款方式
	 */
	public Long getPaytype() {
		return paytype;
	}
	/**
	 * 设置：说明
	 */
	public void setPayreason(String payreason) {
		this.payreason = payreason;
	}
	/**
	 * 获取：说明
	 */
	public String getPayreason() {
		return payreason;
	}
	/**
	 * 设置：物品类别
	 */
	public void setOrdertype(Integer ordertype) {
		this.ordertype = ordertype;
	}
	/**
	 * 获取：物品类别
	 */
	public Integer getOrdertype() {
		return ordertype;
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
         * 设置：请购部门name
         */
        public void setDeptidname(String name) {
            this.deptidname = name;
            }
    /**
     * 获取：请购部门name
     */
    public String getDeptidname() {
            return deptidname;
            }
						        /**
         * 设置：付款来源enumvaluename
         */
        public void setPaysourceenumvaluename(String enumvaluename) {
            this.paysourceenumvaluename = enumvaluename;
            }
    /**
     * 获取：付款来源enumvaluename
     */
    public String getPaysourceenumvaluename() {
            return paysourceenumvaluename;
            }
			        /**
         * 设置：收款人账号accountno
         */
        public void setPayeeaccountaccountno(String accountno) {
            this.payeeaccountaccountno = accountno;
            }
    /**
     * 获取：收款人账号accountno
     */
    public String getPayeeaccountaccountno() {
            return payeeaccountaccountno;
            }
		        /**
         * 设置：付款方式name
         */
        public void setPaytypename(String name) {
            this.paytypename = name;
            }
    /**
     * 获取：付款方式name
     */
    public String getPaytypename() {
            return paytypename;
            }
			        /**
         * 设置：物品类别enumvaluename
         */
        public void setOrdertypeenumvaluename(String enumvaluename) {
            this.ordertypeenumvaluename = enumvaluename;
            }
    /**
     * 获取：物品类别enumvaluename
     */
    public String getOrdertypeenumvaluename() {
            return ordertypeenumvaluename;
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
