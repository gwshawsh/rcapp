package com.ruanchuangsoft.platform.entity;

import com.ruanchuangsoft.platform.entity.AbstractEntity;

import java.io.Serializable;
import java.util.Date;


import java.math.BigDecimal;



/**
 * 空箱计划
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-06 19:09:28
 */
public class EmptymainEntity extends AbstractEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//单据号
	private String billno;
	//客户
	private Long orgid;
	//提单号
	private String ladingcode;
	//船名
	private String shipname;
	//航次
	private String flight;
	//船公司
	private Long shipid;
	//进港点
	private Long portid;
	//箱量
	private Integer boxqty;
	//箱型
	private Long boxtype;
	//提箱场站
	private Long takeboxplaceid;
	//目的地
	private Long endplaceid;
	//船期
	private Date shipdate;
	//集港时间
	private Date bgnshipdatetime;
	//截港时间
	private Date endshipdatetime;
	//预计用箱时间
	private Date planarrdatetime;
	//是否放箱
	private Integer istakebox;
	//是否运输
	private Integer istrans;
	//备注
	private String remark;
	//单据状态
	private Integer billstatus;
	//制单人
	private Long makeuser;
	//制单日期
	private Date makedate;
	//审核人
	private Long accuser;
	//审核日期
	private Date accdate;
	//更新时间
	private Date uptdate;

			        //客户
        private String orgidname;
						        //进港点
        private String portidname;
			        //箱型
        private String boxtypeboxsize;
		        //提箱场站
        private String takeboxplaceidname;
		        //目的地
        private String endplaceidname;
						        //是否放箱
        private String istakeboxenumvaluename;
		        //是否运输
        private String istransenumvaluename;
			        //单据状态
        private String billstatusenumvaluename;
		        //制单人
        private String makeuserfullname;
			        //审核人
        private String accuserfullname;
			
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
	 * 设置：客户
	 */
	public void setOrgid(Long orgid) {
		this.orgid = orgid;
	}
	/**
	 * 获取：客户
	 */
	public Long getOrgid() {
		return orgid;
	}
	/**
	 * 设置：提单号
	 */
	public void setLadingcode(String ladingcode) {
		this.ladingcode = ladingcode;
	}
	/**
	 * 获取：提单号
	 */
	public String getLadingcode() {
		return ladingcode;
	}
	/**
	 * 设置：船名
	 */
	public void setShipname(String shipname) {
		this.shipname = shipname;
	}
	/**
	 * 获取：船名
	 */
	public String getShipname() {
		return shipname;
	}
	/**
	 * 设置：航次
	 */
	public void setFlight(String flight) {
		this.flight = flight;
	}
	/**
	 * 获取：航次
	 */
	public String getFlight() {
		return flight;
	}
	/**
	 * 设置：船公司
	 */
	public void setShipid(Long shipid) {
		this.shipid = shipid;
	}
	/**
	 * 获取：船公司
	 */
	public Long getShipid() {
		return shipid;
	}
	/**
	 * 设置：进港点
	 */
	public void setPortid(Long portid) {
		this.portid = portid;
	}
	/**
	 * 获取：进港点
	 */
	public Long getPortid() {
		return portid;
	}
	/**
	 * 设置：箱量
	 */
	public void setBoxqty(Integer boxqty) {
		this.boxqty = boxqty;
	}
	/**
	 * 获取：箱量
	 */
	public Integer getBoxqty() {
		return boxqty;
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
	 * 设置：提箱场站
	 */
	public void setTakeboxplaceid(Long takeboxplaceid) {
		this.takeboxplaceid = takeboxplaceid;
	}
	/**
	 * 获取：提箱场站
	 */
	public Long getTakeboxplaceid() {
		return takeboxplaceid;
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
	 * 设置：船期
	 */
	public void setShipdate(Date shipdate) {
		this.shipdate = shipdate;
	}
	/**
	 * 获取：船期
	 */
	public Date getShipdate() {
		return shipdate;
	}
	/**
	 * 设置：集港时间
	 */
	public void setBgnshipdatetime(Date bgnshipdatetime) {
		this.bgnshipdatetime = bgnshipdatetime;
	}
	/**
	 * 获取：集港时间
	 */
	public Date getBgnshipdatetime() {
		return bgnshipdatetime;
	}
	/**
	 * 设置：截港时间
	 */
	public void setEndshipdatetime(Date endshipdatetime) {
		this.endshipdatetime = endshipdatetime;
	}
	/**
	 * 获取：截港时间
	 */
	public Date getEndshipdatetime() {
		return endshipdatetime;
	}
	/**
	 * 设置：预计用箱时间
	 */
	public void setPlanarrdatetime(Date planarrdatetime) {
		this.planarrdatetime = planarrdatetime;
	}
	/**
	 * 获取：预计用箱时间
	 */
	public Date getPlanarrdatetime() {
		return planarrdatetime;
	}
	/**
	 * 设置：是否放箱
	 */
	public void setIstakebox(Integer istakebox) {
		this.istakebox = istakebox;
	}
	/**
	 * 获取：是否放箱
	 */
	public Integer getIstakebox() {
		return istakebox;
	}
	/**
	 * 设置：是否运输
	 */
	public void setIstrans(Integer istrans) {
		this.istrans = istrans;
	}
	/**
	 * 获取：是否运输
	 */
	public Integer getIstrans() {
		return istrans;
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
	 * 设置：单据状态
	 */
	public void setBillstatus(Integer billstatus) {
		this.billstatus = billstatus;
	}
	/**
	 * 获取：单据状态
	 */
	public Integer getBillstatus() {
		return billstatus;
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
	 * 设置：审核人
	 */
	public void setAccuser(Long accuser) {
		this.accuser = accuser;
	}
	/**
	 * 获取：审核人
	 */
	public Long getAccuser() {
		return accuser;
	}
	/**
	 * 设置：审核日期
	 */
	public void setAccdate(Date accdate) {
		this.accdate = accdate;
	}
	/**
	 * 获取：审核日期
	 */
	public Date getAccdate() {
		return accdate;
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
         * 设置：客户name
         */
        public void setOrgidname(String name) {
            this.orgidname = name;
        }
        /**
         * 获取：客户name
         */
        public String getOrgidname() {
            return orgidname;
        }
        															        /**
         * 设置：进港点name
         */
        public void setPortidname(String name) {
            this.portidname = name;
        }
        /**
         * 获取：进港点name
         */
        public String getPortidname() {
            return portidname;
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
         * 设置：提箱场站name
         */
        public void setTakeboxplaceidname(String name) {
            this.takeboxplaceidname = name;
        }
        /**
         * 获取：提箱场站name
         */
        public String getTakeboxplaceidname() {
            return takeboxplaceidname;
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
         * 设置：是否放箱enumvaluename
         */
        public void setIstakeboxenumvaluename(String enumvaluename) {
            this.istakeboxenumvaluename = enumvaluename;
        }
        /**
         * 获取：是否放箱enumvaluename
         */
        public String getIstakeboxenumvaluename() {
            return istakeboxenumvaluename;
        }
        			        /**
         * 设置：是否运输enumvaluename
         */
        public void setIstransenumvaluename(String enumvaluename) {
            this.istransenumvaluename = enumvaluename;
        }
        /**
         * 获取：是否运输enumvaluename
         */
        public String getIstransenumvaluename() {
            return istransenumvaluename;
        }
        						        /**
         * 设置：单据状态enumvaluename
         */
        public void setBillstatusenumvaluename(String enumvaluename) {
            this.billstatusenumvaluename = enumvaluename;
        }
        /**
         * 获取：单据状态enumvaluename
         */
        public String getBillstatusenumvaluename() {
            return billstatusenumvaluename;
        }
        			        /**
         * 设置：制单人fullname
         */
        public void setMakeuserfullname(String fullname) {
            this.makeuserfullname = fullname;
        }
        /**
         * 获取：制单人fullname
         */
        public String getMakeuserfullname() {
            return makeuserfullname;
        }
        						        /**
         * 设置：审核人fullname
         */
        public void setAccuserfullname(String fullname) {
            this.accuserfullname = fullname;
        }
        /**
         * 获取：审核人fullname
         */
        public String getAccuserfullname() {
            return accuserfullname;
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
                        "  <div class=\"el-form-item__content\"><a class='billno' onclick=\"openfunc('emptymain/index','空箱计划')\"><span>"+getBillno()+"</span></a>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">客户</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getOrgidname()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">提单号</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getLadingcode()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">船名</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getShipname()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">航次</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getFlight()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">船公司</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getShipid()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">进港点</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getPortidname()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">箱量</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getBoxqty()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">箱型</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getBoxtypeboxsize()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">提箱场站</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getTakeboxplaceidname()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">目的地</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getEndplaceidname()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">船期</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getShipdate()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">集港时间</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getBgnshipdatetime()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">截港时间</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getEndshipdatetime()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">预计用箱时间</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getPlanarrdatetime()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">是否放箱</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getIstakeboxenumvaluename()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">是否运输</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getIstransenumvaluename()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">备注</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getRemark()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">单据状态</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getBillstatusenumvaluename()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">制单人</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getMakeuserfullname()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">制单日期</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getMakedate()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">审核人</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getAccuserfullname()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">审核日期</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getAccdate()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">更新时间</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getUptdate()+"</span>\n" +
                        "  </div> </div>");
			
		        sb.append("</form>");
        return sb.toString();

    }
}
