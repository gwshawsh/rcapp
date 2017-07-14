package com.ruanchuangsoft.platform.entity;

import com.ruanchuangsoft.platform.entity.AbstractEntity;

import java.io.Serializable;
import java.util.Date;


import java.math.BigDecimal;



/**
 * 入职申请
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-14 13:21:19
 */
public class EntryapplicationmainEntity extends AbstractEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//申请单号
	private String billno;
	//员工姓名
	private String name;
	//申请时间
	private Date applicationday;
	//部门
	private Long deptid;
	//岗位
	private Long roleid;
	//入职时间
	private Date entryday;
	//试用/实习期间
	private Date probation;
	//自述理由
	private String reason;
	//交接内容
	private String handover;
	//单据状态
	private Integer billstatus;
	//备注
	private String remark;
	//制单人
	private Long makeuser;
	//制单日期
	private Date makedate;
	//审核人
	private String accuser;
	//审核日期
	private Date accdate;
	//更新时间
	private Date uptdate;
	//流程ID
	private String pocessinstanceid;
	//英文名
	private String englishname;
	//用户编码
	private String userid;
	//密码
	private String password;
	//邮箱
	private String email;
	//出生日期
	private Date brithday;
	//外语水平
	private String englishlevel;
	//毕业时间
	private Date graduationtime;
	//现住址
	private String residence;
	//户籍在地
	private String census;
	//教育经历
	private String educationexperience;
	//工作经历
	private String workexperience;
	//家庭状况
	private String family;
	//电话
	private String mobile;
	//参加工作时间
	private Date startedworktime;
	//性别
	private String gender;
	//民族
	private String nationality;
	//计算机水平
	private String computerlevel;
	//所学专业
	private String major;
	//其他联系方式
	private String thermobile;
	//本年假天数
	private String vacationyear;
	//上年假天数
	private String vacationlastyear;
	//身份证
	private String identification;
	//学历
	private String qulification;
	//婚姻状况
	private String marriage;
	//专业职称
	private String academictitle;
	//毕业院校
	private String school;
	//状态
	private Integer status;

					        //部门
        private String deptidname;
		        //岗位
        private String roleidrole_name;
						        //单据状态
        private String billstatusenumvaluename;
			        //制单人
        private String makeuserfullname;
			        //审核人
        private String accuserfullname;
																			        //性别
        private String genderenumvaluename;
						        //本年假天数
        private String vacationyearenumvaluename;
		        //上年假天数
        private String vacationlastyearenumvaluename;
				        //婚姻状况
        private String marriageenumvaluename;
				        //状态
        private String statusenumvaluename;
	
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
	 * 设置：申请单号
	 */
	public void setBillno(String billno) {
		this.billno = billno;
	}
	/**
	 * 获取：申请单号
	 */
	public String getBillno() {
		return billno;
	}
	/**
	 * 设置：员工姓名
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * 获取：员工姓名
	 */
	public String getName() {
		return name;
	}
	/**
	 * 设置：申请时间
	 */
	public void setApplicationday(Date applicationday) {
		this.applicationday = applicationday;
	}
	/**
	 * 获取：申请时间
	 */
	public Date getApplicationday() {
		return applicationday;
	}
	/**
	 * 设置：部门
	 */
	public void setDeptid(Long deptid) {
		this.deptid = deptid;
	}
	/**
	 * 获取：部门
	 */
	public Long getDeptid() {
		return deptid;
	}
	/**
	 * 设置：岗位
	 */
	public void setRoleid(Long roleid) {
		this.roleid = roleid;
	}
	/**
	 * 获取：岗位
	 */
	public Long getRoleid() {
		return roleid;
	}
	/**
	 * 设置：入职时间
	 */
	public void setEntryday(Date entryday) {
		this.entryday = entryday;
	}
	/**
	 * 获取：入职时间
	 */
	public Date getEntryday() {
		return entryday;
	}
	/**
	 * 设置：试用/实习期间
	 */
	public void setProbation(Date probation) {
		this.probation = probation;
	}
	/**
	 * 获取：试用/实习期间
	 */
	public Date getProbation() {
		return probation;
	}
	/**
	 * 设置：自述理由
	 */
	public void setReason(String reason) {
		this.reason = reason;
	}
	/**
	 * 获取：自述理由
	 */
	public String getReason() {
		return reason;
	}
	/**
	 * 设置：交接内容
	 */
	public void setHandover(String handover) {
		this.handover = handover;
	}
	/**
	 * 获取：交接内容
	 */
	public String getHandover() {
		return handover;
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
	public void setAccuser(String accuser) {
		this.accuser = accuser;
	}
	/**
	 * 获取：审核人
	 */
	public String getAccuser() {
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
	 * 设置：英文名
	 */
	public void setEnglishname(String englishname) {
		this.englishname = englishname;
	}
	/**
	 * 获取：英文名
	 */
	public String getEnglishname() {
		return englishname;
	}
	/**
	 * 设置：用户编码
	 */
	public void setUserid(String userid) {
		this.userid = userid;
	}
	/**
	 * 获取：用户编码
	 */
	public String getUserid() {
		return userid;
	}
	/**
	 * 设置：密码
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	/**
	 * 获取：密码
	 */
	public String getPassword() {
		return password;
	}
	/**
	 * 设置：邮箱
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * 获取：邮箱
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * 设置：出生日期
	 */
	public void setBrithday(Date brithday) {
		this.brithday = brithday;
	}
	/**
	 * 获取：出生日期
	 */
	public Date getBrithday() {
		return brithday;
	}
	/**
	 * 设置：外语水平
	 */
	public void setEnglishlevel(String englishlevel) {
		this.englishlevel = englishlevel;
	}
	/**
	 * 获取：外语水平
	 */
	public String getEnglishlevel() {
		return englishlevel;
	}
	/**
	 * 设置：毕业时间
	 */
	public void setGraduationtime(Date graduationtime) {
		this.graduationtime = graduationtime;
	}
	/**
	 * 获取：毕业时间
	 */
	public Date getGraduationtime() {
		return graduationtime;
	}
	/**
	 * 设置：现住址
	 */
	public void setResidence(String residence) {
		this.residence = residence;
	}
	/**
	 * 获取：现住址
	 */
	public String getResidence() {
		return residence;
	}
	/**
	 * 设置：户籍在地
	 */
	public void setCensus(String census) {
		this.census = census;
	}
	/**
	 * 获取：户籍在地
	 */
	public String getCensus() {
		return census;
	}
	/**
	 * 设置：教育经历
	 */
	public void setEducationexperience(String educationexperience) {
		this.educationexperience = educationexperience;
	}
	/**
	 * 获取：教育经历
	 */
	public String getEducationexperience() {
		return educationexperience;
	}
	/**
	 * 设置：工作经历
	 */
	public void setWorkexperience(String workexperience) {
		this.workexperience = workexperience;
	}
	/**
	 * 获取：工作经历
	 */
	public String getWorkexperience() {
		return workexperience;
	}
	/**
	 * 设置：家庭状况
	 */
	public void setFamily(String family) {
		this.family = family;
	}
	/**
	 * 获取：家庭状况
	 */
	public String getFamily() {
		return family;
	}
	/**
	 * 设置：电话
	 */
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	/**
	 * 获取：电话
	 */
	public String getMobile() {
		return mobile;
	}
	/**
	 * 设置：参加工作时间
	 */
	public void setStartedworktime(Date startedworktime) {
		this.startedworktime = startedworktime;
	}
	/**
	 * 获取：参加工作时间
	 */
	public Date getStartedworktime() {
		return startedworktime;
	}
	/**
	 * 设置：性别
	 */
	public void setGender(String gender) {
		this.gender = gender;
	}
	/**
	 * 获取：性别
	 */
	public String getGender() {
		return gender;
	}
	/**
	 * 设置：民族
	 */
	public void setNationality(String nationality) {
		this.nationality = nationality;
	}
	/**
	 * 获取：民族
	 */
	public String getNationality() {
		return nationality;
	}
	/**
	 * 设置：计算机水平
	 */
	public void setComputerlevel(String computerlevel) {
		this.computerlevel = computerlevel;
	}
	/**
	 * 获取：计算机水平
	 */
	public String getComputerlevel() {
		return computerlevel;
	}
	/**
	 * 设置：所学专业
	 */
	public void setMajor(String major) {
		this.major = major;
	}
	/**
	 * 获取：所学专业
	 */
	public String getMajor() {
		return major;
	}
	/**
	 * 设置：其他联系方式
	 */
	public void setThermobile(String thermobile) {
		this.thermobile = thermobile;
	}
	/**
	 * 获取：其他联系方式
	 */
	public String getThermobile() {
		return thermobile;
	}
	/**
	 * 设置：本年假天数
	 */
	public void setVacationyear(String vacationyear) {
		this.vacationyear = vacationyear;
	}
	/**
	 * 获取：本年假天数
	 */
	public String getVacationyear() {
		return vacationyear;
	}
	/**
	 * 设置：上年假天数
	 */
	public void setVacationlastyear(String vacationlastyear) {
		this.vacationlastyear = vacationlastyear;
	}
	/**
	 * 获取：上年假天数
	 */
	public String getVacationlastyear() {
		return vacationlastyear;
	}
	/**
	 * 设置：身份证
	 */
	public void setIdentification(String identification) {
		this.identification = identification;
	}
	/**
	 * 获取：身份证
	 */
	public String getIdentification() {
		return identification;
	}
	/**
	 * 设置：学历
	 */
	public void setQulification(String qulification) {
		this.qulification = qulification;
	}
	/**
	 * 获取：学历
	 */
	public String getQulification() {
		return qulification;
	}
	/**
	 * 设置：婚姻状况
	 */
	public void setMarriage(String marriage) {
		this.marriage = marriage;
	}
	/**
	 * 获取：婚姻状况
	 */
	public String getMarriage() {
		return marriage;
	}
	/**
	 * 设置：专业职称
	 */
	public void setAcademictitle(String academictitle) {
		this.academictitle = academictitle;
	}
	/**
	 * 获取：专业职称
	 */
	public String getAcademictitle() {
		return academictitle;
	}
	/**
	 * 设置：毕业院校
	 */
	public void setSchool(String school) {
		this.school = school;
	}
	/**
	 * 获取：毕业院校
	 */
	public String getSchool() {
		return school;
	}
	/**
	 * 设置：状态
	 */
	public void setStatus(Integer status) {
		this.status = status;
	}
	/**
	 * 获取：状态
	 */
	public Integer getStatus() {
		return status;
	}


															        /**
         * 设置：部门name
         */
        public void setDeptidname(String name) {
            this.deptidname = name;
        }
        /**
         * 获取：部门name
         */
        public String getDeptidname() {
            return deptidname;
        }
        			        /**
         * 设置：岗位role_name
         */
        public void setRoleidrole_name(String role_name) {
            this.roleidrole_name = role_name;
        }
        /**
         * 获取：岗位role_name
         */
        public String getRoleidrole_name() {
            return roleidrole_name;
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
         * 设置：性别enumvaluename
         */
        public void setGenderenumvaluename(String enumvaluename) {
            this.genderenumvaluename = enumvaluename;
        }
        /**
         * 获取：性别enumvaluename
         */
        public String getGenderenumvaluename() {
            return genderenumvaluename;
        }
        															        /**
         * 设置：本年假天数enumvaluename
         */
        public void setVacationyearenumvaluename(String enumvaluename) {
            this.vacationyearenumvaluename = enumvaluename;
        }
        /**
         * 获取：本年假天数enumvaluename
         */
        public String getVacationyearenumvaluename() {
            return vacationyearenumvaluename;
        }
        			        /**
         * 设置：上年假天数enumvaluename
         */
        public void setVacationlastyearenumvaluename(String enumvaluename) {
            this.vacationlastyearenumvaluename = enumvaluename;
        }
        /**
         * 获取：上年假天数enumvaluename
         */
        public String getVacationlastyearenumvaluename() {
            return vacationlastyearenumvaluename;
        }
        									        /**
         * 设置：婚姻状况enumvaluename
         */
        public void setMarriageenumvaluename(String enumvaluename) {
            this.marriageenumvaluename = enumvaluename;
        }
        /**
         * 获取：婚姻状况enumvaluename
         */
        public String getMarriageenumvaluename() {
            return marriageenumvaluename;
        }
        									        /**
         * 设置：状态enumvaluename
         */
        public void setStatusenumvaluename(String enumvaluename) {
            this.statusenumvaluename = enumvaluename;
        }
        /**
         * 获取：状态enumvaluename
         */
        public String getStatusenumvaluename() {
            return statusenumvaluename;
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
                        "  <label class=\"el-form-item__label\">申请单号</label>"+
                        "  <div class=\"el-form-item__content\"><a class='billno' onclick=\"openfunc('entryapplicationmain/index','入职申请')\"><span>"+getBillno()+"</span></a>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">员工姓名</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getName()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">申请时间</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getApplicationday()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">部门</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getDeptidname()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">岗位</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getRoleidrole_name()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">入职时间</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getEntryday()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">试用/实习期间</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getProbation()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">自述理由</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getReason()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">交接内容</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getHandover()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">单据状态</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getBillstatusenumvaluename()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">备注</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getRemark()+"</span>\n" +
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
                        "  <label class=\"el-form-item__label\">英文名</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getEnglishname()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">用户编码</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getUserid()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">密码</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getPassword()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">邮箱</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getEmail()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">出生日期</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getBrithday()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">外语水平</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getEnglishlevel()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">毕业时间</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getGraduationtime()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">现住址</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getResidence()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">户籍在地</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getCensus()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">教育经历</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getEducationexperience()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">工作经历</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getWorkexperience()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">家庭状况</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getFamily()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">电话</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getMobile()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">参加工作时间</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getStartedworktime()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">性别</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getGenderenumvaluename()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">民族</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getNationality()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">计算机水平</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getComputerlevel()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">所学专业</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getMajor()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">其他联系方式</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getThermobile()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">本年假天数</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getVacationyearenumvaluename()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">上年假天数</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getVacationlastyearenumvaluename()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">身份证</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getIdentification()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">学历</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getQulification()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">婚姻状况</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getMarriageenumvaluename()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">专业职称</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getAcademictitle()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">毕业院校</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getSchool()+"</span>\n" +
                        "  </div> </div>");
			
					                sb.append(" <div class=\"el-form-item\">\n" +
                        "  <label class=\"el-form-item__label\">状态</label>"+
                        "  <div class=\"el-form-item__content\"><span>"+getStatusenumvaluename()+"</span>\n" +
                        "  </div> </div>");
			
		        sb.append("</form>");
        return sb.toString();

    }
}
