package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;



/**
 * 品类表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-09 18:39:54
 */
public class GclassEntity implements Serializable {
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


	/**
	 * 上级部门名称
	 */
	private String parentName;
	private Long id;
	//上级类别ID
	private Long parentid;
	//名称
	private String name;
	//编码
	private Integer code;


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
	 * 设置：上级类别ID
	 */
	public void setParentid(Long parentid) {
		this.parentid = parentid;
	}
	/**
	 * 获取：上级类别ID
	 */
	public Long getParentid() {
		return parentid;
	}

	/**
	 * 设置：上级类别名称
	 */
	public void setParentName(String parentName) {
		this.parentName = parentName;
	}
	/**
	 * 获取：上级类别名称
	 */
	public String getParentName() {
		return parentName;
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
	 * 设置：编码
	 */
	public void setCode(Integer code) {
		this.code = code;
	}
	/**
	 * 获取：编码
	 */
	public Integer getCode() {
		return code;
	}
}
