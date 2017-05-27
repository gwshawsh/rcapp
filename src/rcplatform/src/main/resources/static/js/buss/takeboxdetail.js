
var vm = new Vue({
	el:'#rrapp',
	data:{
		showList: true,
		title: null,
		takeboxdetail: {}
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.takeboxdetail = {};
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
			var url = vm.takeboxdetail.id == null ? "../takeboxdetail/save" : "../takeboxdetail/update";
			$.ajax({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.takeboxdetail),
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
				    url: "../takeboxdetail/delete",
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
			$.get("../takeboxdetail/info/"+id, function(r){
                vm.takeboxdetail = r.takeboxdetail;
            });
		},
		reload: function (event) {
			vm.showList = true;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{ 
                page:page
            }).trigger("reloadGrid");
		}
	}
});

$(function () {
    $("#jqGrid").jqGrid({
        url: '../takeboxdetail/list',
        datatype: "json",
        colModel: [
							                    { label: 'id', name: 'id', width: 50, key: true },
											                    { label: '单据号', name: 'billno', width: 80 }, 
											                    { label: '序号', name: 'serialno', width: 80 }, 
											                    { label: '运输公司', name: 'transcompanyid', width: 80 }, 
											                    { label: '原起运地点', name: 'startplaceid1', width: 80 }, 
											                    { label: '现起运点', name: 'startplaceid2', width: 80 }, 
											                    { label: '目的地', name: 'endplaceid2', width: 80 }, 
											                    { label: '箱号', name: 'boxno', width: 80 }, 
											                    { label: '计划提箱时间', name: 'plantaketime', width: 80 }, 
											                    { label: '实际提箱时间', name: 'realtaketime', width: 80 }, 
											                    { label: '计划到场时间', name: 'planarrvetime', width: 80 }, 
											                    { label: '实际到场时间', name: 'realarrvetime', width: 80 }
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

	initGridHeight();
});