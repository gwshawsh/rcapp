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
        q: {
            billno: "",
            reqbillno: "",
            requser: "",
            deptid: "",
            reqdate: "",
            orderbillno: "",
            percent: "",
            paytotal: "",
            paysource: "",
            payee: "",
            payeeaccount: "",
            paytype: "",
            payreason: "",
            ordertype: "",
            billstatus: "",
            makeuser: "",
            makedate: "",
            accuser: "",
            accdate: "",
            uptdate: ""
        },
        showQuery: false,
        showList: true,
        showDetailList: true,
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

        //用户下拉参照的属性
        ref_sys_dept: [],
        ref_enum1004: [],

        ref_paytype: [],
        ref_enum1002: [],

        ref_enum1003: [],


        //明细表用户下拉参照的属性
        ref_goods: [],

        //单据主表实体类
        paymentmain: {
            billno: "*",
            reqbillno: "",
            requser: "",
            deptid: "",
            reqdate: "",
            orderbillno: "",
            percent: "",
            paytotal: "",
            paysource: "",
            payee: "",
            payeeaccount: "",
            paytype: "",
            payreason: "",
            ordertype: "",
            billstatus: "",
            makeuser: gUserName,
            makedate: "",
            accuser: "",
            accdate: "",
            uptdate: "",
            details: []

        }
    },
    methods: {
        showQueryPanel: function () {
            vm.showQuery = !vm.showQuery;
        },
        query: function () {
            vm.reload();
        },
        showdetail: function () {
            vm.showDetailList = !vm.showDetailList;
            if (vm.showDetailList) {
                initGridHeightHalf("#jqGrid");
                initGridHeightHalf("#jqGridDetail");
            }
            else {
                initGridHeight("#jqGrid");
            }
        },
        add: function () {
            var mktime = moment().format("YYYY-MM-DD");
            vm.showList = false;
            vm.showDetailList = false;
            vm.title = "新增";
            vm.paymentmain = {
                deptidname: "",
                paysourceenumvaluename: "",
                payeeaccountaccountno: "",
                paytypename: "",
                ordertypeenumvaluename: "",
                billstatusenumvaluename: "",

                billno: "*",
                reqbillno: "",
                requser: "",
                deptid: "",
                reqdate: "",
                orderbillno: "",
                percent: "",
                paytotal: "",
                paysource: "",
                payee: "",
                payeeaccount: "",
                paytype: "",
                payreason: "",
                ordertype: "",
                billstatus: "",
                makeuser: gUserName,
                makedate: mktime,
                accuser: "",
                accdate: "",
                uptdate: "",
                details: []
            };
            vm.additem();
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
            var url = vm.paymentmain.id == null ? "../paymentmain/save" : "../paymentmain/update";
            $.ajax({
                type: "POST",
                url: url,
                data: JSON.stringify(vm.paymentmain),
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
        audit: function (event) {
            var ids = getSelectedRows();
            if (ids == null) {
                return;
            }

            confirm('确定要审核选中的记录？', function () {
                $.ajax({
                    type: "POST",
                    url: "../paymentmain/audit",
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

        unaudit: function () {
            var ids = getSelectedRows();
            if (ids == null) {
                return;
            }

            confirm('确定要反审核选中的记录？', function () {
                $.ajax({
                    type: "POST",
                    url: "../paymentmain/unaudit",
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

        del: function (event) {
            var ids = getSelectedRows();
            if (ids == null) {
                return;
            }

            confirm('确定要删除选中的记录？', function () {
                $.ajax({
                    type: "POST",
                    url: "../paymentmain/delete",
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

        //生成参照调用函数
        selectpayeeaccountbankaccount: function (event) {
            showrefgrid_bankaccount("参照", function (data) {
                var seldata = data;
                vm.paymentmain.payeeaccount = seldata['id'];
                vm.paymentmain.payeeaccountbankaccountaccountno = seldata['name'];
            });
        },

        //生成主表参照调用下拉框函数,用来初始化远程数据
        getRefsys_dept: function () {
            $.get("../sys_dept/list?page=1&limit=1000", function (r) {
                vm.ref_sys_dept = r.page.list;
            });
        },
        getRef1004: function () {
            $.get("../enumtable/listone?enumid=1004&page=1&limit=1000", function (r) {
                vm.ref_enum1004 = r.page.list;
            });
        },
        getRefpaytype: function () {
            $.get("../paytype/list?page=1&limit=1000", function (r) {
                vm.ref_paytype = r.page.list;
            });
        },
        getRef1002: function () {
            $.get("../enumtable/listone?enumid=1002&page=1&limit=1000", function (r) {
                vm.ref_enum1002 = r.page.list;
            });
        },
        getRef1003: function () {
            $.get("../enumtable/listone?enumid=1003&page=1&limit=1000", function (r) {
                vm.ref_enum1003 = r.page.list;
            });
        },

        //生成明细表参照调用下拉框函数,用来初始化远程数据
        getRefgoods: function () {
            $.get("../goods/list?page=1&limit=1000", function (r) {
                vm.ref_goods = r.page.list;
            });
        },

        //生成弹出树形空间参照

        getInfo: function (id) {
            $.get("../paymentmain/info/" + id, function (r) {
                vm.paymentmain = r.paymentmain;
            });
        },
        reload: function (event) {
            vm.showList = true;
            vm.showDetailList = true;
            var page = $("#jqGrid").jqGrid('getGridParam', 'page');
            $("#jqGrid").jqGrid('setGridParam', {
                postData: {'query': JSON.stringify(vm.q)},
                page: page
            }).trigger("reloadGrid");
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

        //增加明细表一条记录
        additem: function () {
            var mktime = moment().format("YYYY-MM-DD");
            var idx = vm.paymentmain.details.length;
            var item = {
                id: "",
                billno: "*",
                serialno: idx,
                goodsid: "",
                goodscount: "",
                goodsprice: "",
                goodscost: "",
                goodsspec: "",
                goodsuse: "",
                enddate: mktime,
                uptdate: mktime,
            };


            vm.paymentmain.details.push(item);
        },

        selectitem: function (index) {
            var sel = index;
            var item = vm.paymentmain.details[sel];
        },
        delitem: function (event) {
            var obj = event.currentTarget;
            var index = obj.attributes['idx'].value
            vm.paymentmain.details.splice(index, 1);
            for (var i = 0; i < vm.paymentmain.details.length; i++) {
                vm.paymentmain.details[i].serialno = i;
            }
        }
    }
});

$(function () {
    $("#jqGrid").jqGrid({
        url: '../paymentmain/list',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', width: 50, key: true, hidden: true},
            {label: '单据号', name: 'billno', width: 80},
            {label: '请购单据号', name: 'reqbillno', width: 80},
            {label: '请购人', name: 'requser', width: 80},
            {label: '请购部门', name: 'deptidname', width: 80}, {label: '请购日期', name: 'reqdate', width: 80},
            {label: '订购单据号', name: 'orderbillno', width: 80},
            {label: '付款比例', name: 'percent', width: 80},
            {label: '付款金额', name: 'paytotal', width: 80},
            {label: '付款来源', name: 'paysourceenumvaluename', width: 80}, {label: '收款人', name: 'payee', width: 80},
            {label: '收款人账号', name: 'payeeaccount', width: 80},
            {label: '付款方式', name: 'paytypename', width: 80}, {label: '说明', name: 'payreason', width: 80},
            {label: '物品类别', name: 'ordertypeenumvaluename', width: 80}, {
                label: '单据状态',
                name: 'billstatus',
                width: 80,
                formatter: formater_billstatus
            },
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
        onSelectRow: function () {
            vm.queryDetail();
        },
        gridComplete: function () {
            //隐藏grid底部滚动条
            //$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });
        }
    });


    $("#jqGridDetail").jqGrid({
        url: '../paymentmain/listdetail',
        datatype: "local",
        colModel: [
            {label: 'id', name: 'id', width: 50, key: true, hidden: true},
            {label: '序号', name: 'serialno', width: 80},
            {label: '商品', name: 'goodsidname', width: 80}, {label: '数量', name: 'goodscount', width: 80},
            {label: '单价', name: 'goodsprice', width: 80},
            {label: '金额', name: 'goodscost', width: 80},
            {label: '规格', name: 'goodsspec', width: 80},
            {label: '用途', name: 'goodsuse', width: 80},
            {label: '需用日期', name: 'enddate', width: 80},
            {label: '更新时间', name: 'uptdate', width: 80},
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

    //执行调用参照调用下拉框函数,初始化下拉数据
    vm.getRefsys_dept();
    vm.getRef1004();
    vm.getRefpaytype();
    vm.getRef1002();
    vm.getRef1003();


    //执行调用参照调用下拉框函数,初始化下拉数据
    vm.getRefgoods();


    initGridHeightHalf("#jqGrid");
    initGridHeightHalf("#jqGridDetail");
});