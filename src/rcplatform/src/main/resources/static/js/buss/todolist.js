var vm = new Vue({
    el: '#rrapp',
    data: {
        showList: true,
        title: null,
        todolist:[]
    },
    methods: {
        query: function () {
            vm.reload();
        },
        add: function () {
            vm.showList = false;
            vm.title = "新增";
            vm.todolist = [];
        },
        claim:function (index,row) {
            var params=JSON.stringify(row.billdata);
            confirm('确定要签收选中的任务？', function () {
                $.ajax({
                    type: "POST",
                    url: "../todolist/claim",
                    data: params,
                    success: function (r) {
                        if (r.code == 0) {
                            alert('操作成功', function (index) {
                                row.billstatus=true;

                            });
                        } else {
                            alert(r.msg);
                        }
                    }
                });
            });
        },
        audit:function (index,row) {

            showrefgrid_billcomments(function (data) {
                if (!row.billdata.billcommentsEntity) {
                    row.billdata.billcommentsEntity = {};
                }
                var billdata=JSON.parse(row.billdata);
                row.billdata.billcommentsEntity.billno = billdata.billno;
                row.billdata.billcommentsEntity.refbilltype = 0;
                row.billdata.billcommentsEntity.remark = data.remark;
                row.billdata.billcommentsEntity.auditstatus = data.auditstatus;
                var params=JSON.stringify(row.billdata);
                $.ajax({
                    type: "POST",
                    url: "../todolist/audit",
                    data:params,
                    success: function (r) {
                        if (r.code == 0) {
                            alert('审核成功', function (index) {
                                $("#jqGrid").trigger("reloadGrid");
                            });
                        } else {
                            alert(r.msg);
                        }
                    }
                });
            });

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
            var url = vm.todolist.id == null ? "../todolist/save" : "../todolist/update";
            $.ajax({
                type: "POST",
                url: url,
                data: JSON.stringify(vm.todolist),
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
                    url: "../todolist/delete",
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
            $.get("../todolist/info/" + id, function (r) {
                //vm.todolist = r.todolist;

            });
        },
        reload: function (event) {
            $.get("../todolist/list/", function (r) {
                vm.todolist = r.page.list;

            });
        }
    }
});

function openfunc(funcurl, functitle) {
    var func = {
        href: funcurl, icon: "fa fa-circle-o", title: functitle
    }
    window.parent.navtab.tabAdd(func);
}

$(function () {
 vm.reload();
});