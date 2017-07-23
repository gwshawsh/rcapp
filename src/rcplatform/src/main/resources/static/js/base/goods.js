//生成弹出树形空间参照
var ztreefeetypeid;
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
            classid: "",
            feetypeid: "",
            deptid: "",
            code: "",
            name: "",
            spec: "",
            unit: "",
            remark: "",
            price: "",
            gcount: ""
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
        ref_gclass: [],


        //创建实体类
        goods: {
            classidname: "",
            feetypeidname: "",
            deptidname: "",
            classid: "",
            feetypeid: "",
            deptid: "",
            code: "",
            name: "",
            spec: "",
            unit: "",
            remark: "",
            price: "",
            gcount: ""
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
            vm.goods = {
                //参照的虚拟字段也必须先声明好,不然饿了么ui组件不能双向绑定
                classidname: "",
                feetypeidname: "",
                deptidname: "",
                classid: "",
                feetypeid: "",
                deptid: "",
                code: "",
                name: "",
                spec: "",
                unit: "",
                remark: "",
                price: "",
                gcount: ""
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
            var url = vm.goods.id == null ? "../goods/save" : "../goods/update";
            $.ajax({
                type: "POST",
                url: url,
                data: JSON.stringify(vm.goods),
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
                    url: "../goods/delete",
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
        getRefgclass: function () {
            $.get("../gclass/list?page=1&limit=1000", function (r) {
                vm.ref_gclass = r.page.list;
            });
        },


        //生成弹出树形空间参照

        getRefTreefeeinfofeetypeid: function (menuId) {
            //加载菜单树
            $.get("../feeinfo/select", function (r) {
                ztreefeetypeid = $.fn.zTree.init($("#refTreefeeinfo"), setting, r.treeList);
                var node = ztreefeetypeid.getNodeByParam("id", vm.goods.feetypeid);
                ztreefeetypeid.selectNode(node);
                vm.goods.feetypeidname = node.name;

            })
        },

        openRefTreefeeinfofeetypeid: function () {
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
                    var node = ztreefeetypeid.getSelectedNodes();
                    //选择上级菜单
                    vm.goods.feetypeid = node[0].id;
                    vm.goods.feetypeidname = node[0].name;

                    layer.close(index);
                }
            });
        },

        getRefTreesys_deptdeptid: function (menuId) {
            //加载菜单树
            $.get("../sys_dept/select", function (r) {
                ztreedeptid = $.fn.zTree.init($("#refTreesys_dept"), setting, r.treeList);
                var node = ztreedeptid.getNodeByParam("id", vm.goods.deptid);
                ztreedeptid.selectNode(node);
                vm.goods.deptidname = node.name;

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
                    vm.goods.deptid = node[0].id;
                    vm.goods.deptidname = node[0].name;

                    layer.close(index);
                }
            });
        },

        //查询单据明细
        queryDetail: function () {
        },

        getInfo: function (id) {
            $.get("../goods/info/" + id, function (r) {
                vm.goods = r.goods;
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

            if (!vm.goods.files) {
                vm.goods.files = [];
            }
            if (response.page.list && response.page.list.length > 0) {
                vm.goods.files.push(response.page.list[0]);
            }


        },

        upload_on_change: function (file, fileList) {
            this.fileslist = fileList;
        }
    }
});

$(function () {
    $("#jqGrid").jqGrid({
        url: '../goods/list',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', width: 50, key: true, hidden: true},
            {label: '类别', name: 'classidname', width: 80}, {
                label: '费用类别',
                name: 'feetypeidname',
                width: 80
            }, {label: '责任部门', name: 'deptidname', width: 80}, {label: '编码', name: 'code', width: 80},
            {label: '名称', name: 'name', width: 80},
            {label: '规格', name: 'spec', width: 80},
            {label: '单位', name: 'unit', width: 80},
            {label: '备注', name: 'remark', width: 80},
            {label: '单价', name: 'price', width: 80},
            {label: '库存', name: 'gcount', width: 80}
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
    vm.getRefgclass();
    vm.getRefTreefeeinfofeetypeid();
    vm.getRefTreesys_deptdeptid();


    initGridHeight();
});