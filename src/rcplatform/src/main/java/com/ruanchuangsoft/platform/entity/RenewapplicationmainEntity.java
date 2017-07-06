package com.ruanchuangsoft.platform.entity;

import com.ruanchuangsoft.platform.entity.AbstractEntity;

import java.io.Serializable;
import java.util.Date;


import java.math.BigDecimal;



/**
 * 续签申请
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-06 17:23:20
 */
public class RenewapplicationmainEntity extends AbstractEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//申请单号
	private String billno;
	//员工姓名
	private String name;
	//申请时间
	private Date applicationday;
	//部门
	private Long deptid;
	//当前岗位
	private Long roleid;
	//续签岗位
	private Long renewroleid;
	//入职时间
	private Date entryday;
	//个人申请续签年限
	private String personalapplication;
	//公司批准续签年限
	private String applicationapproval;
	//自述理由
	private String reason;
	//交接内容
	private String handover;
	//单据状态
	private Integer billstatus;
	//备注
	private String remark;
	//制单人
	private Long makeuser;
	//制单日期
	private Date makedate;
	//审核人
	private String accuser;
	//审核日期
	private Date accdate;
	//更新时间
	private Date uptdate;
	//流程ID
	private String pocessinstanceid;

					        //部门
        private String deptidname;
		        //当前岗位
        private String roleidrole_name;
		        //续签岗位
        private String renewroleidrole_name;
			        //个人申请续签年限
        private String personalapplicationenumvaluename;
		        //公司批准续签年限
        private String applicationapprovalenumvaluename;
				        //单据状态
        private String billstatusenumvaluename;
			        //制单人
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
	 * 设置：申请单号
	 */
	public void setBillno(String billno) {
		this.billno = billno;
	}
	/**
	 * 获取：申请单号
	 */
	public String getBillno() {
		return billno;
	}
	/**
	 * 设置：员工姓名
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * 获取：员工姓名
	 */
	public String getName() {
		return name;
	}
	/**
	 * 设置：申请时间
	 */
	public void setApplicationday(Date applicationday) {
		this.applicationday = applicationday;
	}
	/**
	 * 获取：申请时间
	 */
	public Date getApplicationday() {
		return applicationday;
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
	 * 设置：当前岗位
	 */
	public void setRoleid(Long roleid) {
		this.roleid = roleid;
	}
	/**
	 * 获取：当前岗位
	 */
	public Long getRoleid() {
		return roleid;
	}
	/**
	 * 设置：续签岗位
	 */
	public void setRenewroleid(Long renewroleid) {
		this.renewroleid = renewroleid;
	}
	/**
	 * 获取：续签岗位
	 */
	public Long getRenewroleid() {
		return renewroleid;
	}
	/**
	 * 设置：入职时间
	 */
	public void setEntryday(Date entryday) {
		this.entryday = entryday;
	}
	/**
	 * 获取：入职时间
	 */
	public Date getEntryday() {
		return entryday;
	}
	/**
	 * 设置：个人申请续签年限
	 */
	public void setPersonalapplication(String personalapplication) {
		this.personalapplication = personalapplication;
	}
	/**
	 * 获取：个人申请续签年限
	 */
	public String getPersonalapplication() {
		return personalapplication;
	}
	/**
	 * 设置：公司批准续签年限
	 */
	public void setApplicationapproval(String applicationapproval) {
		this.applicationapproval = applicationapproval;
	}
	/**
	 * 获取：公司批准续签年限
	 */
	public String getApplicationapproval() {
		return applicationapproval;
	}
	/**
	 * 设置：自述理由
	 */
	public void setReason(String reason) {
		this.reason = reason;
	}
	/**
	 * 获取：自述理由
	 */
	public String getReason() {
		return reason;
	}
	/**
	 * 设置：交接内容
	 */
	public void setHandover(String handover) {
		this.handover = handover;
	}
	/**
	 * 获取：交接内容
	 */
	public String getHandover() {
		return handover;
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
         * 设置：当前岗位role_name
         */
        public void setRoleidrole_name(String role_name) {
            this.roleidrole_name = role_name;
        }
        /**
         * 获取：当前岗位role_name
         */
        public String getRoleidrole_name() {
            return roleidrole_name;
        }
        			        /**
         * 设置：续签岗位role_name
         */
        public void setRenewroleidrole_name(String role_name) {
            this.renewroleidrole_name = role_name;
        }
        /**
         * 获取：续签岗位role_name
         */
        public String getRenewroleidrole_name() {
            return renewroleidrole_name;
        }
        						        /**
         * 设置：个人申请续签年限enumvaluename
         */
        public void setPersonalapplicationenumvaluename(String enumvaluename) {
            this.personalapplicationenumvaluename = enumvaluename;
        }
        /**
         * 获取：个人申请续签年限enumvaluename
         */
        public String getPersonalapplicationenumvaluename() {
            return personalapplicationenumvaluename;
        }
        			        /**
         * 设置：公司批准续签年限enumvaluename
         */
        public void setApplicationapprovalenumvaluename(String enumvaluename) {
            this.applicationapprovalenumvaluename = enumvaluename;
        }
        /**
         * 获取：公司批准续签年限enumvaluename
         */
        public String getApplicationapprovalenumvaluename() {
            return applicationapprovalenumvaluename;
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
         * 设置：制单人fullname
         */
        public void setMakeuserfullname(String fullname) {
            this.makeuserfullname = fullname;
        }
        /**
         * 获取：制单人fullname
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
                        "  <label class=\"el-form-item__label\">申请单号</label>"+
                        "  <div class=\"el-form-item__content\"><a class='billno' onclick=\"openfunc('renewapplicationmain/index','续签申请')\"><span>"+getBillno()+"</span></a>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">员工姓名</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getName()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">申请时间</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getApplicationday()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">部门</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getDeptidname()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">当前岗位</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getRoleidrole_name()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">续签岗位</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getRenewroleidrole_name()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">入职时间</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getEntryday()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">个人申请续签年限</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getPersonalapplicationenumvaluename()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">公司批准续签年限</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getApplicationapprovalenumvaluename()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">自述理由</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getReason()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">交接内容</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getHandover()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">单据状态</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getBillstatusenumvaluename()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">备注</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getRemark()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">制单人</label>"+
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
