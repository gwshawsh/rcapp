
var vm = new Vue({
	el:'#rrapp',
	data:{
		showList: true,
		title: null,
					                					ref_place:[],
											transline: {}
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.transline = {};
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
			var url = vm.transline.id == null ? "../transline/save" : "../transline/update";
			$.ajax({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.transline),
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
				    url: "../transline/delete",
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
		//生成日期控件
																																					
        //生成参照调用弹出框函数
																																					
        //生成参照调用下拉框函数
					                getRefplace: function () {
                    $.get("../place/list?page=1&limit=1000", function (r) {
                        vm.ref_place = r.page.list;
                    });
                },
					


        getInfo: function(id){
            $.get("../transline/info/"+id, function(r){
                vm.transline = r.transline;
            });
        },
        reload: function (event) {
            vm.showList = true;
            var page = $("#jqGrid").jqGrid('getGridParam','page');
            $("#jqGrid").jqGrid('setGridParam',{
                page:page
            }).trigger("reloadGrid");
        },
	}
});

$(function () {
    $("#jqGrid").jqGrid({
        url: '../transline/list',
        datatype: "json",
        colModel: [
							                    { label: 'id', name: 'id', width: 50, key: true },
											                    { label: '编码', name: 'code', width: 80 }, 
											                    { label: '名称', name: 'name', width: 80 }, 
											                    { label: '起始地点', name: 'startlocation', width: 80 }, 
											                    { label: '结束地点', name: 'endlocation', width: 80 }, 
											                    { label: '距离', name: 'distance', width: 80 }, 
											                    { label: '助记码', name: 'helpcode', width: 80 }
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

    //生成参照调用下拉框函数
			            vm.getRefplace();
			


    initGridHeight();
});