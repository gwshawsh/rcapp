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
                billno:"",                 requser:"",                 deptid:"",                 reqtype:"",                 budgetmainid:"",                 billstatus:"",                 makeuser:"",                 makedate:"",                 accuser:"",                 accdate:"",                 uptdate:"",                 remark:"",                 pocessinstanceid:""            },
        showQuery:false,
		showList: true,
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

        //用户下拉参照的属性
                                                        ref_sys_user:[],
                                                                                    ref_sys_dept:[],
                                                                                    ref_enum1002:[],

                                                                                                                                    ref_enum1003:[],

                                    

        //明细表用户下拉参照的属性
                                                        ref_goods:[],
                                    
        //单据主表实体类
		requisitionmain: {
                                                                                                    billno:"*",
                                                                                                            requser:"",
                                                                                                            deptid:"",
                                                                                                            reqtype:"",
                                                                                                            budgetmainid:"",
                                                                                                            billstatus:"",
                                                                                                            makeuser:gUserId,
                                                                                                            makedate:"",
                                                                                                            accuser:"",
                                                                                                            accdate:"",
                                                                                                            uptdate:"",
                                                                                                            remark:"",
                                                                                                            pocessinstanceid:"",
                                                            details:[]

        }
	},
	methods: {
        showQueryPanel:function(){
            vm.showQuery=!vm.showQuery;
        },
		query: function () {
			vm.reload();
		},
        showdetail: function () {
            vm.showDetailList=!vm.showDetailList;
            if(vm.showDetailList){
                initGridHeightHalf("#jqGrid");
                initGridHeightHalf("#jqGridDetail");
            }
            else{
                initGridHeight("#jqGrid");
            }
        },
		add: function(){
            var mktime=moment().format("YYYY-MM-DD");
			vm.showList = false;
            vm.showDetailList=false;
			vm.title = "新增";
			vm.requisitionmain = {
                                                            requserfullname:"",
                                                                                deptidname:"",
                                                                                reqtypeenumvaluename:"",
                                                                                budgetmainidbillno:"",
                                                                                billstatusenumvaluename:"",
                                    
                                                                                                                            billno:"*",
                                                                                                                                    requser:"",
                                                                                                                                    deptid:"",
                                                                                                                                    reqtype:"",
                                                                                                                                    budgetmainid:"",
                                                                                                                                    billstatus:"",
                                                                                                                                    makeuser:gUserFullName,
                                                                                                                                    makedate:mktime,
                                                                                                                                    accuser:"",
                                                                                                                                    accdate:"",
                                                                                                                                    uptdate:"",
                                                                                                                                    remark:"",
                                                                                                                                    pocessinstanceid:"",
                                                                            details:[]};
            vm.additem();
		},
		update: function (event) {
			var id = getSelectedRow();
			if(id == null){
				return ;
			}
			vm.showList = false;
            vm.showDetailList=false;
            vm.title = "修改";
            
            vm.getInfo(id)
		},
		saveOrUpdate: function (event) {
			var url = vm.requisitionmain.id == null ? "../requisitionmain/save" : "../requisitionmain/update";
			$.ajax({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.requisitionmain),
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
        //提交到工作流
        submitworkflow:function () {
            var row=getSelectedRow();
            if (row == null) {
                return;
            }
            confirm('确定要提交选中的任务？', function () {
                $.ajax({
                    type: "POST",
                    url: "../requisitionmain/submitworkflow",
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

            $.get("../requisitionmain/info/" + id, function (r) {
                vm.requisitionmain = r.requisitionmain;
                vm.requisitionmain.id=null;
                vm.requisitionmain.billno="*";
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
                    url: "../requisitionmain/cancel",
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
                    url: "../requisitionmain/claim",
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
            $.get("../requisitionmain/info/"+id, function(r){
                vm.requisitionmain = r.requisitionmain;
                showrefgrid_billcomments(function (data) {
                    if(!vm.requisitionmain.billcommentsEntity){
                        vm.requisitionmain.billcommentsEntity={};
                    }
                    vm.requisitionmain.billcommentsEntity.billno=vm.requisitionmain.billno;
                    vm.requisitionmain.billcommentsEntity.refbilltype=0;
                    vm.requisitionmain.billcommentsEntity.remark=data.remark;
                    vm.requisitionmain.billcommentsEntity.auditstatus=data.auditstatus;
                    $.ajax({
                        type: "POST",
                        url: "../requisitionmain/audit",
                        data: JSON.stringify(vm.requisitionmain),
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
                    url: "../requisitionmain/unaudit",
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

		del: function (event) {
			var ids = getSelectedRows();
			if(ids == null){
				return ;
			}
			
			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: "../requisitionmain/delete",
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

        //生成参照调用函数
                                                                                                                                        selectbudgetmainidbudgetmain: function (event) {
                    showrefgrid_budgetmain("参照", function (data) {
                        var seldata = data;
                        vm.requisitionmain.budgetmainid =seldata['id'];
                        vm.requisitionmain.budgetmainidbudgetmainbillno =seldata['name'];
                    });
                },
                                                                                                                                                                                    
        //生成主表参照调用下拉框函数,用来初始化远程数据
                                    getRefsys_user: function () {
                    $.get("../sys_user/list?page=1&limit=1000", function (r) {
                        vm.ref_sys_user = r.page.list;
                    });
                },
                                                getRefsys_dept: function () {
                    $.get("../sys_dept/list?page=1&limit=1000", function (r) {
                        vm.ref_sys_dept = r.page.list;
                    });
                },
                                                getRef1002: function () {
                    $.get("../enumtable/listone?enumid=1002&page=1&limit=1000", function (r) {
                        vm.ref_enum1002 = r.page.list;
                    });
                },
                                                                    getRef1003: function () {
                    $.get("../enumtable/listone?enumid=1003&page=1&limit=1000", function (r) {
                        vm.ref_enum1003 = r.page.list;
                    });
                },
                    
        //生成明细表参照调用下拉框函数,用来初始化远程数据
                                    getRefgoods: function () {
                    $.get("../goods/list?page=1&limit=1000", function (r) {
                        vm.ref_goods = r.page.list;
                    });
                },
                    
        //生成弹出树形空间参照
                                                                                                                                                                                                                                                                                                
        getInfo: function(id){
            $.get("../requisitionmain/info/"+id, function(r){
                vm.requisitionmain = r.requisitionmain;
            });
        },
        reload: function (event) {
            vm.showList = true;
            vm.showDetailList = true;
            var page = $("#jqGrid").jqGrid('getGridParam','page');
            $("#jqGrid").jqGrid('setGridParam',{
                postData: {'query': JSON.stringify(vm.q)},
                page:page
            }).trigger("reloadGrid");
        },


        //单据明细的相关操作

        //查询单据明细
        queryDetail:function(){
            var row=getSelectedRowData();

            var id = row.billno;
            if (id == null) {
                return;
            }
            vm.showDetailList = true;

            //查询单据明细
            $("#jqGridDetail").jqGrid('setGridParam', {
                page: 1,
                postData:{'formid':id},
                datatype: "json"
            }).trigger("reloadGrid");

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

        //增加明细表一条记录
        additem:function(){
            var mktime=moment().format("YYYY-MM-DD");
            var idx=vm.requisitionmain.details.length;
            var item={
                                                            id:"",                                                                                 billno:"*",                                                                                 serialno:idx,                                                                                 goodsid:"",                                                                                 goodscount:"",                                                                                 goodsspec:"",                                                                                 goodsunit:"",                                                                                 goodsuse:"",                                                                                 enddate:mktime,                                                                                 uptdate:mktime,                                     
            };


            vm.requisitionmain.details.push(item);
        },

        selectitem:function(index){
            var sel=index;
            var item=vm.requisitionmain.details[sel];
        },
        delitem:function(event){
            var obj=event.currentTarget;
            var index=obj.attributes['idx'].value
            vm.requisitionmain.details.splice(index, 1);
            for(var i=0;i<vm.requisitionmain.details.length;i++){
                vm.requisitionmain.details[i].serialno=i;
            }
        },
        upload_on_success:function (response,file,fileList) {

            if(!vm.requisitionmain.files){
                vm.requisitionmain.files=[];
            }
            if(response.page.list&&response.page.list.length>0){
                vm.requisitionmain.files.push(response.page.list[0]);
            }


        },

        upload_on_change: function (file, fileList) {
            this.fileslist = fileList;
        }

    }
});

$(function () {
    $("#jqGrid").jqGrid({
        url: '../requisitionmain/list',
        datatype: "json",
        colModel: [
			                                                            { label: 'id', name: 'id', width: 50, key: true,hidden:true },
                    							                                                            { label: '单据号', name: 'billno', width: 80 },                     							                                                            { label: '请购人', name: 'requserfullname', width: 80 },                     							                                                            { label: '所属部门', name: 'deptidname', width: 80 },                     							                                                            { label: '请购类别', name: 'reqtypeenumvaluename', width: 80 },                     							                                                            { label: '预算计划', name: 'budgetmainid', width: 80 },                     							                                                            { label: '单据状态', name: 'billstatus', width: 80 ,formatter:formater_billstatus}, 
                    							                                                            { label: '制单人', name: 'makeuserfullname', width: 80 },                     							                                                            { label: '制单日期', name: 'makedate', width: 80 },                     							                                                            { label: '审核人', name: 'accuserfullname', width: 80 },                     							                                                            { label: '审核日期', name: 'accdate', width: 80 },                     							                                                            { label: '更新时间', name: 'uptdate', width: 80 },                     							                                                            { label: '备注', name: 'remark', width: 80 },                     							                			        ],
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


    $("#jqGridDetail").jqGrid({
        url: '../requisitionmain/listdetail',
        datatype: "local",
        colModel: [
							                    { label: 'id', name: 'id', width: 50, key: true,hidden:true},
                														                    { label: '序号', name: 'serialno', width: 80 }, 
											                    { label: '商品', name: 'goodsidname', width: 80 },                 							                    { label: '数量', name: 'goodscount', width: 80 }, 
											                    { label: '规格', name: 'goodsspec', width: 80 }, 
											                    { label: '单位', name: 'goodsunit', width: 80 }, 
											                    { label: '用途', name: 'goodsuse', width: 80 }, 
											                    { label: '需用日期', name: 'enddate', width: 80 }, 
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
        pager: "#jqGridPagerDetail",
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
                        vm.getRefsys_user();
                                vm.getRefsys_dept();
                                vm.getRef1002();
                                            vm.getRef1003();
            

    //执行调用参照调用下拉框函数,初始化下拉数据
                        vm.getRefgoods();
            
    createBillAttachmentsGrid();
    createBillCommentsGrid();

    initGridHeightHalf("#jqGrid");
    initGridHeightHalf("#jqGridDetail");
});