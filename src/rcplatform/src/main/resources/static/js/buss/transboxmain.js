var vm = new Vue({
    el: '#rrapp',
    data: {
        showList: true,
        showDetailList: true,
        title: null,
        transboxmain: {}
    },
    methods: {
        query: function () {
            vm.reload();
        },
        add: function () {
            vm.showList = false;
            vm.title = "新增";
            vm.transboxmain = {};
        },
        update: function (event) {
            var id = getSelectedRow();
            if (id == null) {
                return;
            }
            vm.showList = false;
            vm.showDetailList = false;
            vm.title = "修改";

            vm.getInfo(id)
        },
        saveOrUpdate: function (event) {
            var url = vm.transboxmain.id == null ? "../transboxmain/save" : "../transboxmain/update";
            $.ajax({
                type: "POST",
                url: url,
                data: JSON.stringify(vm.transboxmain),
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
                    url: "../transboxmain/delete",
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
        //单据明细的相关操作
        queryDetail: function () {
            var id = getSelectedRow();
            if (id == null) {
                return;
            }
            vm.showDetailList = true;

            $("#jqGridDetail").jqGrid('setGridParam', {
                page: 1,
                postData: {'formid': id},
                datatype: "json"
            }).trigger("reloadGrid");
        },
        getInfo: function (id) {
            $.get("../transboxmain/info/" + id, function (r) {
                vm.transboxmain = r.transboxmain;
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
        url: '../transboxmain/list',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', width: 50, key: true,hidden:true},
            {label: '单据号', name: 'billno', width: 80},
            {label: '放箱计划单据号', name: 'reftakebillno', width: 80},
            {label: '要箱计划单据号', name: 'refbillno', width: 80},
            {label: '要箱计划类型', name: 'refbilltype', width: 80,formater:formater_billtype},
            {label: '客户', name: 'orgname', width: 80},
            {label: '提单号', name: 'ladingcode', width: 80},
            {label: '船名', name: 'shipname', width: 80},
            {label: '航次', name: 'flight', width: 80},
            {label: '港口', name: 'portname', width: 80},
            {label: '箱量', name: 'boxqty', width: 80},
            {label: '箱型', name: 'boxtype', width: 80},
            {label: '提箱场站', name: 'takeboxplacename', width: 80},
            {label: '运输公司', name: 'transcompanyname', width: 80},
            {label: '集港时间', name: 'bgnshipdate', width: 80},
            {label: '截港时间', name: 'endshipdate', width: 80},
            {label: '最早到场时间', name: 'bgnplanarrtime', width: 80},
            {label: '最晚到场时间', name: 'endplanarrtime', width: 80},
            {label: '备注', name: 'remark', width: 80},
            {label: '单据状态', name: 'billstatus', width: 80,formater:formater_billstatus},
            {label: '制单人', name: 'makeuser', width: 80},
            {label: '制单日期', name: 'makedate', width: 80},
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

    $("#jqGridDetail").jqGrid({
        url: '../transboxmain/listdetail',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', width: 50, key: true, hidden: true},
            {label: '单据号', name: 'billno', width: 80, hidden: true},
            {label: '序号', name: 'serialno', width: 80},
            {label: '原起运地点', name: 'startplaceid1', width: 80},
            {label: '现起运点', name: 'startplaceid2', width: 80},
            {label: '目的地', name: 'endplaceid', width: 80},
            {label: '箱号', name: 'boxno', width: 80},
            {label: '计划提箱时间', name: 'plantaketime', width: 80},
            {label: '实际提箱时间', name: 'realtaketime', width: 80},
            {label: '计划到场时间', name: 'planarrvetime', width: 80},
            {label: '实际到场时间', name: 'realarrvetime', width: 80},
            {label: '应收费用', name: 'yingshou', width: 80},
            {label: '应付费用', name: 'yingfu', width: 80}
        ],
        viewrecords: true,
        height: 385,
        rowNum: 100,
        rowList: [10, 30, 50],
        rownumbers: true,
        rownumWidth: 25,
        autowidth: true,
        autoScroll: true,
        multiselect: true,
        pager: "#jqGridPagerDetail",
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