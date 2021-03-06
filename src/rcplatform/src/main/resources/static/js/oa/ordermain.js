//生成弹出树形空间参照
var ztreesupplyid;

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
            supplyid: "",
            reqbillno: "",
            requser: "",
            deptid: "",
            reqdate: "",
            ordersource: "",
            ordertype: "",
            budgetmainid: "",
            total: "",
            paytotal: "",
            billstatus: "",
            remark: "",
            makeuser: "",
            makedate: "",
            accuser: "",
            accdate: "",
            uptdate: "",
            pocessinstanceid: ""
        },
        showQuery: false,
        showList: true,
        showDetailList: true,
        title: null,
        fileslist: [],
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
        ref_sys_user: [],
        ref_sys_dept: [],
        ref_enum1001: [],

        ref_enum1002: [],

        ref_enum1003: [],


        //明细表用户下拉参照的属性
        ref_goods: [],

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
            budgetmainid: "",
            total: "",
            paytotal: "",
            billstatus: "",
            remark: "",
            makeuser: gUserId,
            makedate: "",
            accuser: "",
            accdate: "",
            uptdate: "",
            pocessinstanceid: "",
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
            vm.ordermain = {
                supplyidname: "",
                requserfullname: "",
                deptidname: "",
                ordersourceenumvaluename: "",
                ordertypeenumvaluename: "",
                budgetmainidbillno: "",
                billstatusenumvaluename: "",

                billno: "*",
                supplyid: "",
                reqbillno: "",
                requser: "",
                deptid: "",
                reqdate: "",
                ordersource: "",
                ordertype: "",
                budgetmainid: "",
                total: "",
                paytotal: "",
                billstatus: "",
                remark: "",
                makeuser: gUserId,
                makedate: mktime,
                accuser: "",
                accdate: "",
                uptdate: "",
                pocessinstanceid: "",
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
        //提交到工作流
        submitworkflow: function () {
            var row = getSelectedRow();
            if (row == null) {
                return;
            }
            confirm('确定要提交选中的任务？', function () {
                $.ajax({
                    type: "POST",
                    url: "../ordermain/submitworkflow",
                    data: JSON.stringify(row),
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
        //复制单据
        copybill: function (event) {
            var id = getSelectedRow();
            if (id == null) {
                return;
            }
            vm.showList = false;
            vm.showDetailList = false;
            vm.title = "新增";
            vm.getInfo(id);

            $.get("../ordermain/info/" + id, function (r) {
                vm.ordermain = r.ordermain;
                vm.ordermain.id = null;
                vm.ordermain.billno = "*";
            });


        },
        //作废单据
        cancel: function (event) {
            var ids = getSelectedRows();
            if (ids == null) {
                return;
            }
            confirm('确定要作废选中的单据？', function () {
                $.ajax({
                    type: "POST",
                    url: "../ordermain/cancel",
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
        //签收任务
        claim: function (event) {
            var ids = getSelectedRows();
            if (ids == null) {
                return;
            }

            confirm('确定要签收选中的任务？', function () {
                $.ajax({
                    type: "POST",
                    url: "../ordermain/claim",
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

        audit: function (event) {
            var id = getSelectedRow();
            if (id == null) {
                return;
            }
            $.get("../ordermain/info/" + id, function (r) {
                vm.ordermain = r.ordermain;
                showrefgrid_billcomments(function (data) {
                    if (!vm.ordermain.billcommentsEntity) {
                        vm.ordermain.billcommentsEntity = {};
                    }
                    vm.ordermain.billcommentsEntity.billno = vm.ordermain.billno;
                    vm.ordermain.billcommentsEntity.refbilltype = 0;
                    vm.ordermain.billcommentsEntity.remark = data.remark;
                    vm.ordermain.billcommentsEntity.auditstatus = data.auditstatus;
                    $.ajax({
                        type: "POST",
                        url: "../ordermain/audit",
                        data: JSON.stringify(vm.ordermain),
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
        selectbudgetmainidbudgetmain: function (event) {
            showrefgrid_budgetmain("参照", function (data) {
                var seldata = data;
                vm.ordermain.budgetmainid = seldata['id'];
                vm.ordermain.budgetmainidbudgetmainbillno = seldata['name'];
            });
        },

        //生成主表参照调用下拉框函数,用来初始化远程数据
        getRefsys_user: function () {
            $.get("../sys_user/list?page=1&limit=1000", function (r) {
                vm.ref_sys_user = r.page.list;
            });
        },
        getRefsys_dept: function () {
            $.get("../sys_dept/list?page=1&limit=1000", function (r) {
                vm.ref_sys_dept = r.page.list;
            });
        },
        getRef1001: function () {
            $.get("../enumtable/listone?enumid=1001&page=1&limit=1000", function (r) {
                vm.ref_enum1001 = r.page.list;
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

        getRefTreeorganizationsupplyid: function (menuId) {
            //加载菜单树
            $.get("../organization/select", function (r) {
                ztreesupplyid = $.fn.zTree.init($("#refTreeorganization"), setting, r.treeList);
                var node = ztreesupplyid.getNodeByParam("id", vm.ordermain.supplyid);
                ztreesupplyid.selectNode(node);
                vm.ordermain.supplyidname = node.name;

            })
        },

        openRefTreeorganizationsupplyid: function () {
            layer.open({
                type: 1,
                offset: '50px',
                skin: 'layui-layer-molv',
                title: "选择",
                area: ['300px', '450px'],
                shade: 0,
                shadeClose: false,
                content: jQuery("#treelayerorganization"),
                btn: ['确定', '取消'],
                btn1: function (index) {
                    var node = ztreesupplyid.getSelectedNodes();
                    //选择上级菜单
                    vm.ordermain.supplyid = node[0].id;
                    vm.ordermain.supplyidname = node[0].name;

                    layer.close(index);
                }
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
                postData: {'query': JSON.stringify(vm.q)},
                page: page
            }).trigger("reloadGrid");
        },


        //单据明细的相关操作

        //查询单据明细
        queryDetail: function () {
            var row = getSelectedRowData();

            var id = row.billno;
            if (id == null) {
                return;
            }
            vm.showDetailList = true;

            //查询单据明细
            $("#jqGridDetail").jqGrid('setGridParam', {
                page: 1,
                postData: {'billno': id},
                datatype: "json"
            }).trigger("reloadGrid");

            //查询单据审批明细
            $("#jqGridComments").jqGrid('setGridParam', {
                page: 1,
                postData: {'billno': id},
                datatype: "json"
            }).trigger("reloadGrid");

            //查询单据审批明细
            $("#jqGridFiles").jqGrid('setGridParam', {
                page: 1,
                postData: {'billno': id},
                datatype: "json"
            }).trigger("reloadGrid");

        },

        //增加明细表一条记录
        additem: function () {
            var mktime = moment().format("YYYY-MM-DD");
            var idx = vm.ordermain.details.length;
            var item = {
                id: "",
                billno: "*",
                serialno: idx,
                goodsid: "",
                goodscount: "",
                goodsspec: "",
                goodsuse: "",
                goodsprice: "",
                goodscost: "",
                enddate: mktime,
                uptdate: mktime,
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
        },
        upload_on_success: function (response, file, fileList) {

            if (!vm.ordermain.files) {
                vm.ordermain.files = [];
            }
            if (response.page.list && response.page.list.length > 0) {
                vm.ordermain.files.push(response.page.list[0]);
            }


        },

        upload_on_change: function (file, fileList) {
            this.fileslist = fileList;
        }

    }
});

$(function () {
    $("#jqGrid").jqGrid({
        url: '../ordermain/list',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', width: 50, key: true, hidden: true},
            {label: '单据号', name: 'billno', width: 80}, {label: '供应商', name: 'supplyid', width: 80}, {
                label: '请购单据号',
                name: 'reqbillno',
                width: 80
            }, {label: '请购人', name: 'requserfullname', width: 80}, {
                label: '请购部门',
                name: 'deptidname',
                width: 80
            }, {label: '请购日期', name: 'reqdate', width: 80}, {
                label: '订购单来源',
                name: 'ordersourceenumvaluename',
                width: 80
            }, {label: '订购类别', name: 'ordertypeenumvaluename', width: 80}, {
                label: '预算计划',
                name: 'budgetmainid',
                width: 80
            }, {label: '总金额', name: 'total', width: 80}, {label: '已支付金额', name: 'paytotal', width: 80}, {
                label: '单据状态',
                name: 'billstatus',
                width: 80,
                formatter: formater_billstatus
            },
            {label: '备注', name: 'remark', width: 80}, {
                label: '制单人',
                name: 'makeuserfullname',
                width: 80
            }, {label: '制单日期', name: 'makedate', width: 80}, {
                label: '审核人',
                name: 'accuserfullname',
                width: 80
            }, {label: '审核日期', name: 'accdate', width: 80}, {label: '更新时间', name: 'uptdate', width: 80},],
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
        url: '../ordermain/listdetail',
        datatype: "local",
        colModel: [
            {label: 'id', name: 'id', width: 50, key: true, hidden: true},
            {label: '序号', name: 'serialno', width: 80},
            {label: '项目', name: 'goodsidname', width: 80}, {label: '数量', name: 'goodscount', width: 80},
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
    vm.getRefTreeorganizationsupplyid();
    vm.getRefsys_user();
    vm.getRefsys_dept();
    vm.getRef1001();
    vm.getRef1002();
    vm.getRef1003();


    //执行调用参照调用下拉框函数,初始化下拉数据
    vm.getRefgoods();

    createBillAttachmentsGrid();
    createBillCommentsGrid();

    initGridHeightHalf("#jqGrid");
    initGridHeightHalf("#jqGridDetail");
});