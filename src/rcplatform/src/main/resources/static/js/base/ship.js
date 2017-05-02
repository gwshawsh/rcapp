var vm = new Vue({
    el: '#rrapp',
    data: {
        showList: true,
        title: null,
        ship: {}
    },
    methods: {
        query: function () {
            vm.reload();
        },
        add: function () {
            vm.showList = false;
            vm.title = "新增";
            vm.ship = {};
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
            var url = vm.ship.id == null ? "../ship/save" : "../ship/update";
            $.ajax({
                type: "POST",
                url: url,
                data: JSON.stringify(vm.ship),
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
                    url: "../ship/delete",
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
            $.get("../ship/info/" + id, function (r) {
                vm.ship = r.ship;
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
        url: '../ship/list',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', width: 50, key: true,hidden:true},
            {label: '编码', name: 'code', width: 80},
            {label: '中文名称', name: 'name', width: 80},
            {label: '英文名称', name: 'enname', width: 80},
            {label: '所属区域', name: 'region', width: 80},
            {label: 'UN代码', name: 'uncode', width: 80},
            {label: '类型', name: 'type', width: 80},
            {label: '所属船公司', name: 'company', width: 80},
            {label: 'COS代码', name: 'coscode', width: 80},
            {label: 'COS船英文名', name: 'cosshipenname', width: 80},
            {label: '所属国家', name: 'country', width: 80},
            {label: '联系人 ', name: 'contact', width: 80},
            {label: '地址', name: 'address', width: 80},
            {label: '电话', name: 'phone', width: 80},
            {label: '航线', name: 'route', width: 80}
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