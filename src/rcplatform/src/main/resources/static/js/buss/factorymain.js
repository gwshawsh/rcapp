//生成弹出树形空间参照

var setting = {
    data: {
        simpleData: {
            enable: true,
            idKey: "id",
            pIdKey: "parentId",
            rootPId: -1
        },
        key: {
            url: "nourl"
        }
    }
};

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
        ref_boxs: [],

        ref_enum1003: [],

        //创建实体类
        factorymain: {
            orgidname: "",
            portidname: "",
            boxtypeboxsize: "",
            billstatusenumvaluename: "",
            billno: "",
            orgid: "",
            ladingcode: "",
            shipname: "",
            flight: "",
            portid: "",
            boxqty: "",
            boxtype: "",
            takeboxplaceid: "",
            endplaceid: "",
            backplaceid: "",
            bgnshipdatetime: "",
            endshipdatetime: "",
            bgnplanarrtime: "",
            endplanarrtime: "",
            remark: "",
            billstatus: "",
            makeuser: "",
            makedate: "",
            accuser: "",
            accdate: "",
            uptdate: ""
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
            vm.factorymain = {
                //参照的虚拟字段也必须先声明好,不然饿了么ui组件不能双向绑定
                orgidname: "",
                portidname: "",
                boxtypeboxsize: "",
                billstatusenumvaluename: "",
                billno: "*",
                orgid: "",
                ladingcode: "",
                shipname: "",
                flight: "",
                portid: "",
                boxqty: "",
                boxtype: "",
                takeboxplaceid: "",
                endplaceid: "",
                backplaceid: "",
                bgnshipdatetime: "",
                endshipdatetime: "",
                bgnplanarrtime: "",
                endplanarrtime: "",
                remark: "",
                billstatus: "",
                makeuser: gUserName,
                makedate: mktime,
                accuser: "",
                accdate: "",
                uptdate: ""
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
            var url = vm.factorymain.id == null ? "../factorymain/save" : "../factorymain/update";
            $.ajax({
                type: "POST",
                url: url,
                data: JSON.stringify(vm.factorymain),
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
                    url: "../factorymain/delete",
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
        selectorgidorganization: function (event) {
            showrefgrid_organization("参照", function (data) {
                var seldata = data;
                vm.factorymain.orgid = seldata['id'];
                vm.factorymain.orgidorganizationname = seldata['name'];
            });
        },
        selectportidplace: function (event) {
            showrefgrid_place("参照", function (data) {
                var seldata = data;
                vm.factorymain.portid = seldata['id'];
                vm.factorymain.portidplacename = seldata['name'];
            });
        },
        selecttakeboxplaceidplace: function (event) {
            showrefgrid_place("参照", function (data) {
                var seldata = data;
                vm.factorymain.takeboxplaceid = seldata['id'];
                vm.factorymain.takeboxplaceidplacename = seldata['name'];
            });
        },
        selectendplaceidplace: function (event) {
            showrefgrid_place("参照", function (data) {
                var seldata = data;
                vm.factorymain.endplaceid = seldata['id'];
                vm.factorymain.endplaceidplacename = seldata['name'];
            });
        },
        selectbackplaceidplace: function (event) {
            showrefgrid_place("参照", function (data) {
                var seldata = data;
                vm.factorymain.backplaceid = seldata['id'];
                vm.factorymain.backplaceidplacename = seldata['name'];
            });
        },

        //生成参照调用下拉框函数,用来初始化远程数据
        getRefboxs: function () {
            $.get("../boxs/list?page=1&limit=1000", function (r) {
                vm.ref_boxs = r.page.list;
            });
        },

        getRef1003: function () {
            $.get("../enumtable/listone?enumid=1003&page=1&limit=1000", function (r) {
                vm.ref_enum1003 = r.page.list;
            });
        },

        //生成弹出树形空间参照


        getInfo: function (id) {
            $.get("../factorymain/info/" + id, function (r) {
                vm.factorymain = r.factorymain;
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
        url: '../factorymain/list',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', width: 50, key: true},
            {label: '单据号', name: 'billno', width: 80},
            {label: '客户id', name: 'orgidname', width: 80}, {label: '提单号', name: 'ladingcode', width: 80},
            {label: '船名', name: 'shipname', width: 80},
            {label: '航次', name: 'flight', width: 80},
            {label: '港口', name: 'portidname', width: 80}, {label: '箱量', name: 'boxqty', width: 80},
            {label: '箱型', name: 'boxtypeboxsize', width: 80}, {
                label: '提箱场站',
                name: 'takeboxplaceidname',
                width: 80
            }, {label: '装卸地', name: 'endplaceidname', width: 80}, {
                label: '返回地',
                name: 'backplaceidname',
                width: 80
            }, {label: '集港时间', name: 'bgnshipdatetime', width: 80},
            {label: '截港时间', name: 'endshipdatetime', width: 80},
            {label: '最早到场时间', name: 'bgnplanarrtime', width: 80},
            {label: '最晚到场时间', name: 'endplanarrtime', width: 80},
            {label: '备注', name: 'remark', width: 80},
            {label: '单据状态', name: 'billstatus', width: 80, formatter: formater_billstatus},
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

    //执行调用参照调用下拉框函数,初始化下拉数据
    vm.getRefboxs();
    vm.getRef1003();


    initGridHeight();
});