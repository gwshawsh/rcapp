package com.ruanchuangsoft.platform.entity;

        import java.io.Serializable;
        import java.util.Date;
        import java.util.List;

        import com.ruanchuangsoft.platform.entity.TakeboxdetailEntity;

        import java.math.BigDecimal;


/**
 * 放箱计划
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-21 17:50:42
 */
public class TakeboxmainEntity extends AbstractEntity implements Serializable {
    private static final long serialVersionUID = 1L;

            //
        private Long id;
            //单据号
        private String billno;
            //参照单据号
        private String refbillno;
            //参照单据类型
        private Integer refbilltype;
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
            //要箱箱量
        private Integer boxqty;
            //实放箱量
        private Integer realboxqty;
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
        private Date bgnplanarrtime;
            //最晚到场时间
        private Date endplanarrtime;
            //改单费
        private BigDecimal changefee;
            //放单收入
        private BigDecimal yingshou;
            //放单成本
        private BigDecimal yingfu;
            //用箱要求
        private String custremark;
            //放单备注
        private String takeboxremark;
            //异常原因
        private String errorremark;
            //改单要求
        private String changeremark;
            //放箱公司
        private Long takeboxorgid;
            //联系人
        private String linkman;
            //联系电话
        private String linkmobile;
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
    

    
        

    
        

    
        

    
                    //参照单据类型
            private String refbilltypeenumvaluename;
        

    
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
        

    
        

    
        

    
        

    
        

    
        

    
        

    
        

    
        

    
        

    
        

    
        

    
        

    
                    //放箱公司
            private String takeboxorgidname;
        

    
        

    
        

    
                    //单据状态
            private String billstatusenumvaluename;
        

    
                    //制单人
            private String makeuserfullname;
        

    
        

    
                    //审核人
            private String accuserfullname;
        

    
        

    
        

    
    //单据明细
    private List<TakeboxdetailEntity> details;

    public void setDetails(List<TakeboxdetailEntity> details) {
        this.details = details;
    }

    public List<TakeboxdetailEntity> getDetails() {
        return details;
    }



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
         * 设置：参照单据号
         */
        public void setRefbillno(String refbillno) {
            this.refbillno = refbillno;
        }

        /**
         * 获取：参照单据号
         */
        public String getRefbillno() {
            return refbillno;
        }
            /**
         * 设置：参照单据类型
         */
        public void setRefbilltype(Integer refbilltype) {
            this.refbilltype = refbilltype;
        }

        /**
         * 获取：参照单据类型
         */
        public Integer getRefbilltype() {
            return refbilltype;
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
         * 设置：要箱箱量
         */
        public void setBoxqty(Integer boxqty) {
            this.boxqty = boxqty;
        }

        /**
         * 获取：要箱箱量
         */
        public Integer getBoxqty() {
            return boxqty;
        }
            /**
         * 设置：实放箱量
         */
        public void setRealboxqty(Integer realboxqty) {
            this.realboxqty = realboxqty;
        }

        /**
         * 获取：实放箱量
         */
        public Integer getRealboxqty() {
            return realboxqty;
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
        public void setBgnplanarrtime(Date bgnplanarrtime) {
            this.bgnplanarrtime = bgnplanarrtime;
        }

        /**
         * 获取：预计用箱时间
         */
        public Date getBgnplanarrtime() {
            return bgnplanarrtime;
        }
            /**
         * 设置：最晚到场时间
         */
        public void setEndplanarrtime(Date endplanarrtime) {
            this.endplanarrtime = endplanarrtime;
        }

        /**
         * 获取：最晚到场时间
         */
        public Date getEndplanarrtime() {
            return endplanarrtime;
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
         * 设置：用箱要求
         */
        public void setCustremark(String custremark) {
            this.custremark = custremark;
        }

        /**
         * 获取：用箱要求
         */
        public String getCustremark() {
            return custremark;
        }
            /**
         * 设置：放单备注
         */
        public void setTakeboxremark(String takeboxremark) {
            this.takeboxremark = takeboxremark;
        }

        /**
         * 获取：放单备注
         */
        public String getTakeboxremark() {
            return takeboxremark;
        }
            /**
         * 设置：异常原因
         */
        public void setErrorremark(String errorremark) {
            this.errorremark = errorremark;
        }

        /**
         * 获取：异常原因
         */
        public String getErrorremark() {
            return errorremark;
        }
            /**
         * 设置：改单要求
         */
        public void setChangeremark(String changeremark) {
            this.changeremark = changeremark;
        }

        /**
         * 获取：改单要求
         */
        public String getChangeremark() {
            return changeremark;
        }
            /**
         * 设置：放箱公司
         */
        public void setTakeboxorgid(Long takeboxorgid) {
            this.takeboxorgid = takeboxorgid;
        }

        /**
         * 获取：放箱公司
         */
        public Long getTakeboxorgid() {
            return takeboxorgid;
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
         * 设置：联系电话
         */
        public void setLinkmobile(String linkmobile) {
            this.linkmobile = linkmobile;
        }

        /**
         * 获取：联系电话
         */
        public String getLinkmobile() {
            return linkmobile;
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
             * 设置：参照单据类型enumvaluename
             */
            public void setRefbilltypeenumvaluename(String enumvaluename) {
                this.refbilltypeenumvaluename = enumvaluename;
            }

            /**
             * 获取：参照单据类型enumvaluename
             */
            public String getRefbilltypeenumvaluename() {
                return refbilltypeenumvaluename;
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
             * 设置：放箱公司name
             */
            public void setTakeboxorgidname(String name) {
                this.takeboxorgidname = name;
            }

            /**
             * 获取：放箱公司name
             */
            public String getTakeboxorgidname() {
                return takeboxorgidname;
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
                        "  <div class=\"el-form-item__content\"><a class='billno' onclick=\"openfunc('takeboxmain/index','放箱计划')\"><span>"+getBillno()+"</span></a>\n" +
                        "  </div> </div>");
            
                                    sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">参照单据号</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getRefbillno()+"</span>\n" +
                        "  </div> </div>");
            
                                    sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">参照单据类型</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getRefbilltypeenumvaluename()+"</span>\n" +
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
                        "  <label class=\"el-form-item__label\">要箱箱量</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getBoxqty()+"</span>\n" +
                        "  </div> </div>");
            
                                    sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">实放箱量</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getRealboxqty()+"</span>\n" +
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
                        "  <div class=\"el-form-item__content\"><span>"+getBgnplanarrtime()+"</span>\n" +
                        "  </div> </div>");
            
                                    sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">最晚到场时间</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getEndplanarrtime()+"</span>\n" +
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
                        "  <label class=\"el-form-item__label\">放单成本</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getYingfu()+"</span>\n" +
                        "  </div> </div>");
            
                                    sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">用箱要求</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getCustremark()+"</span>\n" +
                        "  </div> </div>");
            
                                    sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">放单备注</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getTakeboxremark()+"</span>\n" +
                        "  </div> </div>");
            
                                    sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">异常原因</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getErrorremark()+"</span>\n" +
                        "  </div> </div>");
            
                                    sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">改单要求</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getChangeremark()+"</span>\n" +
                        "  </div> </div>");
            
                                    sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">放箱公司</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getTakeboxorgidname()+"</span>\n" +
                        "  </div> </div>");
            
                                    sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">联系人</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getLinkman()+"</span>\n" +
                        "  </div> </div>");
            
                                    sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">联系电话</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getLinkmobile()+"</span>\n" +
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
