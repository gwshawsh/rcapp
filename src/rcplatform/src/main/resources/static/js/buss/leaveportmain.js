var vm = new Vue({
    el: '#rrapp',
    data: {
        showList: true,
        title: null,
        leaveportmain: {}
    },
    methods: {
        query: function () {
            vm.reload();
        },
        add: function () {
            vm.showList = false;
            vm.title = "新增";
            vm.leaveportmain = {};
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
            var url = vm.leaveportmain.id == null ? "../leaveportmain/save" : "../leaveportmain/update";
            $.ajax({
                type: "POST",
                url: url,
                data: JSON.stringify(vm.leaveportmain),
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
                    url: "../leaveportmain/delete",
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
            $.get("../leaveportmain/info/" + id, function (r) {
                vm.leaveportmain = r.leaveportmain;
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
        url: '../leaveportmain/list',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', width: 50, key: true},
            {label: '单据号', name: 'billno', width: 80},
            {label: '港口', name: 'port', width: 80},
            {label: '船公司', name: 'shipcompany', width: 80},
            {label: '箱量', name: 'boxqty', width: 80},
            {label: '箱型', name: 'boxtype', width: 80},
            {label: '目的地', name: 'endplaceId', width: 80},
            {label: '预计到港时间', name: 'planarrporttime', width: 80},
            {label: '预计到场时间', name: 'planarrtime', width: 80},
            {label: '制单人', name: 'billuser', width: 80},
            {label: '制单日期', name: 'billdate', width: 80},
            {label: '审核人', name: 'accuser', width: 80},
            {label: '审核日期', name: 'accdate', width: 80},
            {label: '更新时间', name: 'uptdate', width: 80}
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
        shrinkToFit: false,
        gridComplete: function () {
            //隐藏grid底部滚动条
            //$("#jqGrid").closest(".ui-jqgrid-bdiv").css({"overflow-x": "hidden"});
        }
    });

    initGridHeight();
});