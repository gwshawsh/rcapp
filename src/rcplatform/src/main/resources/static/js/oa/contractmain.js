//生成弹出树形空间参照
var ztreepartyaid;
var ztreepartybid;

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
            partyaid: "",
            partybid: "",
            billtype: "",
            paytype: "",
            paycircleid: "",
            bgndate: "",
            enddate: "",
            remark: "",
            billstatus: "",
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
        ref_enum1011: [],

        ref_enum2005: [],

        ref_paycircle: [],
        ref_enum1003: [],

        ref_sys_user: [],


        //明细表用户下拉参照的属性

        //单据主表实体类
        contractmain: {
            billno: "*",
            partyaid: "",
            partybid: "",
            billtype: "",
            paytype: "",
            paycircleid: "",
            bgndate: "",
            enddate: "",
            remark: "",
            billstatus: "",
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
            vm.contractmain = {
                partyaidname: "",
                billtypeenumvaluename: "",
                paytypeenumvaluename: "",
                paycircleidname: "",
                billstatusenumvaluename: "",
                makeuserfullname: "",

                billno: "*",
                partyaid: "",
                partybid: "",
                billtype: "",
                paytype: "",
                paycircleid: "",
                bgndate: "",
                enddate: "",
                remark: "",
                billstatus: "",
                makeuser: gUserFullName,
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
            var url = vm.contractmain.id == null ? "../contractmain/save" : "../contractmain/update";
            $.ajax({
                type: "POST",
                url: url,
                data: JSON.stringify(vm.contractmain),
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
                    url: "../contractmain/submitworkflow",
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

            $.get("../contractmain/info/" + id, function (r) {
                vm.contractmain = r.contractmain;
                vm.contractmain.id = null;
                vm.contractmain.billno = "*";
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
                    url: "../contractmain/cancel",
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
                    url: "../contractmain/claim",
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
            $.get("../contractmain/info/" + id, function (r) {
                vm.contractmain = r.contractmain;
                showrefgrid_billcomments(function (data) {
                    if (!vm.contractmain.billcommentsEntity) {
                        vm.contractmain.billcommentsEntity = {};
                    }
                    vm.contractmain.billcommentsEntity.billno = vm.contractmain.billno;
                    vm.contractmain.billcommentsEntity.refbilltype = 0;
                    vm.contractmain.billcommentsEntity.remark = data.remark;
                    vm.contractmain.billcommentsEntity.auditstatus = data.auditstatus;
                    $.ajax({
                        type: "POST",
                        url: "../contractmain/audit",
                        data: JSON.stringify(vm.contractmain),
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
                    url: "../contractmain/unaudit",
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
                    url: "../contractmain/delete",
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

        //生成主表参照调用下拉框函数,用来初始化远程数据
        getRef1011: function () {
            $.get("../enumtable/listone?enumid=1011&page=1&limit=1000", function (r) {
                vm.ref_enum1011 = r.page.list;
            });
        },
        getRef2005: function () {
            $.get("../enumtable/listone?enumid=2005&page=1&limit=1000", function (r) {
                vm.ref_enum2005 = r.page.list;
            });
        },
        getRefpaycircle: function () {
            $.get("../paycircle/list?page=1&limit=1000", function (r) {
                vm.ref_paycircle = r.page.list;
            });
        },
        getRef1003: function () {
            $.get("../enumtable/listone?enumid=1003&page=1&limit=1000", function (r) {
                vm.ref_enum1003 = r.page.list;
            });
        },
        getRefsys_user: function () {
            $.get("../sys_user/list?page=1&limit=1000", function (r) {
                vm.ref_sys_user = r.page.list;
            });
        },

        //生成明细表参照调用下拉框函数,用来初始化远程数据

        //生成弹出树形空间参照

        getRefTreeorganizationpartyaid: function (menuId) {
            //加载菜单树
            $.get("../organization/select", function (r) {
                ztreepartyaid = $.fn.zTree.init($("#refTreeorganization"), setting, r.treeList);
                var node = ztreepartyaid.getNodeByParam("id", vm.contractmain.partyaid);
                ztreepartyaid.selectNode(node);
                vm.contractmain.partyaidname = node.name;

            })
        },

        openRefTreeorganizationpartyaid: function () {
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
                    var node = ztreepartyaid.getSelectedNodes();
                    //选择上级菜单
                    vm.contractmain.partyaid = node[0].id;
                    vm.contractmain.partyaidname = node[0].name;

                    layer.close(index);
                }
            });
        },

        getRefTreeorganizationpartybid: function (menuId) {
            //加载菜单树
            $.get("../organization/select", function (r) {
                ztreepartybid = $.fn.zTree.init($("#refTreeorganization"), setting, r.treeList);
                var node = ztreepartybid.getNodeByParam("id", vm.contractmain.partybid);
                ztreepartybid.selectNode(node);
                vm.contractmain.partybidname = node.name;

            })
        },

        openRefTreeorganizationpartybid: function () {
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
                    var node = ztreepartybid.getSelectedNodes();
                    //选择上级菜单
                    vm.contractmain.partybid = node[0].id;
                    vm.contractmain.partybidname = node[0].name;

                    layer.close(index);
                }
            });
        },

        getRefTreefeeinfofeeid: function(menuId){
            //加载菜单树
            $.get("../feeinfo/select", function(r){
                ztreefeeid = $.fn.zTree.init($("#refTreefeeinfo"), setting, r.treeList);
                var node = ztreefeeid.getNodeByParam("id", 0);
                ztreefeeid.selectNode(node);
               // vm.contractmain.details[0].feeidname = node.name;

            })
        },

        openRefTreefeeinfofeeid: function(event){
            layer.open({
                type: 1,
                offset: '50px',
                skin: 'layui-layer-molv',
                title: "选择",
                area: ['300px', '450px'],
                shade: 0,
                shadeClose: false,
                content: jQuery("#treelayerfeeinfo"),
                btn: ['确定', '取消'],
                btn1: function (index) {
                    var node = ztreefeeid.getSelectedNodes();
                    //选择上级菜单
                    vm.contractdetail.feeid = node[0].id;
                    vm.contractdetail.feeidname = node[0].name;

                    layer.close(index);
                }
            });
        },

        getInfo: function (id) {
            $.get("../contractmain/info/" + id, function (r) {
                vm.contractmain = r.contractmain;
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
                postData: {'formid': id},
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
            var idx = vm.contractmain.details.length;
            var item = {
                id: "", billno: "*", serialno: idx, feeid: "", price: "", cost: "", uptdate: mktime,
            };


            vm.contractmain.details.push(item);
        },

        selectitem: function (index) {
            var sel = index;
            var item = vm.contractmain.details[sel];
        },
        delitem: function (event) {
            var obj = event.currentTarget;
            var index = obj.attributes['idx'].value
            vm.contractmain.details.splice(index, 1);
            for (var i = 0; i < vm.contractmain.details.length; i++) {
                vm.contractmain.details[i].serialno = i;
            }
        },
        upload_on_success: function (response, file, fileList) {

            if (!vm.contractmain.files) {
                vm.contractmain.files = [];
            }
            if (response.page.list && response.page.list.length > 0) {
                vm.contractmain.files.push(response.page.list[0]);
            }


        },

        upload_on_change: function (file, fileList) {
            this.fileslist = fileList;
        }

    }
});

$(function () {
    $("#jqGrid").jqGrid({
        url: '../contractmain/list',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', width: 50, key: true, hidden: true},
            {label: '单据号', name: 'billno', width: 80}, {label: '甲方', name: 'partyaid', width: 80}, {
                label: '乙方',
                name: 'partybid',
                width: 80
            }, {label: '收付款类型', name: 'billtypeenumvaluename', width: 80}, {
                label: '付款方式',
                name: 'paytypeenumvaluename',
                width: 80
            }, {label: '结算周期', name: 'paycircleidname', width: 80}, {
                label: '生效日期',
                name: 'bgndate',
                width: 80
            }, {label: '失效日期', name: 'enddate', width: 80}, {label: '备注', name: 'remark', width: 80}, {
                label: '单据状态',
                name: 'billstatus',
                width: 80,
                formatter: formater_billstatus
            },
            {label: '制单人', name: 'makeuserfullname', width: 80}, {
                label: '制单日期',
                name: 'makedate',
                width: 80
            }, {label: '审核人', name: 'accuserfullname', width: 80}, {
                label: '审核日期',
                name: 'accdate',
                width: 80
            }, {label: '更新时间', name: 'uptdate', width: 80},],
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
        url: '../contractmain/listdetail',
        datatype: "local",
        colModel: [
            {label: 'id', name: 'id', width: 50, key: true, hidden: true},
            {label: '序号', name: 'serialno', width: 80},
            {label: '费用项目', name: 'feeid', width: 80},
            {label: '单价', name: 'price', width: 80},
            {label: '金额', name: 'cost', width: 80},
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
    vm.getRefTreeorganizationpartyaid();
    vm.getRef1011();
    vm.getRef2005();
    vm.getRefpaycircle();
    vm.getRef1003();
    vm.getRefsys_user();


    //执行调用参照调用下拉框函数,初始化下拉数据
    vm.getRefTreefeeinfofeeid();

    createBillAttachmentsGrid();
    createBillCommentsGrid();

    initGridHeightHalf("#jqGrid");
    initGridHeightHalf("#jqGridDetail");
});