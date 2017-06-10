
var vm = new Vue({
	el:'#rrapp',
	data:{
		showList: true,
        showDetailList:true,
		title: null,
		requisitionmain: {}
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
			vm.requisitionmain = {billno:"*",makeuser:gUserName,makedate:mktime,details:[]};
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
																																								                selectmakedate: function (event) {
                    var option = {
                        elem: event.currentTarget,
                        istime: true,
                        format: 'YYYY-MM-DD hh:mm:ss',
                        choose: function (dates) {
                            vm.requisitionmain.makedate = dates;
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
                            vm.requisitionmain.accdate = dates;
                        }
                    }
                    layui.laydate(option);
                },
															

        getInfo: function(id){
            $.get("../requisitionmain/info/"+id, function(r){
                vm.requisitionmain = r.requisitionmain;
            });
        },
        reload: function (event) {
            vm.showList = true;
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
            var idx=vm.requisitionmain.details.length;
            var item={billno:"*",serialno:idx};
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
        }
	}
});

$(function () {
    $("#jqGrid").jqGrid({
        url: '../requisitionmain/list',
        datatype: "json",
        colModel: [
							                    { label: 'id', name: 'id', width: 50, key: true },
											                    { label: '单据号', name: 'billno', width: 80 }, 
											                    { label: '请购人', name: 'requser', width: 80 }, 
											                    { label: '所属部门', name: 'reqdepartment', width: 80 }, 
											                    { label: '请购类别', name: 'reqtype', width: 80 }, 
											                    { label: '单据状态', name: 'billstatus', width: 80 }, 
											                    { label: '制单人', name: 'makeuser', width: 80 }, 
											                    { label: '制单日期', name: 'makedate', width: 80 }, 
											                    { label: '审核人', name: 'accuser', width: 80 }, 
											                    { label: '审核日期', name: 'accdate', width: 80 }, 
											                    { label: '更新时间', name: 'uptdate', width: 80 }, 
											                    { label: '备注', name: 'remark', width: 80 }
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
        url: '../requisitionmain/listdetail',
        datatype: "local",
        colModel: [
							                    { label: 'id', name: 'id', width: 50, key: true },
											                    { label: '单据号', name: 'billno', width: 80 }, 
											                    { label: '序号', name: 'serialno', width: 80 }, 
											                    { label: '商品id', name: 'goodId', width: 80 }, 
											                    { label: '品名', name: 'goodsname', width: 80 }, 
											                    { label: '数量', name: 'goodscount', width: 80 }, 
											                    { label: '规格', name: 'goodsspec', width: 80 }, 
											                    { label: '用途', name: 'goodsuse', width: 80 }, 
											                    { label: '需用日期', name: 'enddate', width: 80 }, 
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