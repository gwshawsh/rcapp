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
                                                                            billno:"",                                                                 deptid:"",                                                                 applydate:"",                                                                 costcategoryid:"",                                                                 expensemoney:"",                                                                 title:"",                                                                 remark:"",                                                                 receiver:"",                                                                 paytype:"",                                                                 bankaccount:"",                                                                 billstatus:"",                                                                 makeuser:"",                                                                 makedate:"",                                                                 accuser:"",                                                                 accdate:"",                                                                 uptdate:"",                                                                 pocessinstanceid:""                            
        },
		showList: true,
        showQuery:false,
		title: null,
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
					                								                                    ref_enum2007:[],
                								                					ref_sys_user:[],

                								                                    ref_enum1014:[],
                								                                    ref_enum1003:[],
                					
        //创建实体类
        expensemain: {
                                                deptidname:"",
                                                                costcategoryidenumvaluename:"",
                                                                receiverfullname:"",
                                                                paytypeenumvaluename:"",
                                                                billstatusenumvaluename:"",
                                                                                                        billno:"",                                                                 deptid:"",                                                                 applydate:"",                                                                 costcategoryid:"",                                                                 expensemoney:"",                                                                 title:"",                                                                 remark:"",                                                                 receiver:"",                                                                 paytype:"",                                                                 bankaccount:"",                                                                 billstatus:"",                                                                 makeuser:"",                                                                 makedate:"",                                                                 accuser:"",                                                                 accdate:"",                                                                 uptdate:"",                                                                 pocessinstanceid:""                            
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
			vm.expensemain = {
                //参照的虚拟字段也必须先声明好,不然饿了么ui组件不能双向绑定
                                                            deptidname:"",
                                                                                costcategoryidenumvaluename:"",
                                                                                receiverfullname:"",
                                                                                paytypeenumvaluename:"",
                                                                                billstatusenumvaluename:"",
                                                                                                                                                                billno:"*",                                                                                                                                     deptid:"",                                                                                                                                     applydate:"",                                                                                                                                     costcategoryid:"",                                                                                                                                     expensemoney:"",                                                                                                                                     title:"",                                                                                                                                     remark:"",                                                                                                                                     receiver:"",                                                                                                                                     paytype:"",                                                                                                                                     bankaccount:"",                                                                                                                                     billstatus:"",                                                                                                                                     makeuser:gUserId,                                                                                                                                     makedate:mktime,                                                                                                                                     accuser:"",                                                                                                                                     accdate:"",                                                                                                                                     uptdate:"",                                                                                                                                     pocessinstanceid:""                                                            
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
			var url = vm.expensemain.id == null ? "../expensemain/save" : "../expensemain/update";
			$.ajax({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.expensemain),
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
				    url: "../expensemain/delete",
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
										                getRef2007: function () {
                    $.get("../enumtable/listone?enumid=2007&page=1&limit=1000", function (r) {
                        vm.ref_enum2007 = r.page.list;
                    });
                },
            					                getRefsys_user: function () {
                    $.get("../sys_user/list?page=1&limit=1000", function (r) {
                        vm.ref_sys_user = r.page.list;
                    });
                },

            					                getRef1014: function () {
                    $.get("../enumtable/listone?enumid=1014&page=1&limit=1000", function (r) {
                        vm.ref_enum1014 = r.page.list;
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
                var node = ztreedeptid.getNodeByParam("id", vm.expensemain.deptid);
                ztreedeptid.selectNode(node);
                vm.expensemain.deptidname = node.name;

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
                    vm.expensemain.deptid = node[0].id;
                    vm.expensemain.deptidname = node[0].name;

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
                        url: "../expensemain/submitworkflow",
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

                $.get("../expensemain/info/" + id, function (r) {
                    vm.expensemain = r.expensemain;
                    vm.expensemain.id=null;
                    vm.expensemain.billno="*";
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
                        url: "../expensemain/cancel",
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
                    url: "../expensemain/claim",
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
            $.get("../expensemain/info/"+id, function(r){
                vm.expensemain = r.expensemain;
                showrefgrid_billcomments(function (data) {
                    if(!vm.expensemain.billcommentsEntity){
                        vm.expensemain.billcommentsEntity={};
                    }
                    vm.expensemain.billcommentsEntity.billno=vm.expensemain.billno;
                    vm.expensemain.billcommentsEntity.refbilltype=0;
                    vm.expensemain.billcommentsEntity.remark=data.remark;
                    vm.expensemain.billcommentsEntity.auditstatus=data.auditstatus;
                    $.ajax({
                        type: "POST",
                        url: "../expensemain/audit",
                        data: JSON.stringify(vm.expensemain),
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
                    url: "../expensemain/unaudit",
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
        
        getInfo: function(id){
            $.get("../expensemain/info/"+id, function(r){
                vm.expensemain = r.expensemain;
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

            if(!vm.expensemain.files){
                vm.expensemain.files=[];
            }
            if(response.page.list&&response.page.list.length>0){
                vm.expensemain.files.push(response.page.list[0]);
            }


        },

        upload_on_change: function (file, fileList) {
            this.fileslist = fileList;
        }
	}
});

$(function () {
    $("#jqGrid").jqGrid({
        url: '../expensemain/list',
        datatype: "json",
        colModel: [
			                                                            { label: 'id', name: 'id', width: 50, key: true,hidden:true },
                                    			                                                            { label: '报销单号', name: 'billno', width: 80 }, 
                                    			                                                            { label: '部门', name: 'deptidname', width: 80 },                                     			                                                            { label: '申请日期', name: 'applydate', width: 80 }, 
                                    			                                                            { label: '费用项目', name: 'costcategoryidenumvaluename', width: 80 },                                     			                                                            { label: '报销金额', name: 'expensemoney', width: 80 }, 
                                    			                                                            { label: '报销标题', name: 'title', width: 80 }, 
                                    			                                                            { label: '详情', name: 'remark', width: 80 }, 
                                    			                                                            { label: '收款人', name: 'receiverfullname', width: 80 },                                     			                                                            { label: '支付方式', name: 'paytypeenumvaluename', width: 80 },                                     			                                                            { label: '银行账户', name: 'bankaccount', width: 80 }, 
                                    			                                                            { label: '单据状态', name: 'billstatus', width: 80 ,formatter:formater_billstatus}, 
                                    			                                                            { label: '申请人', name: 'makeuserfullname', width: 80 },                                     			                                                            { label: '制单日期', name: 'makedate', width: 80 }, 
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
        gridComplete:function(){
            //隐藏grid底部滚动条
            //$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });
        }
    });

    //执行调用参照调用下拉框函数,初始化下拉数据
			            vm.getRefTreesys_deptdeptid();
					            vm.getRef2007();
        			            vm.getRefsys_user();
        			            vm.getRef1014();
        			            vm.getRef1003();
        	



    initGridHeight();
});