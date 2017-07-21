package com.ruanchuangsoft.platform.entity;

import com.ruanchuangsoft.platform.entity.AbstractEntity;

import java.io.Serializable;
import java.util.Date;


import java.math.BigDecimal;



/**
 * 放箱计划明细表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-21 17:50:42
 */
public class TakeboxdetailEntity extends AbstractEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//单据号
	private String billno;
	//序号
	private Long serialno;
	//运输公司
	private Long transcompanyid;
	//原起运地点
	private Long startplaceid1;
	//现起运点
	private Long startplaceid2;
	//现起运点
	private Long realplaceid2;
	//目的地
	private Long endplaceid;
	//改单类型
	private Integer changeplacetype;
	//箱号
	private String boxno;
	//铅封号
	private String fengno;
	//计划提箱时间
	private Date plantaketime;
	//实际提箱时间
	private Date realtaketime;
	//计划到场时间
	private Date planarrvetime;
	//实际到场时间
	private Date realarrvetime;
	//改单费
	private BigDecimal changefee;
	//放单收入
	private BigDecimal yingshou;
	//放单费(收入)
	private BigDecimal fangdanfeein;
	//劳务费(收入)
	private BigDecimal laowufeein;
	//提箱费(收入)
	private BigDecimal tixiangfeein;
	//其他费用(收入)
	private BigDecimal otherfeein;
	//放单成本
	private BigDecimal yingfu;
	//打单费(成本)
	private BigDecimal dadanfeeout;
	//放单费(成本)
	private BigDecimal fangdanfeeout;
	//提箱费(成本)
	private BigDecimal tixiangfeeout;
	//劳务费(成本)
	private BigDecimal laowufeeout;
	//其他费用(成本)
	private BigDecimal otherfeeout;
	//备注
	private String remark;
	//更新时间
	private Date uptdate;

				        //运输公司
        private String transcompanyidname;
		        //原起运地点
        private String startplaceid1name;
		        //现起运点
        private String startplaceid2name;
		        //现起运点
        private String realplaceid2name;
		        //目的地
        private String endplaceidname;
		        //改单类型
        private String changeplacetypeenumvaluename;
																					
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
	 * 设置：序号
	 */
	public void setSerialno(Long serialno) {
		this.serialno = serialno;
	}
	/**
	 * 获取：序号
	 */
	public Long getSerialno() {
		return serialno;
	}
	/**
	 * 设置：运输公司
	 */
	public void setTranscompanyid(Long transcompanyid) {
		this.transcompanyid = transcompanyid;
	}
	/**
	 * 获取：运输公司
	 */
	public Long getTranscompanyid() {
		return transcompanyid;
	}
	/**
	 * 设置：原起运地点
	 */
	public void setStartplaceid1(Long startplaceid1) {
		this.startplaceid1 = startplaceid1;
	}
	/**
	 * 获取：原起运地点
	 */
	public Long getStartplaceid1() {
		return startplaceid1;
	}
	/**
	 * 设置：现起运点
	 */
	public void setStartplaceid2(Long startplaceid2) {
		this.startplaceid2 = startplaceid2;
	}
	/**
	 * 获取：现起运点
	 */
	public Long getStartplaceid2() {
		return startplaceid2;
	}
	/**
	 * 设置：现起运点
	 */
	public void setRealplaceid2(Long realplaceid2) {
		this.realplaceid2 = realplaceid2;
	}
	/**
	 * 获取：现起运点
	 */
	public Long getRealplaceid2() {
		return realplaceid2;
	}
	/**
	 * 设置：目的地
	 */
	public void setEndplaceid(Long endplaceid) {
		this.endplaceid = endplaceid;
	}
	/**
	 * 获取：目的地
	 */
	public Long getEndplaceid() {
		return endplaceid;
	}
	/**
	 * 设置：改单类型
	 */
	public void setChangeplacetype(Integer changeplacetype) {
		this.changeplacetype = changeplacetype;
	}
	/**
	 * 获取：改单类型
	 */
	public Integer getChangeplacetype() {
		return changeplacetype;
	}
	/**
	 * 设置：箱号
	 */
	public void setBoxno(String boxno) {
		this.boxno = boxno;
	}
	/**
	 * 获取：箱号
	 */
	public String getBoxno() {
		return boxno;
	}
	/**
	 * 设置：铅封号
	 */
	public void setFengno(String fengno) {
		this.fengno = fengno;
	}
	/**
	 * 获取：铅封号
	 */
	public String getFengno() {
		return fengno;
	}
	/**
	 * 设置：计划提箱时间
	 */
	public void setPlantaketime(Date plantaketime) {
		this.plantaketime = plantaketime;
	}
	/**
	 * 获取：计划提箱时间
	 */
	public Date getPlantaketime() {
		return plantaketime;
	}
	/**
	 * 设置：实际提箱时间
	 */
	public void setRealtaketime(Date realtaketime) {
		this.realtaketime = realtaketime;
	}
	/**
	 * 获取：实际提箱时间
	 */
	public Date getRealtaketime() {
		return realtaketime;
	}
	/**
	 * 设置：计划到场时间
	 */
	public void setPlanarrvetime(Date planarrvetime) {
		this.planarrvetime = planarrvetime;
	}
	/**
	 * 获取：计划到场时间
	 */
	public Date getPlanarrvetime() {
		return planarrvetime;
	}
	/**
	 * 设置：实际到场时间
	 */
	public void setRealarrvetime(Date realarrvetime) {
		this.realarrvetime = realarrvetime;
	}
	/**
	 * 获取：实际到场时间
	 */
	public Date getRealarrvetime() {
		return realarrvetime;
	}
	/**
	 * 设置：改单费
	 */
	public void setChangefee(BigDecimal changefee) {
		this.changefee = changefee;
	}
	/**
	 * 获取：改单费
	 */
	public BigDecimal getChangefee() {
		return changefee;
	}
	/**
	 * 设置：放单收入
	 */
	public void setYingshou(BigDecimal yingshou) {
		this.yingshou = yingshou;
	}
	/**
	 * 获取：放单收入
	 */
	public BigDecimal getYingshou() {
		return yingshou;
	}
	/**
	 * 设置：放单费(收入)
	 */
	public void setFangdanfeein(BigDecimal fangdanfeein) {
		this.fangdanfeein = fangdanfeein;
	}
	/**
	 * 获取：放单费(收入)
	 */
	public BigDecimal getFangdanfeein() {
		return fangdanfeein;
	}
	/**
	 * 设置：劳务费(收入)
	 */
	public void setLaowufeein(BigDecimal laowufeein) {
		this.laowufeein = laowufeein;
	}
	/**
	 * 获取：劳务费(收入)
	 */
	public BigDecimal getLaowufeein() {
		return laowufeein;
	}
	/**
	 * 设置：提箱费(收入)
	 */
	public void setTixiangfeein(BigDecimal tixiangfeein) {
		this.tixiangfeein = tixiangfeein;
	}
	/**
	 * 获取：提箱费(收入)
	 */
	public BigDecimal getTixiangfeein() {
		return tixiangfeein;
	}
	/**
	 * 设置：其他费用(收入)
	 */
	public void setOtherfeein(BigDecimal otherfeein) {
		this.otherfeein = otherfeein;
	}
	/**
	 * 获取：其他费用(收入)
	 */
	public BigDecimal getOtherfeein() {
		return otherfeein;
	}
	/**
	 * 设置：放单成本
	 */
	public void setYingfu(BigDecimal yingfu) {
		this.yingfu = yingfu;
	}
	/**
	 * 获取：放单成本
	 */
	public BigDecimal getYingfu() {
		return yingfu;
	}
	/**
	 * 设置：打单费(成本)
	 */
	public void setDadanfeeout(BigDecimal dadanfeeout) {
		this.dadanfeeout = dadanfeeout;
	}
	/**
	 * 获取：打单费(成本)
	 */
	public BigDecimal getDadanfeeout() {
		return dadanfeeout;
	}
	/**
	 * 设置：放单费(成本)
	 */
	public void setFangdanfeeout(BigDecimal fangdanfeeout) {
		this.fangdanfeeout = fangdanfeeout;
	}
	/**
	 * 获取：放单费(成本)
	 */
	public BigDecimal getFangdanfeeout() {
		return fangdanfeeout;
	}
	/**
	 * 设置：提箱费(成本)
	 */
	public void setTixiangfeeout(BigDecimal tixiangfeeout) {
		this.tixiangfeeout = tixiangfeeout;
	}
	/**
	 * 获取：提箱费(成本)
	 */
	public BigDecimal getTixiangfeeout() {
		return tixiangfeeout;
	}
	/**
	 * 设置：劳务费(成本)
	 */
	public void setLaowufeeout(BigDecimal laowufeeout) {
		this.laowufeeout = laowufeeout;
	}
	/**
	 * 获取：劳务费(成本)
	 */
	public BigDecimal getLaowufeeout() {
		return laowufeeout;
	}
	/**
	 * 设置：其他费用(成本)
	 */
	public void setOtherfeeout(BigDecimal otherfeeout) {
		this.otherfeeout = otherfeeout;
	}
	/**
	 * 获取：其他费用(成本)
	 */
	public BigDecimal getOtherfeeout() {
		return otherfeeout;
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
         * 设置：运输公司name
         */
        public void setTranscompanyidname(String name) {
            this.transcompanyidname = name;
        }
        /**
         * 获取：运输公司name
         */
        public String getTranscompanyidname() {
            return transcompanyidname;
        }
        			        /**
         * 设置：原起运地点name
         */
        public void setStartplaceid1name(String name) {
            this.startplaceid1name = name;
        }
        /**
         * 获取：原起运地点name
         */
        public String getStartplaceid1name() {
            return startplaceid1name;
        }
        			        /**
         * 设置：现起运点name
         */
        public void setStartplaceid2name(String name) {
            this.startplaceid2name = name;
        }
        /**
         * 获取：现起运点name
         */
        public String getStartplaceid2name() {
            return startplaceid2name;
        }
        			        /**
         * 设置：现起运点name
         */
        public void setRealplaceid2name(String name) {
            this.realplaceid2name = name;
        }
        /**
         * 获取：现起运点name
         */
        public String getRealplaceid2name() {
            return realplaceid2name;
        }
        			        /**
         * 设置：目的地name
         */
        public void setEndplaceidname(String name) {
            this.endplaceidname = name;
        }
        /**
         * 获取：目的地name
         */
        public String getEndplaceidname() {
            return endplaceidname;
        }
        			        /**
         * 设置：改单类型enumvaluename
         */
        public void setChangeplacetypeenumvaluename(String enumvaluename) {
            this.changeplacetypeenumvaluename = enumvaluename;
        }
        /**
         * 获取：改单类型enumvaluename
         */
        public String getChangeplacetypeenumvaluename() {
            return changeplacetypeenumvaluename;
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
                        "  <label class=\"el-form-item__label\">单据号</label>"+
                        "  <div class=\"el-form-item__content\"><a class='billno' onclick=\"openfunc('takeboxdetail/index','放箱计划明细表')\"><span>"+getBillno()+"</span></a>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">序号</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getSerialno()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">运输公司</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getTranscompanyidname()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">原起运地点</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getStartplaceid1name()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">现起运点</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getStartplaceid2name()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">现起运点</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getRealplaceid2name()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">目的地</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getEndplaceidname()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">改单类型</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getChangeplacetypeenumvaluename()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">箱号</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getBoxno()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">铅封号</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getFengno()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">计划提箱时间</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getPlantaketime()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">实际提箱时间</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getRealtaketime()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">计划到场时间</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getPlanarrvetime()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">实际到场时间</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getRealarrvetime()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">改单费</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getChangefee()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">放单收入</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getYingshou()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">放单费(收入)</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getFangdanfeein()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">劳务费(收入)</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getLaowufeein()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">提箱费(收入)</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getTixiangfeein()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">其他费用(收入)</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getOtherfeein()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">放单成本</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getYingfu()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">打单费(成本)</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getDadanfeeout()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">放单费(成本)</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getFangdanfeeout()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">提箱费(成本)</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getTixiangfeeout()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">劳务费(成本)</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getLaowufeeout()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">其他费用(成本)</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getOtherfeeout()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">备注</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getRemark()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">更新时间</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getUptdate()+"</span>\n" +
                        "  </div> </div>");
			
		        sb.append("</form>");
        return sb.toString();

    }
}
