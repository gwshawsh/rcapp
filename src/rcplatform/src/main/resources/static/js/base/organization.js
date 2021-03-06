var ztree;
//生成弹出树形空间参照
var ztreeparentId;


var vm = new Vue({
    el: '#rrapp',
    data: {
        q: {
            id: 0
        },
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
        ref_paytype: [],

        ref_enum2002: [],
        ref_enum2001: [],

        //创建实体类
        organization: {
            parentIdname: "",
            paytypename: "",
            busstypeenumvaluename: "",
            typeenumvaluename: "",
            code: "",
            name: "",
            parentId: "",
            phone: "",
            fax: "",
            address: "",
            email: "",
            webaddress: "",
            longitude: "",
            latitude: "",
            linkman: "",
            paytype: "",
            financecode: "",
            province: "",
            city: "",
            remark: "",
            taxcode: "",
            accperiod: "",
            policyrate: "",
            relationid: "",
            zizhi: "",
            busstype: "",
            type: ""
        }
    },
    methods: {
        query: function () {
            vm.reload();
            vm.getLeftTree();
        },
        getLeftTree: function (menuId) {
            //加载菜单树
            $.get("../organization/select", function (r) {
                ztreeLeft = $.fn.zTree.init($("#leftTree"), setting, r.treeList);
                var node2 = ztreeLeft.getNodeByParam("id", vm.organization.parentId);
                ztreeLeft.selectNode(node2);

            })
        },
        add: function () {
            var mktime = moment().format("YYYY-MM-DD");
            vm.showList = false;
            vm.title = "新增";
            vm.organization = {
                //参照的虚拟字段也必须先声明好,不然饿了么ui组件不能双向绑定
                parentIdname: "",
                paytypename: "",
                busstypeenumvaluename: "",
                typeenumvaluename: "",
                code: "",
                name: "",
                parentId: "",
                phone: "",
                fax: "",
                address: "",
                email: "",
                webaddress: "",
                longitude: "",
                latitude: "",
                linkman: "",
                paytype: "",
                financecode: "",
                province: "",
                city: "",
                remark: "",
                taxcode: "",
                accperiod: "",
                policyrate: "",
                relationid: "",
                zizhi: "",
                busstype: "",
                type: ""
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
            var url = vm.organization.id == null ? "../organization/save" : "../organization/update";
            $.ajax({
                type: "POST",
                url: url,
                data: JSON.stringify(vm.organization),
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
                    url: "../organization/delete",
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
            $.get("../organization/info/" + id, function (r) {
                vm.organization = r.organization;
            });
        },
        //生成参照调用弹出框函数

        //生成参照调用下拉框函数,用来初始化远程数据
        getRefpaytype: function () {
            $.get("../paytype/list?page=1&limit=1000", function (r) {
                vm.ref_paytype = r.page.list;
            });
        },

        getRef2002: function () {
            $.get("../enumtable/listone?enumid=2002&page=1&limit=1000", function (r) {
                vm.ref_enum2002 = r.page.list;
            });
        },
        getRef2001: function () {
            $.get("../enumtable/listone?enumid=2001&page=1&limit=1000", function (r) {
                vm.ref_enum2001 = r.page.list;
            });
        },
        //生成弹出树形空间参照

        getRefTreeorganizationparentId: function (menuId) {
            //加载菜单树
            $.get("../organization/select", function (r) {
                ztreeparentId = $.fn.zTree.init($("#refTreeorganization"), setting, r.treeList);
                var node = ztreeparentId.getNodeByParam("id", vm.organization.parentId);
                ztreeparentId.selectNode(node);
                vm.organization.parentIdname = node.name;

            })
        },

        openRefTreeorganizationparentId: function () {
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
                    var node = ztreeparentId.getSelectedNodes();
                    //选择上级菜单
                    vm.organization.parentId = node[0].id;
                    vm.organization.parentIdname = node[0].name;

                    layer.close(index);
                }
            });
        },
        menuTree: function () {
            layer.open({
                type: 1,
                offset: '50px',
                skin: 'layui-layer-molv',
                title: "选择",
                area: ['300px', '450px'],
                shade: 0,
                shadeClose: false,
                content: jQuery("#menuLayer"),
                btn: ['确定', '取消'],
                btn1: function (index) {
                    var node = ztree.getSelectedNodes();
                    //选择上级菜单
                    vm.organization.parentId = node[0].id;
                    vm.organization.parentName = node[0].name;

                    layer.close(index);
                }
            });
        },
        reload: function (event) {
            vm.showList = true;
            var page = $("#jqGrid").jqGrid('getGridParam', 'page');
            $("#jqGrid").jqGrid('setGridParam', {
                page: page,
                postData: {'id': vm.q.id}
            }).trigger("reloadGrid");
            vm.getLeftTree();
        },
        onClickNode: function (event, treeId, treeNode) {
            if (vm.showList) {
                vm.q.id = treeNode.id;
                vm.reload();
            }

        }
    }
});


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
    },
    callback: {
        onClick: vm.onClickNode
    }
};

$(function () {
    $("#jqGrid").jqGrid({
        url: '../organization/list',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', width: 50, key: true, hidden: true},
            {label: '编码', name: 'code', width: 80},
            {label: '名称', name: 'name', width: 80},
            {label: '上级组织', name: 'parentId', width: 80},
            {label: '联系电话', name: 'phone', width: 80},
            {label: '传真', name: 'fax', width: 80},
            {label: '地址', name: 'address', width: 80},
            {label: '邮箱', name: 'email', width: 80},
            {label: '网址', name: 'webaddress', width: 80},
            {label: '经度', name: 'longitude', width: 80},
            {label: '纬度', name: 'latitude', width: 80},
            {label: '联系人', name: 'linkman', width: 80},
            {label: '付款方式', name: 'paytype', width: 80},
            {label: '财务编码', name: 'financecode', width: 80},
            {label: '省', name: 'province', width: 80},
            {label: '城市', name: 'city', width: 80},
            {label: '备注', name: 'remark', width: 80},
            {label: '纳税人识别号', name: 'taxcode', width: 80},
            {label: '账期', name: 'accperiod', width: 80},
            {label: '保险客户费率', name: 'policyrate', width: 80},
            {label: '关联单位', name: 'relationid', width: 80},
            {label: '注册资质', name: 'zizhi', width: 80},
            {label: '业务类型', name: 'busstype', width: 80},
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
        shrinkToFit: false,
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
        gridComplete: function () {
            //隐藏grid底部滚动条
            //$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });
        }
    });
    //执行调用参照调用下拉框函数,初始化下拉数据
    vm.getRefTreeorganizationparentId();
    vm.getRefpaytype();
    vm.getRef2002();
    vm.getRef2001();

    vm.getLeftTree();

    initGridHeight();
});