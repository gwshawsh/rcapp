var vm = new Vue({
    el: '#rrapp',
    data: {
        showList: true,
        title: null,
        todolist: {}
    },
    methods: {
        query: function () {
            vm.reload();
        },
        add: function () {
            vm.showList = false;
            vm.title = "新增";
            vm.todolist = {};
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
            var url = vm.todolist.id == null ? "../todolist/save" : "../todolist/update";
            $.ajax({
                type: "POST",
                url: url,
                data: JSON.stringify(vm.todolist),
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
                    url: "../todolist/delete",
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
            $.get("../todolist/info/" + id, function (r) {
                vm.todolist = r.todolist;

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

function openfunc(funcurl, functitle,billdata) {
    var func = {
        href: funcurl, icon: "fa fa-circle-o", title: functitle
    }
    window.parent.navtab.tabAdd(func);
}

$(function () {
    $("#jqGrid").jqGrid({
        url: '../todolist/list',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', width: 50, key: true},
            {label: '待办名称', name: 'title', width: 80},
            {label: '待办类型', name: 'todotype', width: 80},
            {label: '创建日期', name: 'billdate', width: 80},
            {label: '业务数据', name: 'billdata', width: 80},
            {label: '备注', name: 'remark', width: 80},
            {label: '功能路径', name: 'todourl', width: 80},
            {
                label: '操作', name: '', width: 80, formatter: function (cellvalue, options, rowObject) {
                var detail = "<button onclick='openfunc(\"" + rowObject.todourl + "\",\"" + rowObject.title + "\",\"" + rowObject.billdata + "\")' type='button' class='btn btn-block btn-primary'>打开</button>";
                return detail;
            }
            }
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
            //$("#jqGrid").closest(".ui-jqgrid-bdiv").css({"overflow-x": "hidden"});
        }
    });

    initGridHeight();
});