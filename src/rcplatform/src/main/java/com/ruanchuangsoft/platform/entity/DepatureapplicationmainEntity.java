package com.ruanchuangsoft.platform.entity;

import com.ruanchuangsoft.platform.entity.AbstractEntity;

import java.io.Serializable;
import java.util.Date;


import java.math.BigDecimal;



/**
 * 离职申请
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-06 17:23:20
 */
public class DepatureapplicationmainEntity extends AbstractEntity implements Serializable {
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
	//岗位
	private Long roleid;
	//离职时间
	private Date depatureday;
	//交接人
	private Long successer;
	//自述理由
	private String reason;
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
		        //岗位
        private String roleidrole_name;
			        //交接人
        private String successerfullname;
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
	 * 设置：岗位
	 */
	public void setRoleid(Long roleid) {
		this.roleid = roleid;
	}
	/**
	 * 获取：岗位
	 */
	public Long getRoleid() {
		return roleid;
	}
	/**
	 * 设置：离职时间
	 */
	public void setDepatureday(Date depatureday) {
		this.depatureday = depatureday;
	}
	/**
	 * 获取：离职时间
	 */
	public Date getDepatureday() {
		return depatureday;
	}
	/**
	 * 设置：交接人
	 */
	public void setSuccesser(Long successer) {
		this.successer = successer;
	}
	/**
	 * 获取：交接人
	 */
	public Long getSuccesser() {
		return successer;
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
         * 设置：岗位role_name
         */
        public void setRoleidrole_name(String role_name) {
            this.roleidrole_name = role_name;
        }
        /**
         * 获取：岗位role_name
         */
        public String getRoleidrole_name() {
            return roleidrole_name;
        }
        						        /**
         * 设置：交接人fullname
         */
        public void setSuccesserfullname(String fullname) {
            this.successerfullname = fullname;
        }
        /**
         * 获取：交接人fullname
         */
        public String getSuccesserfullname() {
            return successerfullname;
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
                        "  <div class=\"el-form-item__content\"><a class='billno' onclick=\"openfunc('depatureapplicationmain/index','离职申请')\"><span>"+getBillno()+"</span></a>\n" +
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
                        "  <label class=\"el-form-item__label\">岗位</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getRoleidrole_name()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">离职时间</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getDepatureday()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">交接人</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getSuccesserfullname()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">自述理由</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getReason()+"</span>\n" +
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
