package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;


/**
 * 费用项目
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-16 22:16:34
 */
public class FeeinfoEntity implements Serializable {
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
    	//上级费用
	private Long parentId;
    	//编码
	private String code;
    	//名称
	private String name;
    	//类型
	private Integer feetype;
    	//收付款
	private Integer paytype;
    	//线路
	private Long lineid;
    	//箱型
	private Long boxtype;
    	//标准单价
	private BigDecimal price;
    	//标准成本
	private BigDecimal cost;
    	//备注
	private String remark;
    	//状态
	private Long status;
    	//节点类型
	private Integer nodetype;
    	//更新时间
	private Date uptdate;
    
                                                                        //类型
            private String feetypeenumvaluename;
                                //收付款
            private String paytypeenumvaluename;
                                //线路
            private String lineidname;
                                //箱型
            private String boxtypeboxsize;
                                                                                //节点类型
            private String nodetypeenumvaluename;
                        

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
	 * 设置：上级费用
	 */
	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}
	/**
	 * 获取：上级费用
	 */
	public Long getParentId() {
		return parentId;
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
	 * 设置：类型
	 */
	public void setFeetype(Integer feetype) {
		this.feetype = feetype;
	}
	/**
	 * 获取：类型
	 */
	public Integer getFeetype() {
		return feetype;
	}

	/**
	 * 设置：收付款
	 */
	public void setPaytype(Integer paytype) {
		this.paytype = paytype;
	}
	/**
	 * 获取：收付款
	 */
	public Integer getPaytype() {
		return paytype;
	}

	/**
	 * 设置：线路
	 */
	public void setLineid(Long lineid) {
		this.lineid = lineid;
	}
	/**
	 * 获取：线路
	 */
	public Long getLineid() {
		return lineid;
	}

	/**
	 * 设置：箱型
	 */
	public void setBoxtype(Long boxtype) {
		this.boxtype = boxtype;
	}
	/**
	 * 获取：箱型
	 */
	public Long getBoxtype() {
		return boxtype;
	}

	/**
	 * 设置：标准单价
	 */
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	/**
	 * 获取：标准单价
	 */
	public BigDecimal getPrice() {
		return price;
	}

	/**
	 * 设置：标准成本
	 */
	public void setCost(BigDecimal cost) {
		this.cost = cost;
	}
	/**
	 * 获取：标准成本
	 */
	public BigDecimal getCost() {
		return cost;
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
	 * 设置：状态
	 */
	public void setStatus(Long status) {
		this.status = status;
	}
	/**
	 * 获取：状态
	 */
	public Long getStatus() {
		return status;
	}

	/**
	 * 设置：节点类型
	 */
	public void setNodetype(Integer nodetype) {
		this.nodetype = nodetype;
	}
	/**
	 * 获取：节点类型
	 */
	public Integer getNodetype() {
		return nodetype;
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
             * 设置：类型enumvaluename
             */
            public void setFeetypeenumvaluename(String enumvaluename) {
                this.feetypeenumvaluename = enumvaluename;
            }
            /**
             * 获取：类型enumvaluename
             */
            public String getFeetypeenumvaluename() {
                return feetypeenumvaluename;
            }
                                /**
             * 设置：收付款enumvaluename
             */
            public void setPaytypeenumvaluename(String enumvaluename) {
                this.paytypeenumvaluename = enumvaluename;
            }
            /**
             * 获取：收付款enumvaluename
             */
            public String getPaytypeenumvaluename() {
                return paytypeenumvaluename;
            }
                                /**
             * 设置：线路name
             */
            public void setLineidname(String name) {
                this.lineidname = name;
            }
            /**
             * 获取：线路name
             */
            public String getLineidname() {
                return lineidname;
            }
                                /**
             * 设置：箱型boxsize
             */
            public void setBoxtypeboxsize(String boxsize) {
                this.boxtypeboxsize = boxsize;
            }
            /**
             * 获取：箱型boxsize
             */
            public String getBoxtypeboxsize() {
                return boxtypeboxsize;
            }
                                                                                /**
             * 设置：节点类型enumvaluename
             */
            public void setNodetypeenumvaluename(String enumvaluename) {
                this.nodetypeenumvaluename = enumvaluename;
            }
            /**
             * 获取：节点类型enumvaluename
             */
            public String getNodetypeenumvaluename() {
                return nodetypeenumvaluename;
            }
                        }
