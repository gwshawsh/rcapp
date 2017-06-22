//生成弹出树形空间参照
var ztreecostcategoryid;

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
            applyuser: "",
            deptid: "",
            applydate: "",
            costcategoryid: "",
            expensemoney: "",
            reason: "",
            receiver: "",
            paytype: "",
            bankaccount: "",
            makeuser: "",
            makedate: "",
            accuser: "",
            accdate: "",
            uptdate: ""
        },
        showList: true,
        showQuery: false,
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

        //创建实体类
        expense: {
            costcategoryidname: "",
            billno: "",
            applyuser: "",
            deptid: "",
            applydate: "",
            costcategoryid: "",
            expensemoney: "",
            reason: "",
            receiver: "",
            paytype: "",
            bankaccount: "",
            makeuser: "",
            makedate: "",
            accuser: "",
            accdate: "",
            uptdate: ""
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
            vm.title = "新增";
            vm.expense = {
                //参照的虚拟字段也必须先声明好,不然饿了么ui组件不能双向绑定
                costcategoryidname: "",
                billno: "*",
                applyuser: "",
                deptid: "",
                applydate: "",
                costcategoryid: "",
                expensemoney: "",
                reason: "",
                receiver: "",
                paytype: "",
                bankaccount: "",
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
            var url = vm.expense.id == null ? "../expense/save" : "../expense/update";
            $.ajax({
                type: "POST",
                url: url,
                data: JSON.stringify(vm.expense),
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
                    url: "../expense/delete",
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

        //生成弹出树形空间参照

        getRefTreeaccountcategorycostcategoryid: function (menuId) {
            //加载菜单树
            $.get("../accountcategory/select", function (r) {
                ztreecostcategoryid = $.fn.zTree.init($("#refTreeaccountcategory"), setting, r.treeList);
                var node = ztreecostcategoryid.getNodeByParam("id", vm.expense.costcategoryid);
                ztreecostcategoryid.selectNode(node);
                vm.expense.costcategoryidname = node.name;

            })
        },

        openRefTreeaccountcategorycostcategoryid: function () {
            layer.open({
                type: 1,
                offset: '50px',
                skin: 'layui-layer-molv',
                title: "选择",
                area: ['300px', '450px'],
                shade: 0,
                shadeClose: false,
                content: jQuery("#treelayeraccountcategory"),
                btn: ['确定', '取消'],
                btn1: function (index) {
                    var node = ztreecostcategoryid.getSelectedNodes();
                    //选择上级菜单
                    vm.expense.costcategoryid = node[0].id;
                    vm.expense.costcategoryidname = node[0].name;

                    layer.close(index);
                }
            });
        },

        getInfo: function (id) {
            $.get("../expense/info/" + id, function (r) {
                vm.expense = r.expense;
            });
        },
        reload: function (event) {
            vm.showList = true;
            var page = $("#jqGrid").jqGrid('getGridParam', 'page');
            $("#jqGrid").jqGrid('setGridParam', {
                postData: {'query': JSON.stringify(vm.q)},
                page: page
            }).trigger("reloadGrid");
        }
    }
});

$(function () {
    $("#jqGrid").jqGrid({
        url: '../expense/list',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', width: 50, key: true, hidden: true},
            {label: '报销单号', name: 'billno', width: 80},
            {label: '申请人', name: 'applyuser', width: 80},
            {label: '部门', name: 'deptid', width: 80},
            {label: '申请日期', name: 'applydate', width: 80},
            {label: '费用项目', name: 'costcategoryidname', width: 80}, {label: '报销金额', name: 'expensemoney', width: 80},
            {label: '报销事由', name: 'reason', width: 80},
            {label: '收款人', name: 'receiver', width: 80},
            {label: '支付方式', name: 'paytype', width: 80},
            {label: '银行账户', name: 'bankaccount', width: 80},
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
    vm.getRefTreeaccountcategorycostcategoryid();


    initGridHeight();
});