//生成弹出树形空间参照
                           var ztreedeptid;
                                                                                                                                                                    
var setting = {
    data: {
        simpleData: {
            enable: true,
            idKey: "id",
            pIdKey: "parentId",
            rootPId: -1
        },
        key: {
            url:"nourl"
        }
    }
};

var vm = new Vue({
	el:'#rrapp',
	data:{
	    q:{
                                                                            billno:"",                                                                 name:"",                                                                 applicationday:"",                                                                 deptid:"",                                                                 roleid:"",                                                                 entryday:"",                                                                 probation:"",                                                                 reason:"",                                                                 handover:"",                                                                 billstatus:"",                                                                 remark:"",                                                                 makeuser:"",                                                                 makedate:"",                                                                 accuser:"",                                                                 accdate:"",                                                                 uptdate:"",                                                                 pocessinstanceid:"",                                                                 englishname:"",                                                                 userid:"",                                                                 password:"",                                                                 email:"",                                                                 brithday:"",                                                                 englishlevel:"",                                                                 graduationtime:"",                                                                 residence:"",                                                                 census:"",                                                                 educationexperience:"",                                                                 workexperience:"",                                                                 family:"",                                                                 mobile:"",                                                                 startedworktime:"",                                                                 gender:"",                                                                 nationality:"",                                                                 computerlevel:"",                                                                 major:"",                                                                 thermobile:"",                                                                 vacationyear:"",                                                                 vacationlastyear:"",                                                                 identification:"",                                                                 qulification:"",                                                                 marriage:"",                                                                 academictitle:"",                                                                 school:"",                                                                 status:""                            
        },
		showList: true,
        showQuery:false,
        showDetailList:true,
		title: null,
        fileslist:[],
    //用于日期快捷控件
    pickerOptions1: {
        shortcuts: [{
            text: '今天',
            onClick(picker) {
                picker.$emit('pick', new Date());
            }
        }, {
            text: '昨天',
            onClick(picker) {
                const date = new Date();
                date.setTime(date.getTime() - 3600 * 1000 * 24);
                picker.$emit('pick', date);
            }
        }, {
            text: '一周前',
            onClick(picker) {
                const date = new Date();
                date.setTime(date.getTime() - 3600 * 1000 * 24 * 7);
                picker.$emit('pick', date);
            }
        }]
    },
        //创建参照
					                								                					ref_sys_role:[],

                								                                    ref_enum1003:[],
                								                					ref_sys_user:[],

                								                                    ref_enum1015:[],
                								                                    ref_enum1016:[],
                								                                    ref_enum1017:[],
                								                                    ref_enum1018:[],
                								                                    ref_enum1020:[],
                					
        //创建实体类
        formalapplicationmain: {
                                                deptidname:"",
                                                                roleidrole_name:"",
                                                                billstatusenumvaluename:"",
                                                                makeuserfullname:"",
                                                                genderenumvaluename:"",
                                                                vacationyearenumvaluename:"",
                                                                vacationlastyearenumvaluename:"",
                                                                marriageenumvaluename:"",
                                                                statusenumvaluename:"",
                                                                                                        billno:"",                                                                 name:"",                                                                 applicationday:"",                                                                 deptid:"",                                                                 roleid:"",                                                                 entryday:"",                                                                 probation:"",                                                                 reason:"",                                                                 handover:"",                                                                 billstatus:"",                                                                 remark:"",                                                                 makeuser:"",                                                                 makedate:"",                                                                 accuser:"",                                                                 accdate:"",                                                                 uptdate:"",                                                                 pocessinstanceid:"",                                                                 englishname:"",                                                                 userid:"",                                                                 password:"",                                                                 email:"",                                                                 brithday:"",                                                                 englishlevel:"",                                                                 graduationtime:"",                                                                 residence:"",                                                                 census:"",                                                                 educationexperience:"",                                                                 workexperience:"",                                                                 family:"",                                                                 mobile:"",                                                                 startedworktime:"",                                                                 gender:"",                                                                 nationality:"",                                                                 computerlevel:"",                                                                 major:"",                                                                 thermobile:"",                                                                 vacationyear:"",                                                                 vacationlastyear:"",                                                                 identification:"",                                                                 qulification:"",                                                                 marriage:"",                                                                 academictitle:"",                                                                 school:"",                                                                 status:""                            
        }
	},
	methods: {
	    showQueryPanel:function(){
	        vm.showQuery=!vm.showQuery;
        },
		query: function () {
			vm.reload();
		},
		add: function(){
            var mktime = moment().format("YYYY-MM-DD");
			vm.showList = false;
			vm.showDetailList=false;
			vm.title = "新增";
			vm.formalapplicationmain = {
                //参照的虚拟字段也必须先声明好,不然饿了么ui组件不能双向绑定
                                                            deptidname:"",
                                                                                roleidrole_name:"",
                                                                                billstatusenumvaluename:"",
                                                                                makeuserfullname:"",
                                                                                genderenumvaluename:"",
                                                                                vacationyearenumvaluename:"",
                                                                                vacationlastyearenumvaluename:"",
                                                                                marriageenumvaluename:"",
                                                                                statusenumvaluename:"",
                                                                                                                                                                billno:"*",                                                                                                                                     name:"",                                                                                                                                     applicationday:"",                                                                                                                                     deptid:"",                                                                                                                                     roleid:"",                                                                                                                                     entryday:"",                                                                                                                                     probation:"",                                                                                                                                     reason:"",                                                                                                                                     handover:"",                                                                                                                                     billstatus:"",                                                                                                                                     remark:"",                                                                                                                                     makeuser:gUserId,                                                                                                                                     makedate:mktime,                                                                                                                                     accuser:"",                                                                                                                                     accdate:"",                                                                                                                                     uptdate:"",                                                                                                                                     pocessinstanceid:"",                                                                                                                                     englishname:"",                                                                                                                                     userid:"",                                                                                                                                     password:"",                                                                                                                                     email:"",                                                                                                                                     brithday:"",                                                                                                                                     englishlevel:"",                                                                                                                                     graduationtime:"",                                                                                                                                     residence:"",                                                                                                                                     census:"",                                                                                                                                     educationexperience:"",                                                                                                                                     workexperience:"",                                                                                                                                     family:"",                                                                                                                                     mobile:"",                                                                                                                                     startedworktime:"",                                                                                                                                     gender:"",                                                                                                                                     nationality:"",                                                                                                                                     computerlevel:"",                                                                                                                                     major:"",                                                                                                                                     thermobile:"",                                                                                                                                     vacationyear:"",                                                                                                                                     vacationlastyear:"",                                                                                                                                     identification:"",                                                                                                                                     qulification:"",                                                                                                                                     marriage:"",                                                                                                                                     academictitle:"",                                                                                                                                     school:"",                                                                                                                                     status:""                                                            
            };
		},
		update: function (event) {
			var id = getSelectedRow();
			if(id == null){
				return ;
			}
			vm.showList = false;
            vm.title = "修改";

            vm.getInfo(id)
		},
		saveOrUpdate: function (event) {
			var url = vm.formalapplicationmain.id == null ? "../formalapplicationmain/save" : "../formalapplicationmain/update";
			$.ajax({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.formalapplicationmain),
			    success: function(r){
			    	if(r.code === 0){
						alert('操作成功', function(index){
							vm.reload();
						});
					}else{
						alert(r.msg);
					}
				}
			});
		},
		del: function (event) {
			var ids = getSelectedRows();
			if(ids == null){
				return ;
			}

			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: "../formalapplicationmain/delete",
				    data: JSON.stringify(ids),
				    success: function(r){
						if(r.code == 0){
							alert('操作成功', function(index){
								$("#jqGrid").trigger("reloadGrid");
							});
						}else{
							alert(r.msg);
						}
					}
				});
			});
		},

        //生成参照调用弹出框函数
																																																																																																																																																																																																																																			
        //生成参照调用下拉框函数,用来初始化远程数据
										                getRefsys_role: function () {
                    $.get("../sys_role/list?page=1&limit=1000", function (r) {
                        vm.ref_sys_role = r.page.list;
                    });
                },

            					                getRef1003: function () {
                    $.get("../enumtable/listone?enumid=1003&page=1&limit=1000", function (r) {
                        vm.ref_enum1003 = r.page.list;
                    });
                },
            					                getRefsys_user: function () {
                    $.get("../sys_user/list?page=1&limit=1000", function (r) {
                        vm.ref_sys_user = r.page.list;
                    });
                },

            					                getRef1015: function () {
                    $.get("../enumtable/listone?enumid=1015&page=1&limit=1000", function (r) {
                        vm.ref_enum1015 = r.page.list;
                    });
                },
            					                getRef1016: function () {
                    $.get("../enumtable/listone?enumid=1016&page=1&limit=1000", function (r) {
                        vm.ref_enum1016 = r.page.list;
                    });
                },
            					                getRef1017: function () {
                    $.get("../enumtable/listone?enumid=1017&page=1&limit=1000", function (r) {
                        vm.ref_enum1017 = r.page.list;
                    });
                },
            					                getRef1018: function () {
                    $.get("../enumtable/listone?enumid=1018&page=1&limit=1000", function (r) {
                        vm.ref_enum1018 = r.page.list;
                    });
                },
            					                getRef1020: function () {
                    $.get("../enumtable/listone?enumid=1020&page=1&limit=1000", function (r) {
                        vm.ref_enum1020 = r.page.list;
                    });
                },
            		
        //生成弹出树形空间参照

        getRefTreesys_deptdeptid: function(menuId){
            //加载菜单树
            $.get("../sys_dept/select", function(r){
                ztreedeptid = $.fn.zTree.init($("#refTreesys_dept"), setting, r.treeList);
                var node = ztreedeptid.getNodeByParam("id", vm.formalapplicationmain.deptid);
                ztreedeptid.selectNode(node);
                vm.formalapplicationmain.deptidname = node.name;

            })
        },

        openRefTreesys_deptdeptid: function(){
            layer.open({
                type: 1,
                offset: '50px',
                skin: 'layui-layer-molv',
                title: "选择",
                area: ['300px', '450px'],
                shade: 0,
                shadeClose: false,
                content: jQuery("#treelayersys_dept"),
                btn: ['确定', '取消'],
                btn1: function (index) {
                    var node = ztreedeptid.getSelectedNodes();
                    //选择上级菜单
                    vm.formalapplicationmain.deptid = node[0].id;
                    vm.formalapplicationmain.deptidname = node[0].name;

                    layer.close(index);
                }
            });
        },
                    //提交到工作流
            submitworkflow:function () {
                var row=getSelectedRow();
                if (row == null) {
                    return;
                }
                confirm('确定要提交选中的任务？', function () {
                    $.ajax({
                        type: "POST",
                        url: "../formalapplicationmain/submitworkflow",
                        data: JSON.stringify(row),
                        success: function (r) {
                            if (r.code == 0) {
                                alert('操作成功', function (index) {
                                    $("#jqGrid").trigger("reloadGrid");
                                });
                            } else {
                                alert(r.msg);
                            }
                        }
                    });
                });
            },
            //复制单据
            copybill: function (event) {
                var id = getSelectedRow();
                if(id == null){
                    return ;
                }
                vm.showList = false;
                vm.showDetailList=false;
                vm.title = "新增";
                vm.getInfo(id);

                $.get("../formalapplicationmain/info/" + id, function (r) {
                    vm.formalapplicationmain = r.formalapplicationmain;
                    vm.formalapplicationmain.id=null;
                    vm.formalapplicationmain.billno="*";
                });


            },
            //作废单据
            cancel: function (event) {
                var ids = getSelectedRows();
                if(ids == null){
                    return ;
                }
                confirm('确定要作废选中的单据？', function(){
                    $.ajax({
                        type: "POST",
                        url: "../formalapplicationmain/cancel",
                        data: JSON.stringify(ids),
                        success: function(r){
                            if(r.code == 0){
                                alert('操作成功', function(index){
                                    $("#jqGrid").trigger("reloadGrid");
                                });
                            }else{
                                alert(r.msg);
                            }
                        }
                    });
                });

            },
        //签收任务
        claim:function(event){
            var ids = getSelectedRows();
            if(ids == null){
                return ;
            }

            confirm('确定要签收选中的任务？', function(){
                $.ajax({
                    type: "POST",
                    url: "../formalapplicationmain/claim",
                    data: JSON.stringify(ids),
                    success: function(r){
                        if(r.code == 0){
                            alert('操作成功', function(index){
                                $("#jqGrid").trigger("reloadGrid");
                            });
                        }else{
                            alert(r.msg);
                        }
                    }
                });
            });
        },

        audit:function(event){
            var id = getSelectedRow();
            if(id == null){
                return ;
            }
            $.get("../formalapplicationmain/info/"+id, function(r){
                vm.formalapplicationmain = r.formalapplicationmain;
                showrefgrid_billcomments(function (data) {
                    if(!vm.formalapplicationmain.billcommentsEntity){
                        vm.formalapplicationmain.billcommentsEntity={};
                    }
                    vm.formalapplicationmain.billcommentsEntity.billno=vm.formalapplicationmain.billno;
                    vm.formalapplicationmain.billcommentsEntity.refbilltype=0;
                    vm.formalapplicationmain.billcommentsEntity.remark=data.remark;
                    vm.formalapplicationmain.billcommentsEntity.auditstatus=data.auditstatus;
                    $.ajax({
                        type: "POST",
                        url: "../formalapplicationmain/audit",
                        data: JSON.stringify(vm.formalapplicationmain),
                        success: function(r){
                            if(r.code == 0){
                                alert('操作成功', function(index){
                                    $("#jqGrid").trigger("reloadGrid");
                                });
                            }else{
                                alert(r.msg);
                            }
                        }
                    });
                });
            });
        },

        unaudit:function(){
            var ids = getSelectedRows();
            if(ids == null){
                return ;
            }

            confirm('确定要反审核选中的记录？', function(){
                $.ajax({
                    type: "POST",
                    url: "../formalapplicationmain/unaudit",
                    data: JSON.stringify(ids),
                    success: function(r){
                        if(r.code == 0){
                            alert('操作成功', function(index){
                                $("#jqGrid").trigger("reloadGrid");
                            });
                        }else{
                            alert(r.msg);
                        }
                    }
                });
            });
        },
        
        //查询单据明细
        queryDetail:function(){
                            var row=getSelectedRowData();

                var id = row.billno;
                if (id == null) {
                    return;
                }
                vm.showDetailList = true;


                //查询单据审批明细
                $("#jqGridComments").jqGrid('setGridParam', {
                    page: 1,
                    postData: {'billno': id},
                    datatype: "json"
                }).trigger("reloadGrid");

                //查询单据审批明细
                $("#jqGridFiles").jqGrid('setGridParam', {
                    page: 1,
                    postData: {'billno': id},
                    datatype: "json"
                }).trigger("reloadGrid");
                    },

        getInfo: function(id){
            $.get("../formalapplicationmain/info/"+id, function(r){
                vm.formalapplicationmain = r.formalapplicationmain;
            });
        },
        reload: function (event) {
            vm.showList = true;
            var page = $("#jqGrid").jqGrid('getGridParam','page');
            $("#jqGrid").jqGrid('setGridParam',{
                postData: {'query': JSON.stringify(vm.q)},
                page:page
            }).trigger("reloadGrid");
        },
        upload_on_success:function (response,file,fileList) {

            if(!vm.formalapplicationmain.files){
                vm.formalapplicationmain.files=[];
            }
            if(response.page.list&&response.page.list.length>0){
                vm.formalapplicationmain.files.push(response.page.list[0]);
            }


        },

        upload_on_change: function (file, fileList) {
            this.fileslist = fileList;
        }
	}
});

$(function () {
    $("#jqGrid").jqGrid({
        url: '../formalapplicationmain/list',
        datatype: "json",
        colModel: [
			                                                            { label: 'id', name: 'id', width: 50, key: true,hidden:true },
                                    			                                                            { label: '申请单号', name: 'billno', width: 80 }, 
                                    			                                                            { label: '员工姓名', name: 'name', width: 80 }, 
                                    			                                                            { label: '申请时间', name: 'applicationday', width: 80 }, 
                                    			                                                            { label: '部门', name: 'deptidname', width: 80 },                                     			                                                            { label: '岗位', name: 'roleidrole_name', width: 80 },                                     			                                                            { label: '入职时间', name: 'entryday', width: 80 }, 
                                    			                                                            { label: '试用/实习期间', name: 'probation', width: 80 }, 
                                    			                                                            { label: '自述理由', name: 'reason', width: 80 }, 
                                    			                                                            { label: '交接内容', name: 'handover', width: 80 }, 
                                    			                                                            { label: '单据状态', name: 'billstatus', width: 80 ,formatter:formater_billstatus}, 
                                    			                                                            { label: '备注', name: 'remark', width: 80 }, 
                                    			                                                            { label: '制单人', name: 'makeuserfullname', width: 80 },                                     			                                                            { label: '制单日期', name: 'makedate', width: 80 }, 
                                    			                                                            { label: '审核人', name: 'accuserfullname', width: 80 },                                     			                                                            { label: '审核日期', name: 'accdate', width: 80 }, 
                                    			                                                            { label: '更新时间', name: 'uptdate', width: 80 }, 
                                    			                			                                                            { label: '英文名', name: 'englishname', width: 80 }, 
                                    			                                                            { label: '用户编码', name: 'userid', width: 80 }, 
                                    			                                                            { label: '密码', name: 'password', width: 80 }, 
                                    			                                                            { label: '邮箱', name: 'email', width: 80 }, 
                                    			                                                            { label: '出生日期', name: 'brithday', width: 80 }, 
                                    			                                                            { label: '外语水平', name: 'englishlevel', width: 80 }, 
                                    			                                                            { label: '毕业时间', name: 'graduationtime', width: 80 }, 
                                    			                                                            { label: '现住址', name: 'residence', width: 80 }, 
                                    			                                                            { label: '户籍在地', name: 'census', width: 80 }, 
                                    			                                                            { label: '教育经历', name: 'educationexperience', width: 80 }, 
                                    			                                                            { label: '工作经历', name: 'workexperience', width: 80 }, 
                                    			                                                            { label: '家庭状况', name: 'family', width: 80 }, 
                                    			                                                            { label: '电话', name: 'mobile', width: 80 }, 
                                    			                                                            { label: '参加工作时间', name: 'startedworktime', width: 80 }, 
                                    			                                                            { label: '性别', name: 'genderenumvaluename', width: 80 },                                     			                                                            { label: '民族', name: 'nationality', width: 80 }, 
                                    			                                                            { label: '计算机水平', name: 'computerlevel', width: 80 }, 
                                    			                                                            { label: '所学专业', name: 'major', width: 80 }, 
                                    			                                                            { label: '其他联系方式', name: 'thermobile', width: 80 }, 
                                    			                                                            { label: '本年假天数', name: 'vacationyearenumvaluename', width: 80 },                                     			                                                            { label: '上年假天数', name: 'vacationlastyearenumvaluename', width: 80 },                                     			                                                            { label: '身份证', name: 'identification', width: 80 }, 
                                    			                                                            { label: '学历', name: 'qulification', width: 80 }, 
                                    			                                                            { label: '婚姻状况', name: 'marriageenumvaluename', width: 80 },                                     			                                                            { label: '专业职称', name: 'academictitle', width: 80 }, 
                                    			                                                            { label: '毕业院校', name: 'school', width: 80 }, 
                                    			                                                            { label: '状态', name: 'statusenumvaluename', width: 80 }                                    			        ],
        viewrecords: true,
        height: 385,
        rowNum: 10,
        rowList : [10,30,50],
        rownumbers: true,
        rownumWidth: 25,
        autowidth: true,
        autoScroll: true,
        multiselect: true,
        pager: "#jqGridPager",
        jsonReader : {
            root: "page.list",
            page: "page.currPage",
            total: "page.totalPage",
            records: "page.totalCount"
        },
        prmNames : {
            page:"page",
            rows:"limit",
            order: "order"
        },
        shrinkToFit:false,
        onSelectRow:function(){
            vm.queryDetail();
        },
        gridComplete:function(){
            //隐藏grid底部滚动条
            //$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });
        }
    });

    //执行调用参照调用下拉框函数,初始化下拉数据
			            vm.getRefTreesys_deptdeptid();
					            vm.getRefsys_role();
        			            vm.getRef1003();
        			            vm.getRefsys_user();
        			            vm.getRef1015();
        			            vm.getRef1016();
        			            vm.getRef1017();
        			            vm.getRef1018();
        			            vm.getRef1020();
        	
        createBillAttachmentsGrid();
    createBillCommentsGrid();
    
    initGridHeight();
});