var ztree;
var vm = new Vue({
	el:'#rrapp',
	data:{
        q:{
            id: 0
        },
		showList: true,
		title: null,
		gclass: {
             parentName: null,
             parentId: 0,
             orderNum: 0
        }
	},
	methods: {
		query: function () {
            vm.reload();
            vm.getTree();
		},
        getTree: function(menuId){
            //加载菜单树
            $.get("../gclass/select", function(r){
                ztree = $.fn.zTree.init($("#menuTree"), setting, r.treeList);
                var node = ztree.getNodeByParam("id", vm.gclass.parentId);
                ztree.selectNode(node);
                vm. accountcategory.parentName = node.name;

                ztreeLeft = $.fn.zTree.init($("#leftTree"), setting, r.treeList);
                var node2 = ztreeLeft.getNodeByParam("id", vm.gclass.parentId);
                ztreeLeft.selectNode(node2);

            })
        },
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.gclass = {};
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
			var url = vm.gclass.id == null ? "../gclass/save" : "../gclass/update";
			$.ajax({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.gclass),
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
				    url: "../gclass/delete",
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
			$.get("../gclass/info/"+id, function(r){
                vm.gclass = r.gclass;
            });
		},
        menuTree: function(){
            layer.open({
                type: 1,
                offset: '50px',
                skin: 'layui-layer-molv',
                title: "选择",
                area: ['300px', '450px'],
                shade: 0,
                shadeClose: false,
                content: jQuery("#menuLayer"),
                btn: ['确定', '取消'],
                btn1: function (index) {
                    var node = ztree.getSelectedNodes();
                    //选择上级菜单
                    vm.gclass.parentId = node[0].id;
                    vm.gclass.parentName = node[0].name;

                    layer.close(index);
                }
            });
        },
		reload: function (event) {
			vm.showList = true;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{
                page:page,
                postData:{'id':vm.q.id}
            }).trigger("reloadGrid");
		},
        onClickNode:function(event, treeId, treeNode) {
            if(vm.showList) {
                vm.q.id = treeNode.id;
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
        url: '../gclass/list',
        datatype: "json",
        colModel: [
							                    { label: 'id', name: 'id', width: 50, key: true },
											                    { label: '上级类别ID', name: 'parentid', width: 80 }, 
											                    { label: '名称', name: 'name', width: 80 }, 
											                    { label: '编码', name: 'code', width: 80 }
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
            //$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });
        }
    });

    vm.getTree();
	initGridHeight();
});