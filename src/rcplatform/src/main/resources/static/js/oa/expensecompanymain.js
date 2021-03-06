//生成弹出树形空间参照
var ztreedeptid;

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
            deptid: "",
            applydate: "",
            costcategoryid: "",
            expensemoney: "",
            title: "",
            remark: "",
            receiver: "",
            paytype: "",
            bankaccount: "",
            billstatus: "",
            makeuser: "",
            makedate: "",
            accuser: "",
            accdate: "",
            uptdate: "",
            pocessinstanceid: ""
        },
        showList: true,
        showQuery: false,
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
        //创建参照
        ref_enum2008: [],
        ref_sys_user: [],

        ref_enum1014: [],
        ref_enum1003: [],

        //创建实体类
        expensecompanymain: {
            deptidname: "",
            costcategoryidenumvaluename: "",
            receiverfullname: "",
            paytypeenumvaluename: "",
            billstatusenumvaluename: "",
            billno: "",
            deptid: "",
            applydate: "",
            costcategoryid: "",
            expensemoney: "",
            title: "",
            remark: "",
            receiver: "",
            paytype: "",
            bankaccount: "",
            billstatus: "",
            makeuser: "",
            makedate: "",
            accuser: "",
            accdate: "",
            uptdate: "",
            pocessinstanceid: ""
        }
    },
    methods: {
        showQueryPanel: function () {
            vm.showQuery = !vm.showQuery;
        },
        query: function () {
            vm.reload();
        },
        add: function () {
            var mktime = moment().format("YYYY-MM-DD");
            vm.showList = false;
            vm.showDetailList = false;
            vm.title = "新增";
            vm.expensecompanymain = {
                //参照的虚拟字段也必须先声明好,不然饿了么ui组件不能双向绑定
                deptidname: "",
                costcategoryidenumvaluename: "",
                receiverfullname: "",
                paytypeenumvaluename: "",
                billstatusenumvaluename: "",
                billno: "*",
                deptid: "",
                applydate: "",
                costcategoryid: "",
                expensemoney: "",
                title: "",
                remark: "",
                receiver: "",
                paytype: "",
                bankaccount: "",
                billstatus: "",
                makeuser: gUserId,
                makedate: mktime,
                accuser: "",
                accdate: "",
                uptdate: "",
                pocessinstanceid: ""
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
            var url = vm.expensecompanymain.id == null ? "../expensecompanymain/save" : "../expensecompanymain/update";
            $.ajax({
                type: "POST",
                url: url,
                data: JSON.stringify(vm.expensecompanymain),
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
                    url: "../expensecompanymain/delete",
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
        getRef2008: function () {
            $.get("../enumtable/listone?enumid=2008&page=1&limit=1000", function (r) {
                vm.ref_enum2008 = r.page.list;
            });
        },
        getRefsys_user: function () {
            $.get("../sys_user/list?page=1&limit=1000", function (r) {
                vm.ref_sys_user = r.page.list;
            });
        },

        getRef1014: function () {
            $.get("../enumtable/listone?enumid=1014&page=1&limit=1000", function (r) {
                vm.ref_enum1014 = r.page.list;
            });
        },
        getRef1003: function () {
            $.get("../enumtable/listone?enumid=1003&page=1&limit=1000", function (r) {
                vm.ref_enum1003 = r.page.list;
            });
        },

        //生成弹出树形空间参照

        getRefTreesys_deptdeptid: function (menuId) {
            //加载菜单树
            $.get("../sys_dept/select", function (r) {
                ztreedeptid = $.fn.zTree.init($("#refTreesys_dept"), setting, r.treeList);
                var node = ztreedeptid.getNodeByParam("id", vm.expensecompanymain.deptid);
                ztreedeptid.selectNode(node);
                vm.expensecompanymain.deptidname = node.name;

            })
        },

        openRefTreesys_deptdeptid: function () {
            layer.open({
                type: 1,
                offset: '50px',
                skin: 'layui-layer-molv',
                title: "选择",
                area: ['300px', '450px'],
                shade: 0,
                shadeClose: false,
                content: jQuery("#treelayersys_dept"),
                btn: ['确定', '取消'],
                btn1: function (index) {
                    var node = ztreedeptid.getSelectedNodes();
                    //选择上级菜单
                    vm.expensecompanymain.deptid = node[0].id;
                    vm.expensecompanymain.deptidname = node[0].name;

                    layer.close(index);
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
                    url: "../expensecompanymain/submitworkflow",
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

            $.get("../expensecompanymain/info/" + id, function (r) {
                vm.expensecompanymain = r.expensecompanymain;
                vm.expensecompanymain.id = null;
                vm.expensecompanymain.billno = "*";
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
                    url: "../expensecompanymain/cancel",
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
                    url: "../expensecompanymain/claim",
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
            $.get("../expensecompanymain/info/" + id, function (r) {
                vm.expensecompanymain = r.expensecompanymain;
                showrefgrid_billcomments(function (data) {
                    if (!vm.expensecompanymain.billcommentsEntity) {
                        vm.expensecompanymain.billcommentsEntity = {};
                    }
                    vm.expensecompanymain.billcommentsEntity.billno = vm.expensecompanymain.billno;
                    vm.expensecompanymain.billcommentsEntity.refbilltype = 0;
                    vm.expensecompanymain.billcommentsEntity.remark = data.remark;
                    vm.expensecompanymain.billcommentsEntity.auditstatus = data.auditstatus;
                    $.ajax({
                        type: "POST",
                        url: "../expensecompanymain/audit",
                        data: JSON.stringify(vm.expensecompanymain),
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
                    url: "../expensecompanymain/unaudit",
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

        //查询单据明细
        queryDetail: function () {
            var row = getSelectedRowData();

            var id = row.billno;
            if (id == null) {
                return;
            }
            vm.showDetailList = true;


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

        getInfo: function (id) {
            $.get("../expensecompanymain/info/" + id, function (r) {
                vm.expensecompanymain = r.expensecompanymain;
            });
        },
        reload: function (event) {
            vm.showList = true;
            var page = $("#jqGrid").jqGrid('getGridParam', 'page');
            $("#jqGrid").jqGrid('setGridParam', {
                postData: {'query': JSON.stringify(vm.q)},
                page: page
            }).trigger("reloadGrid");
        },
        upload_on_success: function (response, file, fileList) {

            if (!vm.expensecompanymain.files) {
                vm.expensecompanymain.files = [];
            }
            if (response.page.list && response.page.list.length > 0) {
                vm.expensecompanymain.files.push(response.page.list[0]);
            }


        },

        upload_on_change: function (file, fileList) {
            this.fileslist = fileList;
        }
    }
});

$(function () {
    $("#jqGrid").jqGrid({
        url: '../expensecompanymain/list',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', width: 50, key: true, hidden: true},
            {label: '报销单号', name: 'billno', width: 80},
            {label: '部门', name: 'deptidname', width: 80}, {label: '申请日期', name: 'applydate', width: 80},
            {label: '费用项目', name: 'costcategoryidenumvaluename', width: 80}, {
                label: '报销金额',
                name: 'expensemoney',
                width: 80
            },
            {label: '报销标题', name: 'title', width: 80},
            {label: '详情', name: 'remark', width: 80},
            {label: '收款人', name: 'receiverfullname', width: 80}, {
                label: '支付方式',
                name: 'paytypeenumvaluename',
                width: 80
            }, {label: '银行账户', name: 'bankaccount', width: 80},
            {label: '单据状态', name: 'billstatus', width: 80, formatter: formater_billstatus},
            {label: '申请人', name: 'makeuserfullname', width: 80}, {label: '制单日期', name: 'makedate', width: 80},
            {label: '审核人', name: 'accuserfullname', width: 80}, {label: '审核日期', name: 'accdate', width: 80},
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

    //执行调用参照调用下拉框函数,初始化下拉数据
    vm.getRefTreesys_deptdeptid();
    vm.getRef2008();
    vm.getRefsys_user();
    vm.getRef1014();
    vm.getRef1003();

    createBillAttachmentsGrid();
    createBillCommentsGrid();

    initGridHeight();
});