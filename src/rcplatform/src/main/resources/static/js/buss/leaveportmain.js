//生成弹出树形空间参照
var ztreeorgid;

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
            orgid: "",
            ladingcode: "",
            shipname: "",
            flight: "",
            portid: "",
            shipcompany: "",
            boxqty: "",
            boxtype: "",
            takeboxplaceid: "",
            endplaceid: "",
            planarrporttime: "",
            planarrtime: "",
            remark: "",
            billstatus: "",
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
        ref_place: [],

        ref_organization: [],

        ref_boxs: [],

        ref_enum1003: [],

        //创建实体类
        leaveportmain: {
            orgidname: "",
            portidname: "",
            shipcompanyname: "",
            boxtypeboxsize: "",
            billstatusenumvaluename: "",
            billno: "",
            orgid: "",
            ladingcode: "",
            shipname: "",
            flight: "",
            portid: "",
            shipcompany: "",
            boxqty: "",
            boxtype: "",
            takeboxplaceid: "",
            endplaceid: "",
            planarrporttime: "",
            planarrtime: "",
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
            vm.leaveportmain = {
                //参照的虚拟字段也必须先声明好,不然饿了么ui组件不能双向绑定
                orgidname: "",
                portidname: "",
                shipcompanyname: "",
                boxtypeboxsize: "",
                billstatusenumvaluename: "",
                billno: "*",
                orgid: "",
                ladingcode: "",
                shipname: "",
                flight: "",
                portid: "",
                shipcompany: "",
                boxqty: "",
                boxtype: "",
                takeboxplaceid: "",
                endplaceid: "",
                planarrporttime: "",
                planarrtime: "",
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
            var url = vm.leaveportmain.id == null ? "../leaveportmain/save" : "../leaveportmain/update";
            $.ajax({
                type: "POST",
                url: url,
                data: JSON.stringify(vm.leaveportmain),
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
                    url: "../leaveportmain/delete",
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
        getRefplace: function () {
            $.get("../place/list?page=1&limit=1000", function (r) {
                vm.ref_place = r.page.list;
            });
        },

        getReforganization: function () {
            $.get("../organization/list?page=1&limit=1000", function (r) {
                vm.ref_organization = r.page.list;
            });
        },

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

        getRefTreeorganizationorgid: function (menuId) {
            //加载菜单树
            $.get("../organization/select", function (r) {
                ztreeorgid = $.fn.zTree.init($("#refTreeorganization"), setting, r.treeList);
                var node = ztreeorgid.getNodeByParam("id", vm.leaveportmain.orgid);
                ztreeorgid.selectNode(node);
                vm.leaveportmain.orgidname = node.name;

            })
        },

        openRefTreeorganizationorgid: function () {
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
                    var node = ztreeorgid.getSelectedNodes();
                    //选择上级菜单
                    vm.leaveportmain.orgid = node[0].id;
                    vm.leaveportmain.orgidname = node[0].name;

                    layer.close(index);
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
                    url: "../leaveportmain/audit",
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
                    url: "../leaveportmain/unaudit",
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
            $.get("../leaveportmain/info/" + id, function (r) {
                vm.leaveportmain = r.leaveportmain;
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
        url: '../leaveportmain/list',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', width: 50, key: true, hidden: true},
            {label: '单据号', name: 'billno', width: 80},
            {label: '客户', name: 'orgidname', width: 80}, {label: '提单号', name: 'ladingcode', width: 80},
            {label: '船名', name: 'shipname', width: 80},
            {label: '航次', name: 'flight', width: 80},
            {label: '港口', name: 'portidname', width: 80}, {
                label: '船公司',
                name: 'shipcompanyname',
                width: 80
            }, {label: '箱量', name: 'boxqty', width: 80},
            {label: '箱型', name: 'boxtypeboxsize', width: 80}, {
                label: '起运地',
                name: 'takeboxplaceidname',
                width: 80
            }, {label: '目的地', name: 'endplaceidname', width: 80}, {label: '预计到港时间', name: 'planarrporttime', width: 80},
            {label: '预计到场时间', name: 'planarrtime', width: 80},
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
    vm.getRefTreeorganizationorgid();
    vm.getRefplace();
    vm.getReforganization();
    vm.getRefboxs();
    vm.getRef1003();


    initGridHeight();
});