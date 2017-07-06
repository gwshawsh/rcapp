package com.ruanchuangsoft.platform.entity;

        import java.io.Serializable;
        import java.util.Date;
        import java.util.List;

        import com.ruanchuangsoft.platform.entity.ContractdetailEntity;

        import java.math.BigDecimal;


/**
 * 合同管理
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-06 16:29:12
 */
public class ContractmainEntity extends AbstractEntity implements Serializable {
    private static final long serialVersionUID = 1L;

            //
        private Long id;
            //单据号
        private String billno;
            //甲方
        private Long partyaid;
            //乙方
        private Long partybid;
            //收付款类型
        private Integer billtype;
            //付款方式
        private Long paytype;
            //结算周期
        private Integer paycircleid;
            //生效日期
        private Date bgndate;
            //失效日期
        private Date enddate;
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
            //流程ID
        private String pocessinstanceid;
    

    
        

    
        

    
                    //甲方
            private String partyaidname;
        

    
                    //乙方
            private String partybidname;
        

    
                    //收付款类型
            private String billtypeenumvaluename;
        

    
                    //付款方式
            private String paytypeenumvaluename;
        

    
                    //结算周期
            private String paycircleidname;
        

    
        

    
        

    
        

    
                    //单据状态
            private String billstatusenumvaluename;
        

    
                    //制单人
            private String makeuserfullname;
        

    
        

    
                    //审核人
            private String accuserfullname;
        

    
        

    
        

    
        

    
    //单据明细
    private List<ContractdetailEntity> details;

    public void setDetails(List<ContractdetailEntity> details) {
        this.details = details;
    }

    public List<ContractdetailEntity> getDetails() {
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
         * 设置：甲方
         */
        public void setPartyaid(Long partyaid) {
            this.partyaid = partyaid;
        }

        /**
         * 获取：甲方
         */
        public Long getPartyaid() {
            return partyaid;
        }
            /**
         * 设置：乙方
         */
        public void setPartybid(Long partybid) {
            this.partybid = partybid;
        }

        /**
         * 获取：乙方
         */
        public Long getPartybid() {
            return partybid;
        }
            /**
         * 设置：收付款类型
         */
        public void setBilltype(Integer billtype) {
            this.billtype = billtype;
        }

        /**
         * 获取：收付款类型
         */
        public Integer getBilltype() {
            return billtype;
        }
            /**
         * 设置：付款方式
         */
        public void setPaytype(Long paytype) {
            this.paytype = paytype;
        }

        /**
         * 获取：付款方式
         */
        public Long getPaytype() {
            return paytype;
        }
            /**
         * 设置：结算周期
         */
        public void setPaycircleid(Integer paycircleid) {
            this.paycircleid = paycircleid;
        }

        /**
         * 获取：结算周期
         */
        public Integer getPaycircleid() {
            return paycircleid;
        }
            /**
         * 设置：生效日期
         */
        public void setBgndate(Date bgndate) {
            this.bgndate = bgndate;
        }

        /**
         * 获取：生效日期
         */
        public Date getBgndate() {
            return bgndate;
        }
            /**
         * 设置：失效日期
         */
        public void setEnddate(Date enddate) {
            this.enddate = enddate;
        }

        /**
         * 获取：失效日期
         */
        public Date getEnddate() {
            return enddate;
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
         * 设置：流程ID
         */
        public void setPocessinstanceid(String pocessinstanceid) {
            this.pocessinstanceid = pocessinstanceid;
        }

        /**
         * 获取：流程ID
         */
        public String getPocessinstanceid() {
            return pocessinstanceid;
        }
    
                                                /**
             * 设置：甲方name
             */
            public void setPartyaidname(String name) {
                this.partyaidname = name;
            }

            /**
             * 获取：甲方name
             */
            public String getPartyaidname() {
                return partyaidname;
            }
                                /**
             * 设置：乙方name
             */
            public void setPartybidname(String name) {
                this.partybidname = name;
            }

            /**
             * 获取：乙方name
             */
            public String getPartybidname() {
                return partybidname;
            }
                                /**
             * 设置：收付款类型enumvaluename
             */
            public void setBilltypeenumvaluename(String enumvaluename) {
                this.billtypeenumvaluename = enumvaluename;
            }

            /**
             * 获取：收付款类型enumvaluename
             */
            public String getBilltypeenumvaluename() {
                return billtypeenumvaluename;
            }
                                /**
             * 设置：付款方式enumvaluename
             */
            public void setPaytypeenumvaluename(String enumvaluename) {
                this.paytypeenumvaluename = enumvaluename;
            }

            /**
             * 获取：付款方式enumvaluename
             */
            public String getPaytypeenumvaluename() {
                return paytypeenumvaluename;
            }
                                /**
             * 设置：结算周期name
             */
            public void setPaycircleidname(String name) {
                this.paycircleidname = name;
            }

            /**
             * 获取：结算周期name
             */
            public String getPaycircleidname() {
                return paycircleidname;
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
                        "  <div class=\"el-form-item__content\"><a class='billno' onclick=\"openfunc('contractmain/index','合同管理')\"><span>"+getBillno()+"</span></a>\n" +
                        "  </div> </div>");
            
                                    sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">甲方</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getPartyaidname()+"</span>\n" +
                        "  </div> </div>");
            
                                    sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">乙方</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getPartybidname()+"</span>\n" +
                        "  </div> </div>");
            
                                    sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">收付款类型</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getBilltypeenumvaluename()+"</span>\n" +
                        "  </div> </div>");
            
                                    sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">付款方式</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getPaytypeenumvaluename()+"</span>\n" +
                        "  </div> </div>");
            
                                    sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">结算周期</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getPaycircleidname()+"</span>\n" +
                        "  </div> </div>");
            
                                    sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">生效日期</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getBgndate()+"</span>\n" +
                        "  </div> </div>");
            
                                    sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">失效日期</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getEnddate()+"</span>\n" +
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
