package com.ruanchuangsoft.platform.entity;

import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruanchuangsoft.platform.entity.AbstractEntity;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;


import java.math.BigDecimal;



/**
 * 请假单
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-08-24 09:00:21
 */
public class LeaveworkmainEntity extends AbstractEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	public static final String type = "leave";

	public  String getType() {
		return type;
	}
	//
	private Long id;
	//单据号
	private String billno;
	//申请人
	private String userid;
	//开始时间
	@JSONField(format = "yyyy-MM-dd HH:mm")
	private Date starttime;
	//结束时间
	@JSONField(format = "yyyy-MM-dd HH:mm")
	private Date endtime;
	//类型
	private Integer leavetype;
	//单据状态
	private Integer billstatus;
	//请假原因
	private String reason;
	//创建时间

	private Date createtime;
	//完结时间
	private Date realendtime;
	//制单人
	private Long makeuser;
	//制单日期
	private Date makedate;
	//更新时间
	private Date uptdate;
	//流程ID
	private String pocessinstanceid;

			        //申请人
        private String useridfullname;
				        //类型
        private String leavetypeenumvaluename;
		        //单据状态
        private String billstatusenumvaluename;
					        //制单人
        private String makeuserfullname;
				
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
	 * 设置：申请人
	 */
	public void setUserid(String userid) {
		this.userid = userid;
	}
	/**
	 * 获取：申请人
	 */
	public String getUserid() {
		return userid;
	}
	/**
	 * 设置：开始时间
	 */
	public void setStarttime(Date starttime) {
		this.starttime = starttime;
	}
	/**
	 * 获取：开始时间
	 */
	public Date getStarttime() {
		return starttime;
	}
	/**
	 * 设置：结束时间
	 */
	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}
	/**
	 * 获取：结束时间
	 */
	public Date getEndtime() {
		return endtime;
	}
	/**
	 * 设置：类型
	 */
	public void setLeavetype(Integer leavetype) {
		this.leavetype = leavetype;
	}
	/**
	 * 获取：类型
	 */
	public Integer getLeavetype() {
		return leavetype;
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
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	/**
	 * 获取：创建时间
	 */
	public Date getCreatetime() {
		return createtime;
	}
	/**
	 * 设置：完结时间
	 */
	public void setRealendtime(Date realendtime) {
		this.realendtime = realendtime;
	}
	/**
	 * 获取：完结时间
	 */
	public Date getRealendtime() {
		return realendtime;
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
         * 设置：申请人fullname
         */
        public void setUseridfullname(String fullname) {
            this.useridfullname = fullname;
        }
        /**
         * 获取：申请人fullname
         */
        public String getUseridfullname() {
            return useridfullname;
        }
        									        /**
         * 设置：类型enumvaluename
         */
        public void setLeavetypeenumvaluename(String enumvaluename) {
            this.leavetypeenumvaluename = enumvaluename;
        }
        /**
         * 获取：类型enumvaluename
         */
        public String getLeavetypeenumvaluename() {
            return leavetypeenumvaluename;
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
         * To string string.
         *构造单据的描述内容
         * @return the string
         */
    @Override
    public String toString() {
        StringBuffer sb = new StringBuffer("<form class=\"el-form rcp-table-expand el-form--label-left el-form--inline\">");
					
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">单据号</label>"+
                        "  <div class=\"el-form-item__content\"><a class='billno' onclick=\"openfunc('leaveworkmain/index','请假单')\"><span>"+getBillno()+"</span></a>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">申请人</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getUseridfullname()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">开始时间</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getStarttime()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">结束时间</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getEndtime()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">类型</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getLeavetypeenumvaluename()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">单据状态</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getBillstatusenumvaluename()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">请假原因</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getReason()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">创建时间</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getCreatetime()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">完结时间</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getRealendtime()+"</span>\n" +
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
                        "  <label class=\"el-form-item__label\">更新时间</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getUptdate()+"</span>\n" +
                        "  </div> </div>");
			
					
		        sb.append("</form>");
        return sb.toString();

    }
}
