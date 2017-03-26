$(function () {
    $("#jqGrid").jqGrid({
        url: '../leavework/list',
        datatype: "json",
        colModel: [			
			//{ label: 'leaveId', name: 'leaveId', width: 50, key: true },
			//{ label: '', name: 'userId', width: 80 },
			{ label: '申请人', name: 'name', width: 80 }, 			
			{ label: '开始时间', name: 'startTime', width: 80 }, 			
			{ label: '结束时间', name: 'endTime', width: 80 }, 			
			{ label: '类型', name: 'leavetype', width: 80 },
			{ label: '请假原因', name: 'reason', width: 80 }, 			
			{ label: '创建时间', name: 'createTime', width: 80 }, 			
			{ label: '完结时间', name: 'realendTime', width: 80 }, 			
			{ label: '流程ID', name: 'pocessInstanceid', width: 80 }			
        ],
		viewrecords: true,
        height: 385,
        rowNum: 10,
		rowList : [10,30,50],
        rownumbers: true, 
        rownumWidth: 25, 
        autowidth:true,
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
        gridComplete:function(){
        	//隐藏grid底部滚动条
        	$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" }); 
        }
    });
});

var vm = new Vue({
	el:'#rrapp',
	data:{
		showList: true,
		title: null,
		leavework: {}
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.leavework = {};
		},
		update: function (event) {
			var leaveId = getSelectedRow();
			if(leaveId == null){
				return ;
			}
			vm.showList = false;
            vm.title = "修改";
            
            vm.getInfo(leaveId)
		},
		saveOrUpdate: function (event) {
			var url = vm.leavework.leaveId == null ? "../leavework/save" : "../leavework/update";
			$.ajax({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.leavework),
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
			var leaveIds = getSelectedRows();
			if(leaveIds == null){
				return ;
			}
			
			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: "../leavework/delete",
				    data: JSON.stringify(leaveIds),
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
		getInfo: function(leaveId){
			$.get("../leavework/info/"+leaveId, function(r){
                vm.leavework = r.leavework;
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