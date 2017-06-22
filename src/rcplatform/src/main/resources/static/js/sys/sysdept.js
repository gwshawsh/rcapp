var ztree;

var vm = new Vue({
	el:'#rrapp',
	data:{
		q:{
			deptId: 0
		},
		showList: true,
		title: null,
		dept:{
			parentName:null,
			parentId:0,
			type:1,
			orderNum:0
		}
	},
	methods: {
		query:function(){
			vm.reload();
			vm.getTree();
		},
		getTree: function(menuId){
			//加载菜单树
			$.get("../sys_dept/select", function(r){
				ztree = $.fn.zTree.init($("#menuTree"), setting, r.treeList);
				var node = ztree.getNodeByParam("id", vm.dept.parentId);
				ztree.selectNode(node);
				vm.dept.parentName = node.name;

				ztreeLeft = $.fn.zTree.init($("#leftTree"), setting, r.treeList);
				var node2 = ztreeLeft.getNodeByParam("id", vm.dept.parentId);
				ztreeLeft.selectNode(node2);

			})
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.dept = {parentName:null,parentId:0,type:1,orderNum:0};
			vm.getMenu();
		},
		update: function (event) {
			var menuId = getSelectedRow();
			if(menuId == null){
				return ;
			}

			$.get("../sys_dept/info/"+menuId, function(r){
				vm.showList = false;
				vm.title = "修改";
				vm.dept = r.dept;
			});

			vm.getMenu();
		},
		del: function (event) {
			var menuIds = getSelectedRows();
			if(menuIds == null){
				return ;
			}

			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
					url: "../sys_dept/delete",
					data: JSON.stringify(menuIds),
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
			});
		},
		saveOrUpdate: function (event) {
			var url = vm.dept.deptId == null ? "../sys_dept/save" : "../sys_dept/update";
			$.ajax({
				type: "POST",
				url: url,
				data: JSON.stringify(vm.dept),
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
		menuTree: function(){
			layer.open({
				type: 1,
				offset: '50px',
				skin: 'layui-layer-molv',
				title: "选择菜单",
				area: ['300px', '450px'],
				shade: 0,
				shadeClose: false,
				content: jQuery("#menuLayer"),
				btn: ['确定', '取消'],
				btn1: function (index) {
					var node = ztree.getSelectedNodes();
					//选择上级菜单
					vm.dept.parentId = node[0].deptId;
					vm.dept.parentName = node[0].name;

					layer.close(index);
				}
			});
		},
		reload: function (event) {
			vm.showList = true;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{
				page:page,
				postData:{'deptId':vm.q.deptId}
			}).trigger("reloadGrid");


		},
		onClickNode:function(event, treeId, treeNode) {
			if(vm.showList) {
				vm.q.deptId = treeNode.deptId;
				vm.reload();
			}

		}
	}
});



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
	},
	callback:{
		onClick:vm.onClickNode
	}
};


$(function () {
	$("#jqGrid").jqGrid({
		url: '../sys_dept/list',
		datatype: "json",
		colModel: [
			{ label: '部门', name: 'id', width: 50, key: true },
			{ label: '上级部门', name: 'parentName', width: 80 },
			{ label: '部门名称', name: 'name', width: 80 },
			{ label: '类型', name: 'type', width: 80 },
			{ label: '排序', name: 'orderNum', width: 80 }
		],
		viewrecords: true,
		height: "100%",
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
			//$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });
		}
	});

	vm.getTree();

	initGridHeight();
});