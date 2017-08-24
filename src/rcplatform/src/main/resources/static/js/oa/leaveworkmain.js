//生成弹出树形空间参照
                                                        
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
                                                                            billno:"",                                                                 userid:"",                                                                 starttime:"",                                                                 endtime:"",                                                                 leavetype:"",                                                                 billstatus:"",                                                                 reason:"",                                                                 createtime:"",                                                                 realendtime:"",                                                                 makeuser:"",                                                                 makedate:"",                                                                 uptdate:"",                                                                 pocessinstanceid:""                            
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
					                					ref_sys_user:[],

                								                                    ref_enum1005:[],
                								                                    ref_enum1003:[],
                					
        //创建实体类
        leaveworkmain: {
                                                useridfullname:"",
                                                                leavetypeenumvaluename:"",
                                                                billstatusenumvaluename:"",
                                                                                                        billno:"",                                                                 userid:"",                                                                 starttime:"",                                                                 endtime:"",                                                                 leavetype:"",                                                                 billstatus:"",                                                                 reason:"",                                                                 createtime:"",                                                                 realendtime:"",                                                                 makeuser:"",                                                                 makedate:"",                                                                 uptdate:"",                                                                 pocessinstanceid:""                            
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
			vm.leaveworkmain = {
                //参照的虚拟字段也必须先声明好,不然饿了么ui组件不能双向绑定
                                                            useridfullname:"",
                                                                                leavetypeenumvaluename:"",
                                                                                billstatusenumvaluename:"",
                                                                                                                                                                billno:"*",                                                                                                                                     userid:"",                                                                                                                                     starttime:"",                                                                                                                                     endtime:"",                                                                                                                                     leavetype:"",                                                                                                                                     billstatus:"",                                                                                                                                     reason:"",                                                                                                                                     createtime:"",                                                                                                                                     realendtime:"",                                                                                                                                     makeuser:gUserId,                                                                                                                                     makedate:mktime,                                                                                                                                     uptdate:"",                                                                                                                                     pocessinstanceid:""                                                            
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
			var url = vm.leaveworkmain.id == null ? "../leaveworkmain/save" : "../leaveworkmain/update";
			$.ajax({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.leaveworkmain),
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
				    url: "../leaveworkmain/delete",
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
					                getRefsys_user: function () {
                    $.get("../sys_user/list?page=1&limit=1000", function (r) {
                        vm.ref_sys_user = r.page.list;
                    });
                },

            					                getRef1005: function () {
                    $.get("../enumtable/listone?enumid=1005&page=1&limit=1000", function (r) {
                        vm.ref_enum1005 = r.page.list;
                    });
                },
            					                getRef1003: function () {
                    $.get("../enumtable/listone?enumid=1003&page=1&limit=1000", function (r) {
                        vm.ref_enum1003 = r.page.list;
                    });
                },
            		
        //生成弹出树形空间参照
                    //提交到工作流
            submitworkflow:function () {
                var row=getSelectedRow();
                if (row == null) {
                    return;
                }
                confirm('确定要提交选中的任务？', function () {
                    $.ajax({
                        type: "POST",
                        url: "../leaveworkmain/submitworkflow",
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

                $.get("../leaveworkmain/info/" + id, function (r) {
                    vm.leaveworkmain = r.leaveworkmain;
                    vm.leaveworkmain.id=null;
                    vm.leaveworkmain.billno="*";
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
                        url: "../leaveworkmain/cancel",
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
                    url: "../leaveworkmain/claim",
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
            $.get("../leaveworkmain/info/"+id, function(r){
                vm.leaveworkmain = r.leaveworkmain;
                showrefgrid_billcomments(function (data) {
                    if(!vm.leaveworkmain.billcommentsEntity){
                        vm.leaveworkmain.billcommentsEntity={};
                    }
                    vm.leaveworkmain.billcommentsEntity.billno=vm.leaveworkmain.billno;
                    vm.leaveworkmain.billcommentsEntity.refbilltype=0;
                    vm.leaveworkmain.billcommentsEntity.remark=data.remark;
                    vm.leaveworkmain.billcommentsEntity.auditstatus=data.auditstatus;
                    $.ajax({
                        type: "POST",
                        url: "../leaveworkmain/audit",
                        data: JSON.stringify(vm.leaveworkmain),
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
                    url: "../leaveworkmain/unaudit",
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
            $.get("../leaveworkmain/info/"+id, function(r){
                vm.leaveworkmain = r.leaveworkmain;
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

            if(!vm.leaveworkmain.files){
                vm.leaveworkmain.files=[];
            }
            if(response.page.list&&response.page.list.length>0){
                vm.leaveworkmain.files.push(response.page.list[0]);
            }


        },

        upload_on_change: function (file, fileList) {
            this.fileslist = fileList;
        }
	}
});

$(function () {
    $("#jqGrid").jqGrid({
        url: '../leaveworkmain/list',
        datatype: "json",
        colModel: [
			                                                            { label: 'id', name: 'id', width: 50, key: true,hidden:true },
                                    			                                                            { label: '单据号', name: 'billno', width: 80 }, 
                                    			                                                            { label: '申请人', name: 'useridfullname', width: 80 },                                     			                                                            { label: '开始时间', name: 'starttime', width: 80 }, 
                                    			                                                            { label: '结束时间', name: 'endtime', width: 80 }, 
                                    			                                                            { label: '类型', name: 'leavetypeenumvaluename', width: 80 },                                     			                                                            { label: '单据状态', name: 'billstatus', width: 80 ,formatter:formater_billstatus}, 
                                    			                                                            { label: '请假原因', name: 'reason', width: 80 }, 
                                    			                                                            { label: '创建时间', name: 'createtime', width: 80 }, 
                                    			                                                            { label: '完结时间', name: 'realendtime', width: 80 }, 
                                    			                                                            { label: '制单人', name: 'makeuserfullname', width: 80 },                                     			                                                            { label: '制单日期', name: 'makedate', width: 80 }, 
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
			            vm.getRefsys_user();
        			            vm.getRef1005();
        			            vm.getRef1003();
        	
        createBillAttachmentsGrid();
    createBillCommentsGrid();
    
    initGridHeight();
});