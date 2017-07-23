package com.ruanchuangsoft.platform.entity;

import com.ruanchuangsoft.platform.entity.AbstractEntity;

import java.io.Serializable;
import java.util.Date;


import java.math.BigDecimal;



/**
 * 商品表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-22 23:26:27
 */
public class GoodsEntity extends AbstractEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//类别
	private Long classid;
	//费用类别
	private Long feetypeid;
	//责任部门
	private Long deptid;
	//编码
	private String code;
	//名称
	private String name;
	//规格
	private String spec;
	//单位
	private String unit;
	//备注
	private String remark;
	//单价
	private Double price;
	//库存
	private Integer gcount;

		        //类别
        private String classidname;
		        //费用类别
        private String feetypeidname;
		        //责任部门
        private String deptidname;
								
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
	 * 设置：类别
	 */
	public void setClassid(Long classid) {
		this.classid = classid;
	}
	/**
	 * 获取：类别
	 */
	public Long getClassid() {
		return classid;
	}
	/**
	 * 设置：费用类别
	 */
	public void setFeetypeid(Long feetypeid) {
		this.feetypeid = feetypeid;
	}
	/**
	 * 获取：费用类别
	 */
	public Long getFeetypeid() {
		return feetypeid;
	}
	/**
	 * 设置：责任部门
	 */
	public void setDeptid(Long deptid) {
		this.deptid = deptid;
	}
	/**
	 * 获取：责任部门
	 */
	public Long getDeptid() {
		return deptid;
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
	 * 设置：规格
	 */
	public void setSpec(String spec) {
		this.spec = spec;
	}
	/**
	 * 获取：规格
	 */
	public String getSpec() {
		return spec;
	}
	/**
	 * 设置：单位
	 */
	public void setUnit(String unit) {
		this.unit = unit;
	}
	/**
	 * 获取：单位
	 */
	public String getUnit() {
		return unit;
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
	 * 设置：单价
	 */
	public void setPrice(Double price) {
		this.price = price;
	}
	/**
	 * 获取：单价
	 */
	public Double getPrice() {
		return price;
	}
	/**
	 * 设置：库存
	 */
	public void setGcount(Integer gcount) {
		this.gcount = gcount;
	}
	/**
	 * 获取：库存
	 */
	public Integer getGcount() {
		return gcount;
	}


						        /**
         * 设置：类别name
         */
        public void setClassidname(String name) {
            this.classidname = name;
        }
        /**
         * 获取：类别name
         */
        public String getClassidname() {
            return classidname;
        }
        			        /**
         * 设置：费用类别name
         */
        public void setFeetypeidname(String name) {
            this.feetypeidname = name;
        }
        /**
         * 获取：费用类别name
         */
        public String getFeetypeidname() {
            return feetypeidname;
        }
        			        /**
         * 设置：责任部门name
         */
        public void setDeptidname(String name) {
            this.deptidname = name;
        }
        /**
         * 获取：责任部门name
         */
        public String getDeptidname() {
            return deptidname;
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
                        "  <label class=\"el-form-item__label\">类别</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getClassidname()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">费用类别</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getFeetypeidname()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">责任部门</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getDeptidname()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">编码</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getCode()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">名称</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getName()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">规格</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getSpec()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">单位</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getUnit()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">备注</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getRemark()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">单价</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getPrice()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">库存</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getGcount()+"</span>\n" +
                        "  </div> </div>");
			
		        sb.append("</form>");
        return sb.toString();

    }
}
