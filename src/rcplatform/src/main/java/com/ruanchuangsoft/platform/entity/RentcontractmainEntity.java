package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.util.Date;


import java.math.BigDecimal;



/**
 * 租赁合同
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 12:27:17
 */
public class RentcontractmainEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//单据号
	private String billno;
	//客户
	private Long orgid;
	//客户联系人
	private String linkman;
	//客户联系电话
	private String mobile;
	//付款方式
	private Long paytype;
	//结算周期
	private Integer paycircle;
	//币别
	private Long boctid;
	//汇率
	private BigDecimal rate;
	//税率
	private BigDecimal taxrate;
	//月租金
	private BigDecimal rentprice;
	//租期(月)
	private Integer rentmonth;
	//总金额
	private BigDecimal renttotal;
	//生效日期
	private Date bgndate;
	//失效日期
	private Date enddate;
	//备注
	private String remark;
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

			        //客户
        private String orgidname;
				        //付款方式
        private String paytypename;
		        //结算周期
        private String paycircleenumvaluename;
		        //币别
        private String boctidboctypename;
										        //单据状态
        private String billstatusenumvaluename;
						
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
	 * 设置：客户
	 */
	public void setOrgid(Long orgid) {
		this.orgid = orgid;
	}
	/**
	 * 获取：客户
	 */
	public Long getOrgid() {
		return orgid;
	}
	/**
	 * 设置：客户联系人
	 */
	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}
	/**
	 * 获取：客户联系人
	 */
	public String getLinkman() {
		return linkman;
	}
	/**
	 * 设置：客户联系电话
	 */
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	/**
	 * 获取：客户联系电话
	 */
	public String getMobile() {
		return mobile;
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
	 * 设置：结算周期
	 */
	public void setPaycircle(Integer paycircle) {
		this.paycircle = paycircle;
	}
	/**
	 * 获取：结算周期
	 */
	public Integer getPaycircle() {
		return paycircle;
	}
	/**
	 * 设置：币别
	 */
	public void setBoctid(Long boctid) {
		this.boctid = boctid;
	}
	/**
	 * 获取：币别
	 */
	public Long getBoctid() {
		return boctid;
	}
	/**
	 * 设置：汇率
	 */
	public void setRate(BigDecimal rate) {
		this.rate = rate;
	}
	/**
	 * 获取：汇率
	 */
	public BigDecimal getRate() {
		return rate;
	}
	/**
	 * 设置：税率
	 */
	public void setTaxrate(BigDecimal taxrate) {
		this.taxrate = taxrate;
	}
	/**
	 * 获取：税率
	 */
	public BigDecimal getTaxrate() {
		return taxrate;
	}
	/**
	 * 设置：月租金
	 */
	public void setRentprice(BigDecimal rentprice) {
		this.rentprice = rentprice;
	}
	/**
	 * 获取：月租金
	 */
	public BigDecimal getRentprice() {
		return rentprice;
	}
	/**
	 * 设置：租期(月)
	 */
	public void setRentmonth(Integer rentmonth) {
		this.rentmonth = rentmonth;
	}
	/**
	 * 获取：租期(月)
	 */
	public Integer getRentmonth() {
		return rentmonth;
	}
	/**
	 * 设置：总金额
	 */
	public void setRenttotal(BigDecimal renttotal) {
		this.renttotal = renttotal;
	}
	/**
	 * 获取：总金额
	 */
	public BigDecimal getRenttotal() {
		return renttotal;
	}
	/**
	 * 设置：生效日期
	 */
	public void setBgndate(Date bgndate) {
		this.bgndate = bgndate;
	}
	/**
	 * 获取：生效日期
	 */
	public Date getBgndate() {
		return bgndate;
	}
	/**
	 * 设置：失效日期
	 */
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}
	/**
	 * 获取：失效日期
	 */
	public Date getEnddate() {
		return enddate;
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
         * 设置：客户name
         */
        public void setOrgidname(String name) {
            this.orgidname = name;
        }
        /**
         * 获取：客户name
         */
        public String getOrgidname() {
            return orgidname;
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
         * 设置：结算周期enumvaluename
         */
        public void setPaycircleenumvaluename(String enumvaluename) {
            this.paycircleenumvaluename = enumvaluename;
        }
        /**
         * 获取：结算周期enumvaluename
         */
        public String getPaycircleenumvaluename() {
            return paycircleenumvaluename;
        }
        			        /**
         * 设置：币别boctypename
         */
        public void setBoctidboctypename(String boctypename) {
            this.boctidboctypename = boctypename;
        }
        /**
         * 获取：币别boctypename
         */
        public String getBoctidboctypename() {
            return boctidboctypename;
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
