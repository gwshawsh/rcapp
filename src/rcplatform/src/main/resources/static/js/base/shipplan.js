var vm = new Vue({
    el: '#rrapp',
    data: {
        showList: true,
        title: null,
        shipplan: {}
    },
    methods: {
        query: function () {
            vm.reload();
        },
        add: function () {
            vm.showList = false;
            vm.title = "新增";
            vm.shipplan = {};
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
            var url = vm.shipplan.id == null ? "../shipplan/save" : "../shipplan/update";
            $.ajax({
                type: "POST",
                url: url,
                data: JSON.stringify(vm.shipplan),
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
                    url: "../shipplan/delete",
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
            $.get("../shipplan/info/" + id, function (r) {
                vm.shipplan = r.shipplan;
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

$(function () {
    $("#jqGrid").jqGrid({
        url: '../shipplan/list',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', width: 50, key: true,hidden:true},
            {label: '英文船名', name: 'enshipname', width: 80},
            {label: '中文船名', name: 'chshipname', width: 80},
            {label: '出口航次', name: 'expvoyage', width: 80},
            {label: '进口航次', name: 'impvoyage', width: 80},
            {label: '到港状态', name: 'arrivalstate', width: 80},
            {label: '预计到港日期', name: 'arrivaldate', width: 80},
            {label: '船舶呼号', name: 'shipid', width: 80},
            {label: 'IMO编号', name: 'imono', width: 80},
            {label: '码头代码', name: 'dockcode', width: 80},
            {label: '码头名称', name: 'dockname', width: 80},
            {label: '靠泊单位', name: 'dockunit', width: 80},
            {label: '航线', name: 'route', width: 80},
            {label: '预计到港时间', name: 'arrivaltime', width: 80},
            {label: '预计离港时间', name: 'leavetime', width: 80},
            {label: '船期', name: 'shipment', width: 80},
            {label: '备注', name: 'remark', width: 80}
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

    initGridHeight();
});