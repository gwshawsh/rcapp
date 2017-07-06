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
                                                                            billno:"",                                                                 name:"",                                                                 applicationday:"",                                                                 deptid:"",                                                                 roleid:"",                                                                 depatureday:"",                                                                 successer:"",                                                                 reason:"",                                                                 billstatus:"",                                                                 remark:"",                                                                 makeuser:"",                                                                 makedate:"",                                                                 accuser:"",                                                                 accdate:"",                                                                 uptdate:"",                                                                 pocessinstanceid:""                            
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

                								                					ref_sys_user:[],

                								                                    ref_enum1003:[],
                					
        //创建实体类
        depatureapplicationmain: {
                                                deptidname:"",
                                                                roleidrole_name:"",
                                                                successerfullname:"",
                                                                billstatusenumvaluename:"",
                                                                                                        billno:"",                                                                 name:"",                                                                 applicationday:"",                                                                 deptid:"",                                                                 roleid:"",                                                                 depatureday:"",                                                                 successer:"",                                                                 reason:"",                                                                 billstatus:"",                                                                 remark:"",                                                                 makeuser:"",                                                                 makedate:"",                                                                 accuser:"",                                                                 accdate:"",                                                                 uptdate:"",                                                                 pocessinstanceid:""                            
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
			vm.title = "新增";
			vm.depatureapplicationmain = {
                //参照的虚拟字段也必须先声明好,不然饿了么ui组件不能双向绑定
                                                            deptidname:"",
                                                                                roleidrole_name:"",
                                                                                successerfullname:"",
                                                                                billstatusenumvaluename:"",
                                                                                                                                                                billno:"*",                                                                                                                                     name:"",                                                                                                                                     applicationday:"",                                                                                                                                     deptid:"",                                                                                                                                     roleid:"",                                                                                                                                     depatureday:"",                                                                                                                                     successer:"",                                                                                                                                     reason:"",                                                                                                                                     billstatus:"",                                                                                                                                     remark:"",                                                                                                                                     makeuser:gUserId,                                                                                                                                     makedate:mktime,                                                                                                                                     accuser:"",                                                                                                                                     accdate:"",                                                                                                                                     uptdate:"",                                                                                                                                     pocessinstanceid:""                                                            
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
			var url = vm.depatureapplicationmain.id == null ? "../depatureapplicationmain/save" : "../depatureapplicationmain/update";
			$.ajax({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.depatureapplicationmain),
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
				    url: "../depatureapplicationmain/delete",
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

            					                getRefsys_user: function () {
                    $.get("../sys_user/list?page=1&limit=1000", function (r) {
                        vm.ref_sys_user = r.page.list;
                    });
                },

            					                getRef1003: function () {
                    $.get("../enumtable/listone?enumid=1003&page=1&limit=1000", function (r) {
                        vm.ref_enum1003 = r.page.list;
                    });
                },
            		
        //生成弹出树形空间参照

        getRefTreesys_deptdeptid: function(menuId){
            //加载菜单树
            $.get("../sys_dept/select", function(r){
                ztreedeptid = $.fn.zTree.init($("#refTreesys_dept"), setting, r.treeList);
                var node = ztreedeptid.getNodeByParam("id", vm.depatureapplicationmain.deptid);
                ztreedeptid.selectNode(node);
                vm.depatureapplicationmain.deptidname = node.name;

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
                    vm.depatureapplicationmain.deptid = node[0].id;
                    vm.depatureapplicationmain.deptidname = node[0].name;

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
                        url: "../depatureapplicationmain/submitworkflow",
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

                $.get("../depatureapplicationmain/info/" + id, function (r) {
                    vm.depatureapplicationmain = r.depatureapplicationmain;
                    vm.depatureapplicationmain.id=null;
                    vm.depatureapplicationmain.billno="*";
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
                        url: "../depatureapplicationmain/cancel",
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
                    url: "../depatureapplicationmain/claim",
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
            $.get("../depatureapplicationmain/info/"+id, function(r){
                vm.depatureapplicationmain = r.depatureapplicationmain;
                showrefgrid_billcomments(function (data) {
                    if(!vm.depatureapplicationmain.billcommentsEntity){
                        vm.depatureapplicationmain.billcommentsEntity={};
                    }
                    vm.depatureapplicationmain.billcommentsEntity.billno=vm.depatureapplicationmain.billno;
                    vm.depatureapplicationmain.billcommentsEntity.refbilltype=0;
                    vm.depatureapplicationmain.billcommentsEntity.remark=data.remark;
                    vm.depatureapplicationmain.billcommentsEntity.auditstatus=data.auditstatus;
                    $.ajax({
                        type: "POST",
                        url: "../depatureapplicationmain/audit",
                        data: JSON.stringify(vm.depatureapplicationmain),
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
                    url: "../depatureapplicationmain/unaudit",
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
            $.get("../depatureapplicationmain/info/"+id, function(r){
                vm.depatureapplicationmain = r.depatureapplicationmain;
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

            if(!vm.depatureapplicationmain.files){
                vm.depatureapplicationmain.files=[];
            }
            if(response.page.list&&response.page.list.length>0){
                vm.depatureapplicationmain.files.push(response.page.list[0]);
            }


        },

        upload_on_change: function (file, fileList) {
            this.fileslist = fileList;
        }
	}
});

$(function () {
    $("#jqGrid").jqGrid({
        url: '../depatureapplicationmain/list',
        datatype: "json",
        colModel: [
			                                                            { label: 'id', name: 'id', width: 50, key: true,hidden:true },
                                    			                                                            { label: '申请单号', name: 'billno', width: 80 }, 
                                    			                                                            { label: '员工姓名', name: 'name', width: 80 }, 
                                    			                                                            { label: '申请时间', name: 'applicationday', width: 80 }, 
                                    			                                                            { label: '部门', name: 'deptidname', width: 80 },                                     			                                                            { label: '岗位', name: 'roleidrole_name', width: 80 },                                     			                                                            { label: '离职时间', name: 'depatureday', width: 80 }, 
                                    			                                                            { label: '交接人', name: 'successerfullname', width: 80 },                                     			                                                            { label: '自述理由', name: 'reason', width: 80 }, 
                                    			                                                            { label: '单据状态', name: 'billstatus', width: 80 ,formatter:formater_billstatus}, 
                                    			                                                            { label: '备注', name: 'remark', width: 80 }, 
                                    			                                                            { label: '制单人', name: 'makeuserfullname', width: 80 },                                     			                                                            { label: '制单日期', name: 'makedate', width: 80 }, 
                                    			                                                            { label: '审核人', name: 'accuserfullname', width: 80 },                                     			                                                            { label: '审核日期', name: 'accdate', width: 80 }, 
                                    			                                                            { label: '更新时间', name: 'uptdate', width: 80 }, 
                                    			                			        ],
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
        			            vm.getRefsys_user();
        			            vm.getRef1003();
        	
        createBillAttachmentsGrid();
    createBillCommentsGrid();
    
    initGridHeight();
});