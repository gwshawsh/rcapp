package com.ruanchuangsoft.platform.entity;

        import java.io.Serializable;
        import java.util.Date;
        import java.util.List;

        import com.ruanchuangsoft.platform.entity.RequisitiondetailEntity;

        import java.math.BigDecimal;


/**
 * 请购单
 *
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-16 22:30:09
 */
public class RequisitionmainEntity extends AbstractEntity implements Serializable {
    private static final long serialVersionUID = 1L;

            //
        private Long id;
            //单据号
        private String billno;
            //请购人
        private String requser;
            //所属部门
        private Long deptid;
            //请购类别
        private Integer reqtype;
            //预算计划
        private Long budgetmainid;
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
            //备注
        private String remark;
            //流程ID
        private String pocessinstanceid;
    

    
        

    
        

    
                    //请购人
            private String requserfullname;
        

    
                    //所属部门
            private String deptidname;
        

    
                    //请购类别
            private String reqtypeenumvaluename;
        

    
                    //预算计划
            private String budgetmainidbillno;
        

    
                    //单据状态
            private String billstatusenumvaluename;
        

    
                    //制单人
            private String makeuserfullname;
        

    
        

    
                    //审核人
            private String accuserfullname;
        

    
        

    
        

    
        

    
        

    
    //单据明细
    private List<RequisitiondetailEntity> details;

    public void setDetails(List<RequisitiondetailEntity> details) {
        this.details = details;
    }

    public List<RequisitiondetailEntity> getDetails() {
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
         * 设置：请购人
         */
        public void setRequser(String requser) {
            this.requser = requser;
        }

        /**
         * 获取：请购人
         */
        public String getRequser() {
            return requser;
        }
            /**
         * 设置：所属部门
         */
        public void setDeptid(Long deptid) {
            this.deptid = deptid;
        }

        /**
         * 获取：所属部门
         */
        public Long getDeptid() {
            return deptid;
        }
            /**
         * 设置：请购类别
         */
        public void setReqtype(Integer reqtype) {
            this.reqtype = reqtype;
        }

        /**
         * 获取：请购类别
         */
        public Integer getReqtype() {
            return reqtype;
        }
            /**
         * 设置：预算计划
         */
        public void setBudgetmainid(Long budgetmainid) {
            this.budgetmainid = budgetmainid;
        }

        /**
         * 获取：预算计划
         */
        public Long getBudgetmainid() {
            return budgetmainid;
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
             * 设置：请购人fullname
             */
            public void setRequserfullname(String fullname) {
                this.requserfullname = fullname;
            }

            /**
             * 获取：请购人fullname
             */
            public String getRequserfullname() {
                return requserfullname;
            }
                                /**
             * 设置：所属部门name
             */
            public void setDeptidname(String name) {
                this.deptidname = name;
            }

            /**
             * 获取：所属部门name
             */
            public String getDeptidname() {
                return deptidname;
            }
                                /**
             * 设置：请购类别enumvaluename
             */
            public void setReqtypeenumvaluename(String enumvaluename) {
                this.reqtypeenumvaluename = enumvaluename;
            }

            /**
             * 获取：请购类别enumvaluename
             */
            public String getReqtypeenumvaluename() {
                return reqtypeenumvaluename;
            }
                                /**
             * 设置：预算计划billno
             */
            public void setBudgetmainidbillno(String billno) {
                this.budgetmainidbillno = billno;
            }

            /**
             * 获取：预算计划billno
             */
            public String getBudgetmainidbillno() {
                return budgetmainidbillno;
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
                        "  <div class=\"el-form-item__content\"><a class='billno' onclick=\"openfunc('requisitionmain/index','请购单')\"><span>"+getBillno()+"</span></a>\n" +
                        "  </div> </div>");
            
                                    sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">请购人</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getRequserfullname()+"</span>\n" +
                        "  </div> </div>");
            
                                    sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">所属部门</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getDeptidname()+"</span>\n" +
                        "  </div> </div>");
            
                                    sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">请购类别</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getReqtypeenumvaluename()+"</span>\n" +
                        "  </div> </div>");
            
                                    sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">预算计划</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getBudgetmainidbillno()+"</span>\n" +
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
            
                                    sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">备注</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getRemark()+"</span>\n" +
                        "  </div> </div>");
            
                    
                sb.append("</form>");
        return sb.toString();

    }
}
