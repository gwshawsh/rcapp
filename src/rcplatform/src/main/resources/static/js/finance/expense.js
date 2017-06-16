var ztree;

var vm = new Vue({
    el: '#rrapp',
    data: {
        showList: true,
        title: null,
        expense: {}
    },
    methods: {
        query: function () {
            vm.reload();
        },
        add: function () {
            vm.showList = false;
            vm.title = "新增";
            vm.expense = {};
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
            var url = vm.expense.id == null ? "../expense/save" : "../expense/update";
            $.ajax({
                type: "POST",
                url: url,
                data: JSON.stringify(vm.expense),
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
                    url: "../expense/delete",
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
        getInfo: function (id) {
            $.get("../expense/info/" + id, function (r) {
                vm.expense = r.expense;
            });
        },
        reload: function (event) {
            vm.showList = true;
            var page = $("#jqGrid").jqGrid('getGridParam', 'page');
            $("#jqGrid").jqGrid('setGridParam', {
                page: page
            }).trigger("reloadGrid");
        },
        getTree: function(menuId){
            //加载部门菜单树
            $.get("../sys/dept/select", function(r){
                ztree = $.fn.zTree.init($("#menuTree"), setting, r.deptList);
                var node = ztree.getNodeByParam("deptId", vm.expense.deptId);
                ztree.selectNode(node);
                vm.expense.deptName = node.name;

            })
            //加载费用项目菜单树
            $.get("../finance/costcategory/select", function(r){
                ztree = $.fn.zTree.init($("#costcategoryTree"), costcategoryTreeSetting, r.treeList);
                var node = ztree.getNodeByParam("costcategoryId", vm.expense.costcategoryId);
                ztree.selectNode(node);
                vm.expense.costcategoryName = node.name;

            })

        },
        deptTree: function(){
            show_tree({
                url: "../sys/dept/select",
                idKey:"deptId",
                listName:"deptList",
                currentId:vm.expense.deptId,
                select:function (node) {
                    vm.expense.deptId = node[0].deptId;
                    vm.expense.deptName = node[0].name;
                }
            })
        },
        costcategoryTree: function(){
            show_tree({
                url: "../costcategory/select",
                idKey:"costcategoryId",
                select:function (node) {
                    vm.expense.costcategoryId = node[0].costcategoryId;
                    vm.expense.costcategoryName = node[0].name;
                }
            })
        },
    }
});

$(function () {
    $("#jqGrid").jqGrid({
        url: '../expense/list',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', width: 50, key: true},
            {label: '报销单号', name: 'billno', width: 80},
            {label: '申请人', name: 'applyuser', width: 80},
            {label: '部门', name: 'deptName', width: 80},
            {label: '申请日期', name: 'applydate', width: 80},
            {label: '费用项目', name: 'costcategoryName', width: 80},
            {label: '报销金额', name: 'expensemoney', width: 80},
            {label: '报销事由', name: 'reason', width: 80},
            {label: '收款人', name: 'receiver', width: 80},
            {label: '支付方式', name: 'paytype', width: 80},
            {label: '审批人', name: 'accuser', width: 80},
            {label: '审核日期', name: 'accdate', width: 80}
        ],
        viewrecords: true,
        height: 385,
        rowNum: 10,
        rowList: [10, 30, 50],
        rownumbers: true,
        rownumWidth: 25,
        autowidth: true,
        autoScroll: true,
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
        shrinkToFit: false,
        gridComplete: function () {
            //隐藏grid底部滚动条
            //$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });
        }
    });
    initGridHeight();
});