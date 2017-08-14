package com.ruanchuangsoft.platform.entity;

import com.ruanchuangsoft.platform.entity.AbstractEntity;

import java.io.Serializable;
import java.util.Date;





/**
 * 签到表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-08-14 10:36:04
 */
public class CheckinmainEntity  implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//用户ID
	private Long userId;
	//用户名
	private String username;
	//地址
	private String address;
	//签到类型
	private Integer checktype;
	//日期
	private Date date;

						
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
	 * 设置：用户ID
	 */
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	/**
	 * 获取：用户ID
	 */
	public Long getUserId() {
		return userId;
	}
	/**
	 * 设置：用户名
	 */
	public void setUsername(String username) {
		this.username = username;
	}
	/**
	 * 获取：用户名
	 */
	public String getUsername() {
		return username;
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
	 * 设置：签到类型
	 */
	public void setChecktype(Integer checktype) {
		this.checktype = checktype;
	}
	/**
	 * 获取：签到类型
	 */
	public Integer getChecktype() {
		return checktype;
	}
	/**
	 * 设置：日期
	 */
	public void setDate(Date date) {
		this.date = date;
	}
	/**
	 * 获取：日期
	 */
	public Date getDate() {
		return date;
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
                        "  <label class=\"el-form-item__label\">用户ID</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getUserId()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">用户名</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getUsername()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">地址</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getAddress()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">签到类型</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getChecktype()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">日期</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getDate()+"</span>\n" +
                        "  </div> </div>");
			
		        sb.append("</form>");
        return sb.toString();

    }
}
