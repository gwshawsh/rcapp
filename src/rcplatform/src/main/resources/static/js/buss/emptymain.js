var vm = new Vue({
    el: '#rrapp',
    data: {
        showList: true,
        title: null,
        emptymain: {}
    },
    methods: {
        query: function () {
            vm.reload();
        },
        add: function () {
            vm.showList = false;
            vm.title = "新增";
            vm.emptymain = {};
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
            var url = vm.emptymain.id == null ? "../emptymain/save" : "../emptymain/update";
            $.ajax({
                type: "POST",
                url: url,
                data: JSON.stringify(vm.emptymain),
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
                    url: "../emptymain/delete",
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
            var rowdata=getSelectedRowData();
            if(rowdata!=null){
                vm.emptymain=rowdata;
            }
            //$.get("../emptymain/info/" + id, function (r) {
            //    vm.emptymain = r.emptymain;
            //});
        },
        reload: function (event) {
            vm.showList = true;
            var page = $("#jqGrid").jqGrid('getGridParam', 'page');
            $("#jqGrid").jqGrid('setGridParam', {
                page: page
            }).trigger("reloadGrid");
        },
        //放箱
        takebox:function(){
            vm.getInfo();
            showrefgrid_place("选择提箱场站",function(data){
                var seldata=data;
                vm.emptymain.takeboxplaceid=seldata['id'];
                vm.saveOrUpdate();
            })
        },
        accbill:function(){
            var ids = getSelectedRows();
            if (ids == null) {
                return;
            }

            confirm('确定要审核选中的记录？', function () {
                $.ajax({
                    type: "POST",
                    url: "../emptymain/audit",
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
        }
    }
});

$(function () {
    $("#jqGrid").jqGrid({
        url: '../emptymain/list',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', width: 50, key: true,hidden:true},
            {label: '单据号', name: 'billno', width: 80},
            {label: '客户', name: 'orgname', width: 80,hidden:true},
            {label: '提单号', name: 'ladingcode', width: 80},
            {label: '船名', name: 'shipname', width: 80},
            {label: '航次', name: 'flight', width: 80},
            {label: '港口', name: 'portid', width: 80},
            {label: '箱量', name: 'boxqty', width: 80},
            {label: '箱型', name: 'boxtype', width: 80},
            {label: '状态', name: 'billstatus', width: 80,formatter: formater_billstatus},
            {label: '提箱场站', name: 'takeboxplacename', width: 80},
            {label: '目的地', name: 'endplacename', width: 80},
            {label: '集港时间', name: 'bgnshipdate', width: 80},
            {label: '截港时间', name: 'endshipdate', width: 80},
            {label: '最早到场时间', name: 'bgnplanarrtime', width: 80},
            {label: '最晚到场时间', name: 'endplanarrtime', width: 80},
            {label: '备注', name: 'remark', width: 80},

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

    initGridHeight();
});