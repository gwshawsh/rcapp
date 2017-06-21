package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;


/**
 * 组织管理
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-21 18:46:43
 */
public class OrganizationEntity implements Serializable {
	private static final long serialVersionUID = 1L;
    /**
     * ztree属性
     */
    private Boolean open;
    private List<?> list;

    public Boolean getOpen() {
        return open;
    }

    public void setOpen(Boolean open) {
        this.open = open;
    }

    public List<?> getList() {
        return list;
    }

    public void setList(List<?> list) {
        this.list = list;
    }


		//
	private Long id;
    	//编码
	private String code;
    	//名称
	private String name;
    	//上级组织
	private Long parentId;
    	//联系电话
	private String phone;
    	//传真
	private String fax;
    	//地址
	private String address;
    	//邮箱
	private String email;
    	//网址
	private String webaddress;
    	//经度
	private String longitude;
    	//纬度
	private String latitude;
    	//联系人
	private String linkman;
    	//付款方式
	private String paytype;
    	//财务编码
	private String financecode;
    	//省
	private String province;
    	//城市
	private String city;
    	//备注
	private String remark;
    	//纳税人识别号
	private String taxcode;
    	//账期
	private String accperiod;
    	//保险客户费率
	private Double policyrate;
    	//关联单位
	private Long relationid;
    	//注册资质
	private String zizhi;
    	//业务类型
	private String busstype;
    	//类型
	private Integer type;
    
                                                            //上级组织
            private String parentIdname;
                                                                                                                                //付款方式
            private String paytypename;
                                                                                                                                            //业务类型
            private String busstypeenumvaluename;
                                //类型
            private String typeenumvaluename;
            

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
	 * 设置：上级组织
	 */
	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}
	/**
	 * 获取：上级组织
	 */
	public Long getParentId() {
		return parentId;
	}

	/**
	 * 设置：联系电话
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}
	/**
	 * 获取：联系电话
	 */
	public String getPhone() {
		return phone;
	}

	/**
	 * 设置：传真
	 */
	public void setFax(String fax) {
		this.fax = fax;
	}
	/**
	 * 获取：传真
	 */
	public String getFax() {
		return fax;
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
	 * 设置：邮箱
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * 获取：邮箱
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * 设置：网址
	 */
	public void setWebaddress(String webaddress) {
		this.webaddress = webaddress;
	}
	/**
	 * 获取：网址
	 */
	public String getWebaddress() {
		return webaddress;
	}

	/**
	 * 设置：经度
	 */
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	/**
	 * 获取：经度
	 */
	public String getLongitude() {
		return longitude;
	}

	/**
	 * 设置：纬度
	 */
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	/**
	 * 获取：纬度
	 */
	public String getLatitude() {
		return latitude;
	}

	/**
	 * 设置：联系人
	 */
	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}
	/**
	 * 获取：联系人
	 */
	public String getLinkman() {
		return linkman;
	}

	/**
	 * 设置：付款方式
	 */
	public void setPaytype(String paytype) {
		this.paytype = paytype;
	}
	/**
	 * 获取：付款方式
	 */
	public String getPaytype() {
		return paytype;
	}

	/**
	 * 设置：财务编码
	 */
	public void setFinancecode(String financecode) {
		this.financecode = financecode;
	}
	/**
	 * 获取：财务编码
	 */
	public String getFinancecode() {
		return financecode;
	}

	/**
	 * 设置：省
	 */
	public void setProvince(String province) {
		this.province = province;
	}
	/**
	 * 获取：省
	 */
	public String getProvince() {
		return province;
	}

	/**
	 * 设置：城市
	 */
	public void setCity(String city) {
		this.city = city;
	}
	/**
	 * 获取：城市
	 */
	public String getCity() {
		return city;
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
	 * 设置：纳税人识别号
	 */
	public void setTaxcode(String taxcode) {
		this.taxcode = taxcode;
	}
	/**
	 * 获取：纳税人识别号
	 */
	public String getTaxcode() {
		return taxcode;
	}

	/**
	 * 设置：账期
	 */
	public void setAccperiod(String accperiod) {
		this.accperiod = accperiod;
	}
	/**
	 * 获取：账期
	 */
	public String getAccperiod() {
		return accperiod;
	}

	/**
	 * 设置：保险客户费率
	 */
	public void setPolicyrate(Double policyrate) {
		this.policyrate = policyrate;
	}
	/**
	 * 获取：保险客户费率
	 */
	public Double getPolicyrate() {
		return policyrate;
	}

	/**
	 * 设置：关联单位
	 */
	public void setRelationid(Long relationid) {
		this.relationid = relationid;
	}
	/**
	 * 获取：关联单位
	 */
	public Long getRelationid() {
		return relationid;
	}

	/**
	 * 设置：注册资质
	 */
	public void setZizhi(String zizhi) {
		this.zizhi = zizhi;
	}
	/**
	 * 获取：注册资质
	 */
	public String getZizhi() {
		return zizhi;
	}

	/**
	 * 设置：业务类型
	 */
	public void setBusstype(String busstype) {
		this.busstype = busstype;
	}
	/**
	 * 获取：业务类型
	 */
	public String getBusstype() {
		return busstype;
	}

	/**
	 * 设置：类型
	 */
	public void setType(Integer type) {
		this.type = type;
	}
	/**
	 * 获取：类型
	 */
	public Integer getType() {
		return type;
	}


                                                            /**
             * 设置：上级组织name
             */
            public void setParentIdname(String name) {
                this.parentIdname = name;
            }
            /**
             * 获取：上级组织name
             */
            public String getParentIdname() {
                return parentIdname;
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
             * 设置：业务类型enumvaluename
             */
            public void setBusstypeenumvaluename(String enumvaluename) {
                this.busstypeenumvaluename = enumvaluename;
            }
            /**
             * 获取：业务类型enumvaluename
             */
            public String getBusstypeenumvaluename() {
                return busstypeenumvaluename;
            }
                                /**
             * 设置：类型enumvaluename
             */
            public void setTypeenumvaluename(String enumvaluename) {
                this.typeenumvaluename = enumvaluename;
            }
            /**
             * 获取：类型enumvaluename
             */
            public String getTypeenumvaluename() {
                return typeenumvaluename;
            }
            }
