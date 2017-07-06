package com.ruanchuangsoft.platform.entity;

import com.ruanchuangsoft.platform.entity.AbstractEntity;

import java.io.Serializable;
import java.util.Date;


import java.math.BigDecimal;



/**
 * 公司费用
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-06 12:31:44
 */
public class ExpensecompanymainEntity extends AbstractEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//报销单号
	private String billno;
	//部门
	private Long deptid;
	//申请日期
	private Date applydate;
	//费用项目
	private Long costcategoryid;
	//报销金额
	private Double expensemoney;
	//报销标题
	private String title;
	//详情
	private String remark;
	//收款人
	private Long receiver;
	//支付方式
	private String paytype;
	//银行账户
	private String bankaccount;
	//单据状态
	private Integer billstatus;
	//申请人
	private Long makeuser;
	//制单日期
	private Date makedate;
	//审核人
	private Long accuser;
	//审核日期
	private Date accdate;
	//更新时间
	private Date uptdate;
	//流程ID
	private String pocessinstanceid;

			        //部门
        private String deptidname;
			        //费用项目
        private String costcategoryidenumvaluename;
					        //收款人
        private String receiverfullname;
		        //支付方式
        private String paytypeenumvaluename;
			        //单据状态
        private String billstatusenumvaluename;
		        //申请人
        private String makeuserfullname;
			        //审核人
        private String accuserfullname;
				
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
	 * 设置：报销单号
	 */
	public void setBillno(String billno) {
		this.billno = billno;
	}
	/**
	 * 获取：报销单号
	 */
	public String getBillno() {
		return billno;
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
	 * 设置：申请日期
	 */
	public void setApplydate(Date applydate) {
		this.applydate = applydate;
	}
	/**
	 * 获取：申请日期
	 */
	public Date getApplydate() {
		return applydate;
	}
	/**
	 * 设置：费用项目
	 */
	public void setCostcategoryid(Long costcategoryid) {
		this.costcategoryid = costcategoryid;
	}
	/**
	 * 获取：费用项目
	 */
	public Long getCostcategoryid() {
		return costcategoryid;
	}
	/**
	 * 设置：报销金额
	 */
	public void setExpensemoney(Double expensemoney) {
		this.expensemoney = expensemoney;
	}
	/**
	 * 获取：报销金额
	 */
	public Double getExpensemoney() {
		return expensemoney;
	}
	/**
	 * 设置：报销标题
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * 获取：报销标题
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * 设置：详情
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}
	/**
	 * 获取：详情
	 */
	public String getRemark() {
		return remark;
	}
	/**
	 * 设置：收款人
	 */
	public void setReceiver(Long receiver) {
		this.receiver = receiver;
	}
	/**
	 * 获取：收款人
	 */
	public Long getReceiver() {
		return receiver;
	}
	/**
	 * 设置：支付方式
	 */
	public void setPaytype(String paytype) {
		this.paytype = paytype;
	}
	/**
	 * 获取：支付方式
	 */
	public String getPaytype() {
		return paytype;
	}
	/**
	 * 设置：银行账户
	 */
	public void setBankaccount(String bankaccount) {
		this.bankaccount = bankaccount;
	}
	/**
	 * 获取：银行账户
	 */
	public String getBankaccount() {
		return bankaccount;
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
	 * 设置：申请人
	 */
	public void setMakeuser(Long makeuser) {
		this.makeuser = makeuser;
	}
	/**
	 * 获取：申请人
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
         * 设置：费用项目enumvaluename
         */
        public void setCostcategoryidenumvaluename(String enumvaluename) {
            this.costcategoryidenumvaluename = enumvaluename;
        }
        /**
         * 获取：费用项目enumvaluename
         */
        public String getCostcategoryidenumvaluename() {
            return costcategoryidenumvaluename;
        }
        												        /**
         * 设置：收款人fullname
         */
        public void setReceiverfullname(String fullname) {
            this.receiverfullname = fullname;
        }
        /**
         * 获取：收款人fullname
         */
        public String getReceiverfullname() {
            return receiverfullname;
        }
        			        /**
         * 设置：支付方式enumvaluename
         */
        public void setPaytypeenumvaluename(String enumvaluename) {
            this.paytypeenumvaluename = enumvaluename;
        }
        /**
         * 获取：支付方式enumvaluename
         */
        public String getPaytypeenumvaluename() {
            return paytypeenumvaluename;
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
         * 设置：申请人fullname
         */
        public void setMakeuserfullname(String fullname) {
            this.makeuserfullname = fullname;
        }
        /**
         * 获取：申请人fullname
         */
        public String getMakeuserfullname() {
            return makeuserfullname;
        }
        						        /**
         * 设置：审核人fullname
         */
        public void setAccuserfullname(String fullname) {
            this.accuserfullname = fullname;
        }
        /**
         * 获取：审核人fullname
         */
        public String getAccuserfullname() {
            return accuserfullname;
        }
        										
    /**
         * To string string.
         *构造单据的描述内容
         * @return the string
         */
    @Override
    public String toString() {
        StringBuffer sb = new StringBuffer("<form class=\"el-form rcp-table-expand el-form--label-left el-form--inline\">");
					
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">报销单号</label>"+
                        "  <div class=\"el-form-item__content\"><a class='billno' onclick=\"openfunc('expensecompanymain/index','公司费用')\"><span>"+getBillno()+"</span></a>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">部门</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getDeptidname()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">申请日期</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getApplydate()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">费用项目</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getCostcategoryidenumvaluename()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">报销金额</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getExpensemoney()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">报销标题</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getTitle()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">详情</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getRemark()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">收款人</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getReceiverfullname()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">支付方式</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getPaytypeenumvaluename()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">银行账户</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getBankaccount()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">单据状态</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getBillstatusenumvaluename()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">申请人</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getMakeuserfullname()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">制单日期</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getMakedate()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">审核人</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getAccuserfullname()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">审核日期</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getAccdate()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">更新时间</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getUptdate()+"</span>\n" +
                        "  </div> </div>");
			
					
		        sb.append("</form>");
        return sb.toString();

    }
}
