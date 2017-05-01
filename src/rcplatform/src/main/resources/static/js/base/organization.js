var ztree;

var vm = new Vue({
    el: '#rrapp',
    data: {
        showList: true,
        title: null,
        organization: {
            parentName:null,
            parentId:0,
            type:1,
            orderNum:0
        }
    },
    methods: {
        query: function () {
            vm.reload();
            vm.getTree();
        },
        getTree: function(menuId){
            //加载菜单树
            $.get("../organization/select", function(r){
                ztree = $.fn.zTree.init($("#menuTree"), setting, r.orgList);
                var node = ztree.getNodeByParam("id", vm.organization.parentId);
                ztree.selectNode(node);
                vm.organization.parentName = node.name;

                ztreeLeft = $.fn.zTree.init($("#leftTree"), setting, r.orgList);
                var node2 = ztreeLeft.getNodeByParam("id", vm.organization.parentId);
                ztreeLeft.selectNode(node2);

            })
        },
        add: function () {
            vm.showList = false;
            vm.title = "新增";
            vm.organization = {};
        },
        update: function (event) {
            var id = getSelectedRow();
            if (id == null) {
                return;
            }
            vm.showList = false;
            vm.title = "修改";

            vm.getInfo(id)
        },
        saveOrUpdate: function (event) {
            var url = vm.organization.id == null ? "../organization/save" : "../organization/update";
            $.ajax({
                type: "POST",
                url: url,
                data: JSON.stringify(vm.organization),
                success: function (r) {
                    if (r.code === 0) {
                        alert('操作成功', function (index) {
                            vm.reload();
                        });
                    } else {
                        alert(r.msg);
                    }
                }
            });
        },
        del: function (event) {
            var ids = getSelectedRows();
            if (ids == null) {
                return;
            }

            confirm('确定要删除选中的记录？', function () {
                $.ajax({
                    type: "POST",
                    url: "../organization/delete",
                    data: JSON.stringify(ids),
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
                    vm.organization.parentId = node[0].id;
                    vm.organization.parentName = node[0].name;

                    layer.close(index);
                }
            });
        },
        getInfo: function (id) {
            $.get("../organization/info/" + id, function (r) {
                vm.organization = r.organization;
            });
        },
        reload: function (event) {
            vm.showList = true;
            var page = $("#jqGrid").jqGrid('getGridParam', 'page');
            $("#jqGrid").jqGrid('setGridParam', {
                page: page
            }).trigger("reloadGrid");
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
        url: '../organization/list',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', width: 50, key: true},
            {label: '编码', name: 'code', width: 80},
            {label: '名称', name: 'name', width: 80},
            {label: '上级组织', name: 'parentName', width: 80},
            {label: '联系电话', name: 'phone', width: 80},
            {label: '地址', name: 'address', width: 80},
            {label: '经度', name: 'longitude', width: 80},
            {label: '纬度', name: 'latitude', width: 80},
            { label: '类型', name: 'type', width: 80, formatter: function(value, options, row){
                if(value==0){
                    return  '<span class="label label-danger">目录</span>';
                }
                else if(value==1){
                    return  '<span class="label label-danger">港口</span>';
                }
                else if(value==2){
                    return  '<span class="label label-danger">仓库</span>';
                } else if(value==3){
                    return  '<span class="label label-danger">堆场</span>';
                } else if(value==4){
                    return  '<span class="label label-danger">船公司</span>';
                }
                else{
                    return  '<span class="label label-danger">放箱公司</span>';
                }

            }}

        ],
        viewrecords: true,
        height: 385,
        rowNum: 10,
        rowList: [10, 30, 50],
        rownumbers: true,
        rownumWidth: 25,
        autowidth: true,
        multiselect: true,
        pager: "#jqGridPager",
        jsonReader: {
            root: "page.list",
            page: "page.currPage",
            total: "page.totalPage",
            records: "page.totalCount"
        },
        prmNames: {
            page: "page",
            rows: "limit",
            order: "order"
        },
        gridComplete: function () {
            //隐藏grid底部滚动条
            $("#jqGrid").closest(".ui-jqgrid-bdiv").css({"overflow-x": "hidden"});
        }
    });
    vm.getTree();
    initGridHeight();
});