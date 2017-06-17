var vm = new Vue({
    el: '#rrapp',
    data: {
        showList: true,
        title: null,
        //用于日期快捷控件
        pickerOptions1: {
            shortcuts: [{
                text: '今天',
                onClick(picker) {
                    picker.$emit('pick', new Date());
                }
            }, {
                text: '昨天',
                onClick(picker) {
                    const date = new Date();
                    date.setTime(date.getTime() - 3600 * 1000 * 24);
                    picker.$emit('pick', date);
                }
            }, {
                text: '一周前',
                onClick(picker) {
                    const date = new Date();
                    date.setTime(date.getTime() - 3600 * 1000 * 24 * 7);
                    picker.$emit('pick', date);
                }
            }]
        },
        //创建参照
        ref_transteam: [],

        ref_enum2005: [],

        //创建实体类
        drivers: {
            code: "", name: "", phone: "", transteam: "", documentno: "", driveage: "", type: ""
        }
    },
    methods: {
        query: function () {
            vm.reload();
        },
        add: function () {
            var mktime = moment().format("YYYY-MM-DD");
            vm.showList = false;
            vm.title = "新增";
            vm.drivers = {
                code: "", name: "", phone: "", transteam: "", documentno: "", driveage: "", type: ""
            };
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
            var url = vm.drivers.id == null ? "../drivers/save" : "../drivers/update";
            $.ajax({
                type: "POST",
                url: url,
                data: JSON.stringify(vm.drivers),
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
                    url: "../drivers/delete",
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

        //生成参照调用弹出框函数

        //生成参照调用下拉框函数,用来初始化远程数据
        getReftransteam: function () {
            $.get("../transteam/list?page=1&limit=1000", function (r) {
                vm.ref_transteam = r.page.list;
            });
        },

        getRef2005: function () {
            $.get("../enumtable/listone?enumid=2005&page=1&limit=1000", function (r) {
                vm.ref_enum2005 = r.page.list;
            });
        },


        getInfo: function (id) {
            $.get("../drivers/info/" + id, function (r) {
                vm.drivers = r.drivers;
            });
        },
        reload: function (event) {
            vm.showList = true;
            var page = $("#jqGrid").jqGrid('getGridParam', 'page');
            $("#jqGrid").jqGrid('setGridParam', {
                page: page
            }).trigger("reloadGrid");
        },
    }
});

$(function () {
    $("#jqGrid").jqGrid({
        url: '../drivers/list',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', width: 50, key: true},
            {label: '编码', name: 'code', width: 80},
            {label: '姓名', name: 'name', width: 80},
            {label: '电话', name: 'phone', width: 80},
            {label: '所属车队', name: 'transteam', width: 80},
            {label: '证件号', name: 'documentno', width: 80},
            {label: '驾龄', name: 'driveage', width: 80},
            {label: '类型', name: 'type', width: 80}
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

    //执行调用参照调用下拉框函数,初始化下拉数据
    vm.getReftransteam();


    initGridHeight();
});