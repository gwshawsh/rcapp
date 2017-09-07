package com.ruanchuangsoft.platform.entity;

import com.ruanchuangsoft.platform.entity.AbstractEntity;

import java.io.Serializable;
import java.util.Date;


import java.math.BigDecimal;



/**
 * 单据审批备注
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-02 23:19:09
 */
public class BillcommentsEntity extends AbstractEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	public static final int YES = 0;
	public static final int NO = 1;

	public boolean isPass(){
		return auditstatus == YES;
	}
	
	//
	private Long id;
	//单据号
	private String billno;
	//参照单据类型
	private Integer refbilltype;
	//序号
	private Integer serialno;
	//审批
	private Integer auditstatus;
	//备注
	private String remark;
	//审核人
	private Long makeuser;
	//审核日期
	private Date makedate;
	//更新时间
	private Date uptdate;
	//流程ID
	private String pocessinstanceid;

			        //参照单据类型
        private String refbilltypeenumvaluename;
			        //审批
        private String auditstatusenumvaluename;
			        //审核人
        private String makeuserusername;
				
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
	 * 设置：参照单据类型
	 */
	public void setRefbilltype(Integer refbilltype) {
		this.refbilltype = refbilltype;
	}
	/**
	 * 获取：参照单据类型
	 */
	public Integer getRefbilltype() {
		return refbilltype;
	}
	/**
	 * 设置：序号
	 */
	public void setSerialno(Integer serialno) {
		this.serialno = serialno;
	}
	/**
	 * 获取：序号
	 */
	public Integer getSerialno() {
		return serialno;
	}
	/**
	 * 设置：审批
	 */
	public void setAuditstatus(Integer auditstatus) {
		this.auditstatus = auditstatus;
	}
	/**
	 * 获取：审批
	 */
	public Integer getAuditstatus() {
		return auditstatus;
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
	 * 设置：审核人
	 */
	public void setMakeuser(Long makeuser) {
		this.makeuser = makeuser;
	}
	/**
	 * 获取：审核人
	 */
	public Long getMakeuser() {
		return makeuser;
	}
	/**
	 * 设置：审核日期
	 */
	public void setMakedate(Date makedate) {
		this.makedate = makedate;
	}
	/**
	 * 获取：审核日期
	 */
	public Date getMakedate() {
		return makedate;
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
         * 设置：参照单据类型enumvaluename
         */
        public void setRefbilltypeenumvaluename(String enumvaluename) {
            this.refbilltypeenumvaluename = enumvaluename;
        }
        /**
         * 获取：参照单据类型enumvaluename
         */
        public String getRefbilltypeenumvaluename() {
            return refbilltypeenumvaluename;
        }
        						        /**
         * 设置：审批enumvaluename
         */
        public void setAuditstatusenumvaluename(String enumvaluename) {
            this.auditstatusenumvaluename = enumvaluename;
        }
        /**
         * 获取：审批enumvaluename
         */
        public String getAuditstatusenumvaluename() {
            return auditstatusenumvaluename;
        }
        						        /**
         * 设置：审核人username
         */
        public void setMakeuserusername(String username) {
            this.makeuserusername = username;
        }
        /**
         * 获取：审核人username
         */
        public String getMakeuserusername() {
            return makeuserusername;
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
                        "  <label class=\"el-form-item__label\">单据号</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getBillno()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">参照单据类型</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getRefbilltypeenumvaluename()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">序号</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getSerialno()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">审批</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getAuditstatusenumvaluename()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">备注</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getRemark()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">审核人</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getMakeuserusername()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">审核日期</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getMakedate()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">更新时间</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getUptdate()+"</span>\n" +
                        "  </div> </div>");
			
					
		        sb.append("</form>");
        return sb.toString();

    }
}
