
var vm = new Vue({
	el:'#rrapp',
	data:{
		showList: true,
        showDetailList:true,
		title: null,
		paymentmain: {}
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
            var mktime=moment().format("YYYY-MM-DD");
			vm.showList = false;
            vm.showDetailList=false;
			vm.title = "新增";
			vm.paymentmain = {billno:"*",makeuser:gUserName,makedate:mktime,details:[]};
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
			var url = vm.paymentmain.id == null ? "../paymentmain/save" : "../paymentmain/update";
			$.ajax({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.paymentmain),
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
				    url: "../paymentmain/delete",
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
																														                selectreqdate: function (event) {
                    var option = {
                        elem: event.currentTarget,
                        istime: true,
                        format: 'YYYY-MM-DD hh:mm:ss',
                        choose: function (dates) {
                            vm.paymentmain.reqdate = dates;
                        }
                    }
                    layui.laydate(option);
                },
																																																															                selectmakedate: function (event) {
                    var option = {
                        elem: event.currentTarget,
                        istime: true,
                        format: 'YYYY-MM-DD hh:mm:ss',
                        choose: function (dates) {
                            vm.paymentmain.makedate = dates;
                        }
                    }
                    layui.laydate(option);
                },
													                selectaccdate: function (event) {
                    var option = {
                        elem: event.currentTarget,
                        istime: true,
                        format: 'YYYY-MM-DD hh:mm:ss',
                        choose: function (dates) {
                            vm.paymentmain.accdate = dates;
                        }
                    }
                    layui.laydate(option);
                },
										

        getInfo: function(id){
            $.get("../paymentmain/info/"+id, function(r){
                vm.paymentmain = r.paymentmain;
            });
        },
        reload: function (event) {
            vm.showList = true;
            vm.showDetailList = true;
            var page = $("#jqGrid").jqGrid('getGridParam','page');
            $("#jqGrid").jqGrid('setGridParam',{
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
        additem:function(){
            var idx=vm.paymentmain.details.length;
            var item={billno:"*",serialno:idx};
            vm.paymentmain.details.push(item);
        },

        selectitem:function(index){
            var sel=index;
            var item=vm.paymentmain.details[sel];
        },
        delitem:function(event){
            var obj=event.currentTarget;
            var index=obj.attributes['idx'].value
            vm.paymentmain.details.splice(index, 1);
            for(var i=0;i<vm.paymentmain.details.length;i++){
                vm.paymentmain.details[i].serialno=i;
            }
        }
	}
});

$(function () {
    $("#jqGrid").jqGrid({
        url: '../paymentmain/list',
        datatype: "json",
        colModel: [
							                    { label: 'id', name: 'id', width: 50, key: true },
											                    { label: '单据号', name: 'billno', width: 80 }, 
											                    { label: '请购单据号', name: 'reqbillno', width: 80 }, 
											                    { label: '请购人', name: 'requser', width: 80 }, 
											                    { label: '请购部门', name: 'reqdepartment', width: 80 }, 
											                    { label: '请购日期', name: 'reqdate', width: 80 }, 
											                    { label: '订购单据号', name: 'orderbillno', width: 80 }, 
											                    { label: '付款比例', name: 'percent', width: 80 }, 
											                    { label: '付款金额', name: 'paytotal', width: 80 }, 
											                    { label: '付款来源', name: 'paysource', width: 80 }, 
											                    { label: '收款人', name: 'payee', width: 80 }, 
											                    { label: '收款人账号', name: 'payeeaccount', width: 80 }, 
											                    { label: '付款方式', name: 'paytype', width: 80 }, 
											                    { label: '说明', name: 'payreason', width: 80 }, 
											                    { label: '物品类别', name: 'ordertype', width: 80 }, 
											                    { label: '单据状态', name: 'billstatus', width: 80 }, 
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
        gridComplete:function(){
            //隐藏grid底部滚动条
            //$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });
        }
    });


    $("#jqGridDetail").jqGrid({
        url: '../paymentmain/listdetail',
        datatype: "local",
        colModel: [
							                    { label: 'id', name: 'id', width: 50, key: true },
											                    { label: '单据号', name: 'billno', width: 80 }, 
											                    { label: '序号', name: 'serialno', width: 80 }, 
											                    { label: '物品名', name: 'goodsname', width: 80 }, 
											                    { label: '物品数量', name: 'goodscount', width: 80 }, 
											                    { label: '物品单价', name: 'goodscost', width: 80 }, 
											                    { label: '物品规格', name: 'goodsspec', width: 80 }, 
											                    { label: '物品用途', name: 'goodsuse', width: 80 }, 
											                    { label: '物品需用日期', name: 'enddate', width: 80 }, 
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

    initGridHeightHalf("#jqGrid");
    initGridHeightHalf("#jqGridDetail");
});