package com.ruanchuangsoft.platform.entity;

import com.ruanchuangsoft.platform.entity.AbstractEntity;

import java.io.Serializable;
import java.util.Date;


import java.math.BigDecimal;



/**
 * 结算周期
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-06 16:49:45
 */
public class PaycircleEntity extends AbstractEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//编码
	private String code;
	//名称
	private String name;
	//账期类型
	private Integer paytype;
	//支付日1
	private Long payday1;
	//支付日2
	private Long payday2;
	//更新时间
	private Date uptdate;

				        //账期类型
        private String paytypeenumvaluename;
		        //支付日1
        private String payday1name;
		        //支付日2
        private String payday2boxsize;
		
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
	 * 设置：编码
	 */
	public void setCode(String code) {
		this.code = code;
	}
	/**
	 * 获取：编码
	 */
	public String getCode() {
		return code;
	}
	/**
	 * 设置：名称
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * 获取：名称
	 */
	public String getName() {
		return name;
	}
	/**
	 * 设置：账期类型
	 */
	public void setPaytype(Integer paytype) {
		this.paytype = paytype;
	}
	/**
	 * 获取：账期类型
	 */
	public Integer getPaytype() {
		return paytype;
	}
	/**
	 * 设置：支付日1
	 */
	public void setPayday1(Long payday1) {
		this.payday1 = payday1;
	}
	/**
	 * 获取：支付日1
	 */
	public Long getPayday1() {
		return payday1;
	}
	/**
	 * 设置：支付日2
	 */
	public void setPayday2(Long payday2) {
		this.payday2 = payday2;
	}
	/**
	 * 获取：支付日2
	 */
	public Long getPayday2() {
		return payday2;
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
         * 设置：账期类型enumvaluename
         */
        public void setPaytypeenumvaluename(String enumvaluename) {
            this.paytypeenumvaluename = enumvaluename;
        }
        /**
         * 获取：账期类型enumvaluename
         */
        public String getPaytypeenumvaluename() {
            return paytypeenumvaluename;
        }
        			        /**
         * 设置：支付日1name
         */
        public void setPayday1name(String name) {
            this.payday1name = name;
        }
        /**
         * 获取：支付日1name
         */
        public String getPayday1name() {
            return payday1name;
        }
        			        /**
         * 设置：支付日2boxsize
         */
        public void setPayday2boxsize(String boxsize) {
            this.payday2boxsize = boxsize;
        }
        /**
         * 获取：支付日2boxsize
         */
        public String getPayday2boxsize() {
            return payday2boxsize;
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
                        "  <label class=\"el-form-item__label\">编码</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getCode()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">名称</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getName()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">账期类型</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getPaytypeenumvaluename()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">支付日1</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getPayday1name()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">支付日2</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getPayday2boxsize()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">更新时间</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getUptdate()+"</span>\n" +
                        "  </div> </div>");
			
		        sb.append("</form>");
        return sb.toString();

    }
}
