var vm = new Vue({
    el: '#rrapp',
    data: {
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
        ref_dept: [],
        ref_enum1001: [],

        ref_enum1002: [],

        ref_enum1003: [],


        //单据主表实体类
        ordermain: {
            billno: "*",
            supplyid: "",
            reqbillno: "",
            requser: "",
            deptid: "",
            reqdate: "",
            ordersource: "",
            ordertype: "",
            billstatus: "",
            makeuser: "",
            makedate: "", accuser: "",
            accdate: "",
            uptdate: "",
            details: []

        }
    },
    methods: {
        query: function () {
            vm.reload();
        },
        showdetail: function () {
           vm.showDetailList=!vm.showDetailList;
           if(vm.showDetailList){
               initGridHeightHalf("#jqGrid");
               initGridHeightHalf("#jqGridDetail");
           }
           else{
               initGridHeight("#jqGrid");
           }
        },
        add: function () {
            var mktime = moment().format("YYYY-MM-DD");
            vm.showList = false;
            vm.showDetailList = false;
            vm.title = "新增";
            vm.ordermain = {
                billno: "*",
                supplyid: "",
                reqbillno: "",
                requser: "",
                deptid: "",
                reqdate: "",
                ordersource: "",
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
            var url = vm.ordermain.id == null ? "../ordermain/save" : "../ordermain/update";
            $.ajax({
                type: "POST",
                url: url,
                data: JSON.stringify(vm.ordermain),
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

            confirm('确定要删除选中的记录？', function () {
                $.ajax({
                    type: "POST",
                    url: "../ordermain/audit",
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

            confirm('确定要删除选中的记录？', function () {
                $.ajax({
                    type: "POST",
                    url: "../ordermain/unaudit",
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
                    url: "../ordermain/delete",
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

        //生成参照调用下拉框函数,用来初始化远程数据
        getRefdept: function () {
            $.get("../dept/list?page=1&limit=1000", function (r) {
                vm.ref_dept = r.page.list;
            });
        },
        getRefEnum1001: function () {
            $.get("../enumtable/listone?enumid=1001&page=1&limit=1000", function (r) {
                vm.ref_enum1001 = r.page.list;
            });
        },
        getRefEnum1002: function () {
            $.get("../enumtable/listone?enumid=1002&page=1&limit=1000", function (r) {
                vm.ref_enum1002 = r.page.list;
            });
        },
        getRefEnum1003: function () {
            $.get("../enumtable/listone?enumid=1003&page=1&limit=1000", function (r) {
                vm.ref_enum1003 = r.page.list;
            });
        },

        getInfo: function (id) {
            $.get("../ordermain/info/" + id, function (r) {
                vm.ordermain = r.ordermain;
            });
        },
        reload: function (event) {
            vm.showList = true;
            vm.showDetailList = true;
            var page = $("#jqGrid").jqGrid('getGridParam', 'page');
            $("#jqGrid").jqGrid('setGridParam', {
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
            var idx = vm.ordermain.details.length;
            var item = {

                billno: "*",
                serialno: idx,
                goodsid: "",
                goodsname: "",
                goodscount: "",
                goodsspec: "",
                goodsuse: "",
                goodsprice: "",
                goodscost: "",
                enddate: mktime,
                uptdate: mktime
            };


            vm.ordermain.details.push(item);
        },

        selectitem: function (index) {
            var sel = index;
            var item = vm.ordermain.details[sel];
        },
        delitem: function (event) {
            var obj = event.currentTarget;
            var index = obj.attributes['idx'].value
            vm.ordermain.details.splice(index, 1);
            for (var i = 0; i < vm.ordermain.details.length; i++) {
                vm.ordermain.details[i].serialno = i;
            }
        }
    }
});

$(function () {
    $("#jqGrid").jqGrid({
        url: '../ordermain/list',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', width: 50, key: true},
            {label: '单据号', name: 'billno', width: 80},
            {label: '供应商id', name: 'supplyid', width: 80},
            {label: '请购单据号', name: 'reqbillno', width: 80},
            {label: '请购人', name: 'requser', width: 80},
            {label: '请购部门', name: 'deptid', width: 80},
            {label: '请购日期', name: 'reqdate', width: 80},
            {label: '订购单来源', name: 'ordersource', width: 80},
            {label: '订购类别', name: 'ordertype', width: 80},
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


    $("#jqGridDetail").jqGrid({
        url: '../ordermain/listdetail',
        datatype: "local",
        colModel: [
            {label: 'id', name: 'id', width: 50, key: true},
            {label: '单据号', name: 'billno', width: 80},
            {label: '序号', name: 'serialno', width: 80},
            {label: '商品', name: 'goodsid', width: 80},
            {label: '品名', name: 'goodsname', width: 80},
            {label: '数量', name: 'goodscount', width: 80},
            {label: '规格', name: 'goodsspec', width: 80},
            {label: '用途', name: 'goodsuse', width: 80},
            {label: '单价', name: 'goodsprice', width: 80},
            {label: '金额', name: 'goodscost', width: 80},
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
    vm.getRefdept();
    vm.getRefEnum1001();
    vm.getRefEnum1002();
    vm.getRefEnum1003();

    initGridHeightHalf("#jqGrid");
    initGridHeightHalf("#jqGridDetail");
});