//生成弹出树形空间参照
                var ztreeorgid;
                                                            
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
                billno:"",                 orgid:"",                 paytype:"",                 boctid:"",                 rate:"",                 taxrate:"",                 total:"",                 bgndate:"",                 enddate:"",                 remark:"",                 billstatus:"",                 makeuser:"",                 makedate:"",                 accuser:"",                 accdate:"",                 uptdate:""            },
        showQuery:false,
		showList: true,
        showDetailList:true,
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

        //用户下拉参照的属性
                                                                                                        ref_paytype:[],
                                                                                    ref_boctype:[],
                                                                                    ref_enum1003:[],

                                    

        //单据主表实体类
		repaircontractmain: {
                                                                                                    billno:"*",
                                                                                                            orgid:"",
                                                                                                            paytype:"",
                                                                                                            boctid:"",
                                                                                                            rate:"",
                                                                                                            taxrate:"",
                                                                                                            total:"",
                                                                                                            bgndate:"",
                                                                                                            enddate:"",
                                                                                                            remark:"",
                                                                                                            billstatus:"",
                                                                                                            makeuser:gUserName,
                                                                                                            makedate:"",
                                                                                                            accuser:"",
                                                                                                            accdate:"",
                                                                                                            uptdate:"",
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
			vm.repaircontractmain = {
                                                            orgidname:"",
                                                                                paytypename:"",
                                                                                boctidboctypename:"",
                                                                                billstatusenumvaluename:"",
                                    
                                                                                                                            billno:"*",
                                                                                                                                    orgid:"",
                                                                                                                                    paytype:"",
                                                                                                                                    boctid:"",
                                                                                                                                    rate:"",
                                                                                                                                    taxrate:"",
                                                                                                                                    total:"",
                                                                                                                                    bgndate:"",
                                                                                                                                    enddate:"",
                                                                                                                                    remark:"",
                                                                                                                                    billstatus:"",
                                                                                                                                    makeuser:gUserName,
                                                                                                                                    makedate:mktime,
                                                                                                                                    accuser:"",
                                                                                                                                    accdate:"",
                                                                                                                                    uptdate:"",
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
			var url = vm.repaircontractmain.id == null ? "../repaircontractmain/save" : "../repaircontractmain/update";
			$.ajax({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.repaircontractmain),
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
        audit:function(event){
            var ids = getSelectedRows();
            if(ids == null){
                return ;
            }

            confirm('确定要审核选中的记录？', function(){
                $.ajax({
                    type: "POST",
                    url: "../repaircontractmain/audit",
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

        unaudit:function(){
            var ids = getSelectedRows();
            if(ids == null){
                return ;
            }

            confirm('确定要反审核选中的记录？', function(){
                $.ajax({
                    type: "POST",
                    url: "../repaircontractmain/unaudit",
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
				    url: "../repaircontractmain/delete",
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
                                                                                                                                                                                                                                                                                                                                                            
        //生成参照调用下拉框函数,用来初始化远程数据
                                                        getRefpaytype: function () {
                    $.get("../paytype/list?page=1&limit=1000", function (r) {
                        vm.ref_paytype = r.page.list;
                    });
                },
                                                getRefboctype: function () {
                    $.get("../boctype/list?page=1&limit=1000", function (r) {
                        vm.ref_boctype = r.page.list;
                    });
                },
                                                getRef1003: function () {
                    $.get("../enumtable/listone?enumid=1003&page=1&limit=1000", function (r) {
                        vm.ref_enum1003 = r.page.list;
                    });
                },
                    
        //生成弹出树形空间参照
                                                            
                getRefTreeorganizationorgid: function(menuId){
                    //加载菜单树
                    $.get("../organization/select", function(r){
                        ztreeorgid = $.fn.zTree.init($("#refTreeorganization"), setting, r.treeList);
                        var node = ztreeorgid.getNodeByParam("id", vm.repaircontractmain.orgid);
                        ztreeorgid.selectNode(node);
                        vm.repaircontractmain.orgidname = node.name;

                    })
                },

                openRefTreeorganizationorgid: function(){
                    layer.open({
                        type: 1,
                        offset: '50px',
                        skin: 'layui-layer-molv',
                        title: "选择",
                        area: ['300px', '450px'],
                        shade: 0,
                        shadeClose: false,
                        content: jQuery("#treelayerorganization"),
                        btn: ['确定', '取消'],
                        btn1: function (index) {
                            var node = ztreeorgid.getSelectedNodes();
                            //选择上级菜单
                            vm.repaircontractmain.orgid = node[0].id;
                            vm.repaircontractmain.orgidname = node[0].name;

                            layer.close(index);
                        }
                    });
                },
                                                                                                                                                                                                                                                                                                            
        getInfo: function(id){
            $.get("../repaircontractmain/info/"+id, function(r){
                vm.repaircontractmain = r.repaircontractmain;
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
        queryDetail:function(){
            var id = getSelectedRow();
            if (id == null) {
                return;
            }
            vm.showDetailList = true;

            $("#jqGridDetail").jqGrid('setGridParam', {
                page: 1,
                postData:{'formid':id},
                datatype: "json"
            }).trigger("reloadGrid");
        },

        //增加明细表一条记录
        additem:function(){
            var mktime=moment().format("YYYY-MM-DD");
            var idx=vm.repaircontractmain.details.length;
            var item={
                                                            id:"",                                                                                 billno:"*",                                                                                 serialno:idx,                                                                                 goodsid:"",                                                                                 boxtype:"",                                                                                 weighttype:"",                                                                                 price:"",                                                                                 transprice:"",                                                                                 goodsqty:"",                                                                                 total:"",                                     
            };


            vm.repaircontractmain.details.push(item);
        },

        selectitem:function(index){
            var sel=index;
            var item=vm.repaircontractmain.details[sel];
        },
        delitem:function(event){
            var obj=event.currentTarget;
            var index=obj.attributes['idx'].value
            vm.repaircontractmain.details.splice(index, 1);
            for(var i=0;i<vm.repaircontractmain.details.length;i++){
                vm.repaircontractmain.details[i].serialno=i;
            }
        }
	}
});

$(function () {
    $("#jqGrid").jqGrid({
        url: '../repaircontractmain/list',
        datatype: "json",
        colModel: [
							                    { label: 'id', name: 'id', width: 50, key: true,hidden:true },
                							                    { label: '单据号', name: 'billno', width: 80 }, 
											                    { label: '客户', name: 'orgid', width: 80 }, 
											                    { label: '付款方式', name: 'paytypename', width: 80 },                 							                    { label: '币别', name: 'boctidboctypename', width: 80 },                 							                    { label: '汇率', name: 'rate', width: 80 }, 
											                    { label: '税率', name: 'taxrate', width: 80 }, 
											                    { label: '总金额', name: 'total', width: 80 }, 
											                    { label: '生效日期', name: 'bgndate', width: 80 }, 
											                    { label: '失效日期', name: 'enddate', width: 80 }, 
											                    { label: '备注', name: 'remark', width: 80 }, 
											                    { label: '单据状态', name: 'billstatus', width: 80 ,formatter:formater_billstatus}, 
                							                    { label: '制单人', name: 'makeuser', width: 80 }, 
											                    { label: '制单日期', name: 'makedate', width: 80 }, 
											                    { label: '审核人', name: 'accuser', width: 80 }, 
											                    { label: '审核日期', name: 'accdate', width: 80 }, 
											                    { label: '更新时间', name: 'uptdate', width: 80 }
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


    $("#jqGridDetail").jqGrid({
        url: '../repaircontractmain/listdetail',
        datatype: "local",
        colModel: [
							                    { label: 'id', name: 'id', width: 50, key: true,hidden:true},
                														                    { label: '序号', name: 'serialno', width: 80 }, 
											                    { label: '设备', name: 'goodsidname', width: 80 },                 							                    { label: '箱型', name: 'boxtypeboxsize', width: 80 },                 							                    { label: '空重类型', name: 'weighttypeenumvaluename', width: 80 },                 							                    { label: '维修单价', name: 'price', width: 80 }, 
											                    { label: '运输单价', name: 'transprice', width: 80 }, 
											                    { label: '数量', name: 'goodsqty', width: 80 }, 
											                    { label: '维修费用', name: 'total', width: 80 }, 
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
                        vm.getRefTreeorganizationorgid();
                                vm.getRefpaytype();
                                vm.getRefboctype();
                                vm.getRef1003();
            



    initGridHeightHalf("#jqGrid");
    initGridHeightHalf("#jqGridDetail");
});