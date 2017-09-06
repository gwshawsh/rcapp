$(function () {
    $("#jqGrid").jqGrid({
        url: '../sys/generator/list',
        datatype: "json",
        colModel: [
            {label: '表名', name: 'tableName', width: 100, key: true},
            {label: 'Engine', name: 'engine', width: 70},
            {label: '表备注', name: 'tableComment', width: 100},
            {label: '创建时间', name: 'createTime', width: 100}
        ],
        viewrecords: true,
        height: 385,
        rowNum: 1000,
        rowList: [10, 30, 50, 100, 200],
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
            //$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });
        }
    });

    initGridHeight();
});

var vm = new Vue({
    el: '#rrapp',
    data: {
        q: {
            tableName: null
        }
    },
    methods: {
        query: function () {
            $("#jqGrid").jqGrid('setGridParam', {
                postData: {'tableName': vm.q.tableName},
                page: 1
            }).trigger("reloadGrid");
        },
        generator: function () {
            var tableNames = getSelectedRows();
            if (tableNames == null) {
                return;
            }
            layer.prompt({title: '输入所属模块名称，并确认', formType: 2}, function (text, index) {
                layer.close(index);
                location.href = "../sys/generator/code?tables=" + tableNames + "&path=" + text;
            });
        },
        generatorbill: function () {
            var tableNames = getSelectedRows();
            if (tableNames == null) {
                return;
            }
            layer.prompt({title: '输入所属模块名称，并确认', formType: 2}, function (text, index) {
                layer.close(index);
                location.href = "../sys/generator/codebill?tables=" + tableNames + "&path=" + text;
            });
        },
        generatortree: function () {
            var tableNames = getSelectedRows();
            if (tableNames == null) {
                return;
            }
            layer.prompt({title: '输入所属模块名称，并确认', formType: 2}, function (text, index) {
                layer.close(index);
                location.href = "../sys/generator/treecode?tables=" + tableNames + "&path=" + text;
            });
        },
        generatorsql: function () {
            var tableNames = getSelectedRows();
            if (tableNames == null) {
                return;
            }
            layer.prompt({title: '输入所属模块名称，并确认', formType: 2}, function (text, index) {
                layer.close(index);
                location.href = "../sys/generator/sqlcode?tables=" + tableNames + "&path=" + text;
            });

        },



    }
});

