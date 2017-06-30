package com.ruanchuangsoft.platform.entity;

import com.ruanchuangsoft.platform.entity.AbstractEntity;

import java.io.Serializable;
import java.util.Date;


import java.math.BigDecimal;



/**
 * 附件表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-30 15:56:09
 */
public class AttachmentsEntity extends AbstractEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//单据号
	private String billno;
	//文件名
	private String name;
	//文件名
	private String filename;
	//地址
	private String fileurl;
	//制单人
	private Long makeuser;
	//制单日期
	private Date makedate;
	//更新时间
	private Date uptdate;

						        //制单人
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
	 * 设置：文件名
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * 获取：文件名
	 */
	public String getName() {
		return name;
	}
	/**
	 * 设置：文件名
	 */
	public void setFilename(String filename) {
		this.filename = filename;
	}
	/**
	 * 获取：文件名
	 */
	public String getFilename() {
		return filename;
	}
	/**
	 * 设置：地址
	 */
	public void setFileurl(String fileurl) {
		this.fileurl = fileurl;
	}
	/**
	 * 获取：地址
	 */
	public String getFileurl() {
		return fileurl;
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
         * 设置：制单人username
         */
        public void setMakeuserusername(String username) {
            this.makeuserusername = username;
        }
        /**
         * 获取：制单人username
         */
        public String getMakeuserusername() {
            return makeuserusername;
        }
        							}
