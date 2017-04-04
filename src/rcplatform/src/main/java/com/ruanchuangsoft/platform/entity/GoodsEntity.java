package com.ruanchuangsoft.platform.entity;

import java.io.Serializable;
import java.math.BigDecimal;


/**
 * 商品表
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2017-03-20 17:51:23
 */
public class GoodsEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long goodsId;
	//父菜单ID，一级菜单为0
	private Long classId;
	//菜单名称
	private String name;
	//菜单URL
	private BigDecimal price;
	//类型   0：目录   1：菜单   2：按钮
	private Integer gcount;
	//菜单图标
	private String icon;
	//排序
	private Integer orderNum;

	/**
	 * 设置：
	 */
	public void setGoodsId(Long goodsId) {
		this.goodsId = goodsId;
	}
	/**
	 * 获取：
	 */
	public Long getGoodsId() {
		return goodsId;
	}
	/**
	 * 设置：父菜单ID，一级菜单为0
	 */
	public void setClassId(Long classId) {
		this.classId = classId;
	}
	/**
	 * 获取：父菜单ID，一级菜单为0
	 */
	public Long getClassId() {
		return classId;
	}
	/**
	 * 设置：菜单名称
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * 获取：菜单名称
	 */
	public String getName() {
		return name;
	}
	/**
	 * 设置：菜单URL
	 */
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	/**
	 * 获取：菜单URL
	 */
	public BigDecimal getPrice() {
		return price;
	}
	/**
	 * 设置：类型   0：目录   1：菜单   2：按钮
	 */
	public void setGcount(Integer gcount) {
		this.gcount = gcount;
	}
	/**
	 * 获取：类型   0：目录   1：菜单   2：按钮
	 */
	public Integer getGcount() {
		return gcount;
	}
	/**
	 * 设置：菜单图标
	 */
	public void setIcon(String icon) {
		this.icon = icon;
	}
	/**
	 * 获取：菜单图标
	 */
	public String getIcon() {
		return icon;
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
