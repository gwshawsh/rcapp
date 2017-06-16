package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;


/**
 * 费用科目
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-06 12:43:24
 */
public class CostcategoryEntity implements Serializable {
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
	//上级科目
	private Long parentId;
	//科目编号
	private String code;
	//科目名称
	private String name;
	//备注
	private String remark;
	//状态
	private Long status;
	//排序
	private Integer orderNum;


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
	 * 设置：上级科目
	 */
	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}
	/**
	 * 获取：上级科目
	 */
	public Long getParentId() {
		return parentId;
	}

	/**
	 * 设置：科目编号
	 */
	public void setCode(String code) {
		this.code = code;
	}
	/**
	 * 获取：科目编号
	 */
	public String getCode() {
		return code;
	}

	/**
	 * 设置：科目名称
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * 获取：科目名称
	 */
	public String getName() {
		return name;
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
	 * 设置：排序
	 */
	public void setOrderNum(Integer orderNum) {
		this.orderNum = orderNum;
	}
	/**
	 * 获取：排序
	 */
	public Integer getOrderNum() {
		return orderNum;
	}
}
