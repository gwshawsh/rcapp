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
            code: "",
            name: "",
            boctid: "",
            address: "",
            tel: "",
            fax: "",
            man: "",
            del: "",
            makeuser: "",
            makedate: "",
            remark: ""
        },
        showList: true,
        showQuery: false,
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

        //创建实体类
        bank: {
            code: "",
            name: "",
            boctid: "",
            address: "",
            tel: "",
            fax: "",
            man: "",
            del: "",
            makeuser: "",
            makedate: "",
            remark: ""
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
            vm.bank = {
                //参照的虚拟字段也必须先声明好,不然饿了么ui组件不能双向绑定
                code: "",
                name: "",
                boctid: "",
                address: "",
                tel: "",
                fax: "",
                man: "",
                del: "",
                makeuser: gUserId,
                makedate: mktime,
                remark: ""
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
            var url = vm.bank.id == null ? "../bank/save" : "../bank/update";
            $.ajax({
                type: "POST",
                url: url,
                data: JSON.stringify(vm.bank),
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
                    url: "../bank/delete",
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

        getInfo: function (id) {
            $.get("../bank/info/" + id, function (r) {
                vm.bank = r.bank;
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

            if (!vm.bank.files) {
                vm.bank.files = [];
            }
            if (response.page.list && response.page.list.length > 0) {
                vm.bank.files.push(response.page.list[0]);
            }


        },

        upload_on_change: function (file, fileList) {
            this.fileslist = fileList;
        }
    }
});

$(function () {
    $("#jqGrid").jqGrid({
        url: '../bank/list',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', width: 50, key: true, hidden: true},
            {label: '编码', name: 'code', width: 80},
            {label: '名称', name: 'name', width: 80},
            {label: '币别', name: 'boctid', width: 80},
            {label: '地址', name: 'address', width: 80},
            {label: '电话', name: 'tel', width: 80},
            {label: '传真', name: 'fax', width: 80},
            {label: '联系人', name: 'man', width: 80},
            {label: '假删', name: 'del', width: 80},
            {label: '创建人员', name: 'makeuser', width: 80},
            {label: '创建日期', name: 'makedate', width: 80},
            {label: '备注', name: 'remark', width: 80}
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


    initGridHeight();
});