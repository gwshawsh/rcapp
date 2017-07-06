//生成弹出树形空间参照
                           var ztreedeptid;
                   var ztreeoutdeptid;
                   var ztreeindeptid;
                                            
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
                                                                            billno:"",                                                                 name:"",                                                                 applicationday:"",                                                                 deptid:"",                                                                 roleid:"",                                                                 outdeptid:"",                                                                 outroleid:"",                                                                 indeptid:"",                                                                 inroleid:"",                                                                 reason:"",                                                                 billstatus:"",                                                                 remark:"",                                                                 makeuser:"",                                                                 makedate:"",                                                                 accuser:"",                                                                 accdate:"",                                                                 uptdate:"",                                                                 pocessinstanceid:""                            
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

                					
        //创建实体类
        transferapplicationmain: {
                                                deptidname:"",
                                                                roleidrole_name:"",
                                                                billstatusenumvaluename:"",
                                                                makeuserfullname:"",
                                                                                                        billno:"",                                                                 name:"",                                                                 applicationday:"",                                                                 deptid:"",                                                                 roleid:"",                                                                 outdeptid:"",                                                                 outroleid:"",                                                                 indeptid:"",                                                                 inroleid:"",                                                                 reason:"",                                                                 billstatus:"",                                                                 remark:"",                                                                 makeuser:"",                                                                 makedate:"",                                                                 accuser:"",                                                                 accdate:"",                                                                 uptdate:"",                                                                 pocessinstanceid:""                            
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
			vm.transferapplicationmain = {
                //参照的虚拟字段也必须先声明好,不然饿了么ui组件不能双向绑定
                                                            deptidname:"",
                                                                                roleidrole_name:"",
                                                                                billstatusenumvaluename:"",
                                                                                makeuserfullname:"",
                                                                                                                                                                billno:"*",                                                                                                                                     name:"",                                                                                                                                     applicationday:"",                                                                                                                                     deptid:"",                                                                                                                                     roleid:"",                                                                                                                                     outdeptid:"",                                                                                                                                     outroleid:"",                                                                                                                                     indeptid:"",                                                                                                                                     inroleid:"",                                                                                                                                     reason:"",                                                                                                                                     billstatus:"",                                                                                                                                     remark:"",                                                                                                                                     makeuser:gUserId,                                                                                                                                     makedate:mktime,                                                                                                                                     accuser:"",                                                                                                                                     accdate:"",                                                                                                                                     uptdate:"",                                                                                                                                     pocessinstanceid:""                                                            
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
			var url = vm.transferapplicationmain.id == null ? "../transferapplicationmain/save" : "../transferapplicationmain/update";
			$.ajax({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.transferapplicationmain),
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
				    url: "../transferapplicationmain/delete",
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

            		
        //生成弹出树形空间参照

        getRefTreesys_deptdeptid: function(menuId){
            //加载菜单树
            $.get("../sys_dept/select", function(r){
                ztreedeptid = $.fn.zTree.init($("#refTreesys_dept"), setting, r.treeList);
                var node = ztreedeptid.getNodeByParam("id", vm.transferapplicationmain.deptid);
                ztreedeptid.selectNode(node);
                vm.transferapplicationmain.deptidname = node.name;

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
                    vm.transferapplicationmain.deptid = node[0].id;
                    vm.transferapplicationmain.deptidname = node[0].name;

                    layer.close(index);
                }
            });
        },

        getRefTreesys_deptoutdeptid: function(menuId){
            //加载菜单树
            $.get("../sys_dept/select", function(r){
                ztreeoutdeptid = $.fn.zTree.init($("#refTreesys_dept"), setting, r.treeList);
                var node = ztreeoutdeptid.getNodeByParam("id", vm.transferapplicationmain.outdeptid);
                ztreeoutdeptid.selectNode(node);
                vm.transferapplicationmain.outdeptidname = node.name;

            })
        },

        openRefTreesys_deptoutdeptid: function(){
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
                    var node = ztreeoutdeptid.getSelectedNodes();
                    //选择上级菜单
                    vm.transferapplicationmain.outdeptid = node[0].id;
                    vm.transferapplicationmain.outdeptidname = node[0].name;

                    layer.close(index);
                }
            });
        },

        getRefTreesys_deptindeptid: function(menuId){
            //加载菜单树
            $.get("../sys_dept/select", function(r){
                ztreeindeptid = $.fn.zTree.init($("#refTreesys_dept"), setting, r.treeList);
                var node = ztreeindeptid.getNodeByParam("id", vm.transferapplicationmain.indeptid);
                ztreeindeptid.selectNode(node);
                vm.transferapplicationmain.indeptidname = node.name;

            })
        },

        openRefTreesys_deptindeptid: function(){
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
                    var node = ztreeindeptid.getSelectedNodes();
                    //选择上级菜单
                    vm.transferapplicationmain.indeptid = node[0].id;
                    vm.transferapplicationmain.indeptidname = node[0].name;

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
                        url: "../transferapplicationmain/submitworkflow",
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

                $.get("../transferapplicationmain/info/" + id, function (r) {
                    vm.transferapplicationmain = r.transferapplicationmain;
                    vm.transferapplicationmain.id=null;
                    vm.transferapplicationmain.billno="*";
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
                        url: "../transferapplicationmain/cancel",
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
                    url: "../transferapplicationmain/claim",
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
            $.get("../transferapplicationmain/info/"+id, function(r){
                vm.transferapplicationmain = r.transferapplicationmain;
                showrefgrid_billcomments(function (data) {
                    if(!vm.transferapplicationmain.billcommentsEntity){
                        vm.transferapplicationmain.billcommentsEntity={};
                    }
                    vm.transferapplicationmain.billcommentsEntity.billno=vm.transferapplicationmain.billno;
                    vm.transferapplicationmain.billcommentsEntity.refbilltype=0;
                    vm.transferapplicationmain.billcommentsEntity.remark=data.remark;
                    vm.transferapplicationmain.billcommentsEntity.auditstatus=data.auditstatus;
                    $.ajax({
                        type: "POST",
                        url: "../transferapplicationmain/audit",
                        data: JSON.stringify(vm.transferapplicationmain),
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
                    url: "../transferapplicationmain/unaudit",
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
            $.get("../transferapplicationmain/info/"+id, function(r){
                vm.transferapplicationmain = r.transferapplicationmain;
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

            if(!vm.transferapplicationmain.files){
                vm.transferapplicationmain.files=[];
            }
            if(response.page.list&&response.page.list.length>0){
                vm.transferapplicationmain.files.push(response.page.list[0]);
            }


        },

        upload_on_change: function (file, fileList) {
            this.fileslist = fileList;
        }
	}
});

$(function () {
    $("#jqGrid").jqGrid({
        url: '../transferapplicationmain/list',
        datatype: "json",
        colModel: [
			                                                            { label: 'id', name: 'id', width: 50, key: true,hidden:true },
                                    			                                                            { label: '申请单号', name: 'billno', width: 80 }, 
                                    			                                                            { label: '员工姓名', name: 'name', width: 80 }, 
                                    			                                                            { label: '申请时间', name: 'applicationday', width: 80 }, 
                                    			                                                            { label: '部门', name: 'deptidname', width: 80 },                                     			                                                            { label: '岗位', name: 'roleidrole_name', width: 80 },                                     			                                                            { label: '调出部门', name: 'outdeptidname', width: 80 },                                     			                                                            { label: '调出岗位', name: 'outroleidrole_name', width: 80 },                                     			                                                            { label: '调入部门', name: 'indeptidname', width: 80 },                                     			                                                            { label: '调入岗位', name: 'inroleidrole_name', width: 80 },                                     			                                                            { label: '自述理由', name: 'reason', width: 80 }, 
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
        			            vm.getRef1003();
        			            vm.getRefsys_user();
        	
        createBillAttachmentsGrid();
    createBillCommentsGrid();
    
    initGridHeight();
});