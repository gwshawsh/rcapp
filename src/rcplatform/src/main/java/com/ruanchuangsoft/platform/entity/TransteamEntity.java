package com.ruanchuangsoft.platform.entity;

import com.ruanchuangsoft.platform.entity.AbstractEntity;

import java.io.Serializable;
import java.util.Date;


import java.math.BigDecimal;



/**
 * 车队管理
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-06 15:52:20
 */
public class TransteamEntity extends AbstractEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//编码
	private String code;
	//名称
	private String name;
	//地址
	private String address;
	//联系人
	private String contact;
	//联系电话
	private String contactNumber;
	//车辆类型
	private String vehicleType;
	//开票信息
	private String billingInformation;
	//账户信息
	private String accountInformation;

							        //车辆类型
        private String vehicleTypeenumvaluename;
			
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
	 * 设置：地址
	 */
	public void setAddress(String address) {
		this.address = address;
	}
	/**
	 * 获取：地址
	 */
	public String getAddress() {
		return address;
	}
	/**
	 * 设置：联系人
	 */
	public void setContact(String contact) {
		this.contact = contact;
	}
	/**
	 * 获取：联系人
	 */
	public String getContact() {
		return contact;
	}
	/**
	 * 设置：联系电话
	 */
	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}
	/**
	 * 获取：联系电话
	 */
	public String getContactNumber() {
		return contactNumber;
	}
	/**
	 * 设置：车辆类型
	 */
	public void setVehicleType(String vehicleType) {
		this.vehicleType = vehicleType;
	}
	/**
	 * 获取：车辆类型
	 */
	public String getVehicleType() {
		return vehicleType;
	}
	/**
	 * 设置：开票信息
	 */
	public void setBillingInformation(String billingInformation) {
		this.billingInformation = billingInformation;
	}
	/**
	 * 获取：开票信息
	 */
	public String getBillingInformation() {
		return billingInformation;
	}
	/**
	 * 设置：账户信息
	 */
	public void setAccountInformation(String accountInformation) {
		this.accountInformation = accountInformation;
	}
	/**
	 * 获取：账户信息
	 */
	public String getAccountInformation() {
		return accountInformation;
	}


																					        /**
         * 设置：车辆类型enumvaluename
         */
        public void setVehicleTypeenumvaluename(String enumvaluename) {
            this.vehicleTypeenumvaluename = enumvaluename;
        }
        /**
         * 获取：车辆类型enumvaluename
         */
        public String getVehicleTypeenumvaluename() {
            return vehicleTypeenumvaluename;
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
                        "  <label class=\"el-form-item__label\">地址</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getAddress()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">联系人</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getContact()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">联系电话</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getContactNumber()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">车辆类型</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getVehicleTypeenumvaluename()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">开票信息</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getBillingInformation()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">账户信息</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getAccountInformation()+"</span>\n" +
                        "  </div> </div>");
			
		        sb.append("</form>");
        return sb.toString();

    }
}
