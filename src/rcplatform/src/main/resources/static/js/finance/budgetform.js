var ztree;

var vm = new Vue({
    el: '#rrapp',
    data: {
        showList: true,
        showDetailList:true,
        title: null,
        budgetform: {}
    },
    methods: {
        query: function () {
            vm.reload();
        },
        queryDetail:function(){
            var id = getSelectedRow();
            if (id == null) {
                return;
            }
            vm.showDetailList = true;

            $("#jqGridDetail").jqGrid('setGridParam', {
                page: 1,
                postData:{'formid':id},
                datatype: "json"
            }).trigger("reloadGrid");
        },
        getTree: function(menuId){
            //加载菜单树
            $.get("/sys/dept/select", function(r){
                ztree = $.fn.zTree.init($("#menuTree"), setting, r.deptList);
                var node = ztree.getNodeByParam("deptId", vm.dept.parentId);
                ztree.selectNode(node);
                vm.dept.parentName = node.name;

                ztreeLeft = $.fn.zTree.init($("#leftTree"), setting, r.deptList);
                var node2 = ztreeLeft.getNodeByParam("deptId", vm.dept.parentId);
                ztreeLeft.selectNode(node2);

            })
        },
        selectTree:function(event){
            var itemctrl=event.currentTarget;
            var idx=itemctrl.id;
            layer.open({
                type: 1,
                offset: '50px',
                skin: 'layui-layer-molv',
                title: "选择菜单",
                area: ['300px', '450px'],
                shade: 0,
                shadeClose: false,
                content: jQuery("#menuLayer"),
                btn: ['确定', '取消'],
                btn1: function (index) {
                    var node = ztree.getSelectedNodes();
                    //选择上级菜单
                    //vm.dept.parentId = node[0].deptId;
                    //vm.dept.parentName = node[0].name;
                    var item=vm.budgetform.details[idx];
                    item.name=node[0].name;
                    layer.close(index);
                }
            });
        },
        add: function () {
            var mktime=moment().format("YYYY-MM-DD");
            vm.showList = false;
            vm.showDetailList=false;
            vm.title = "新增";
            vm.budgetform = {billno:"*",mkuser:gUserName,mkdate:mktime,details:[]};
            vm.additem();
        },

        update: function (event) {
            var id = getSelectedRow();
            if (id == null) {
                return;
            }
            vm.showList = false;
            vm.showDetailList=false;
            vm.title = "修改";

            vm.getInfo(id)
        },


        saveOrUpdate: function (event) {
            var url = vm.budgetform.id == null ? "../budgetform/save" : "../budgetform/update";
            $.ajax({
                type: "POST",
                url: url,
                data: JSON.stringify(vm.budgetform),
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
                    url: "../budgetform/delete",
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
            $.get("../budgetform/info/" + id, function (r) {
                vm.budgetform = r.budgetform;
            });
        },
        reload: function (event) {
            vm.showList = true;
            var page = $("#jqGrid").jqGrid('getGridParam', 'page');
            $("#jqGrid").jqGrid('setGridParam', {
                page: page
            }).trigger("reloadGrid");
        },


        //单据明细的相关操作
        additem:function(){
            var idx=vm.budgetform.details.length;
            var item={billno:"*",serialno:idx,name:" ",usage:" "+idx,planmoney:"0",accountid:""};
            vm.budgetform.details.push(item);
        },

        selectitem:function(index){
            var sel=index;
            var item=vm.budgetform.details[sel];
        },
        delitem:function(event){
            var obj=event.currentTarget;
            var index=obj.attributes['idx'].value
            vm.budgetform.details.splice(index, 1);
            for(var i=0;i<vm.budgetform.details.length;i++){
                vm.budgetform.details[i].serialno=i;
            }
        }
    }
});


var setting = {
    data: {
        simpleData: {
            enable: true,
            idKey: "deptId",
            pIdKey: "parentId",
            rootPId: -1
        },
        key: {
            url:"nourl"
        }
    }

};



$(function () {
    $("#jqGrid").jqGrid({
        url: '../budgetform/list',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', width: 50, key: true},
            {label: '单据号', name: 'billno', width: 80},
            {label: '开始日期', name: 'begindate', width: 80},
            {label: '结束日期', name: 'enddate', width: 80},
            {label: '部门', name: 'deptId', width: 80},
            {label: '预算类型', name: 'billtype', width: 80},
            {label: '状态', name: 'billstatus', width: 80},
            {label: '制单人', name: 'mkuser', width: 80},
            {label: '制单日期', name: 'mkdate', width: 80},
            {label: '审核人', name: 'accuser', width: 80},
            {label: '审核日期', name: 'accdate', width: 80},
            {label: '签批人', name: 'rzuser', width: 80},
            {label: '签批日期', name: 'rzdate', width: 80},
            {label: '更新时间', name: 'uptdate', width: 80}
        ],
        viewrecords: true,
        height: 385,
        rowNum: 10,
        rowList: [10, 30, 50],
        rownumbers: true,
        rownumWidth: 25,
        autowidth: true,
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
        onSelectRow:function(){
            vm.queryDetail();
        },
        gridComplete: function () {
            //隐藏grid底部滚动条
            //$("#jqGrid").closest(".ui-jqgrid-bdiv").css({"overflow-x": "hidden"});
        }
    });


    $("#jqGridDetail").jqGrid({
        url: '../budgetform/listdetail',
        datatype: "local",
        colModel: [
            { label: '序号', name: 'serialno', width: 80 },
            { label: '预算科目', name: 'accountid', width: 80 },
            { label: '名称', name: 'name', width: 80 },
            { label: '用途', name: 'usage', width: 80 },
            { label: '说明', name: 'remark', width: 80 },
            { label: '预算金额', name: 'planmoney', width: 80 },
            { label: '已用预算', name: 'usagemoney', width: 80 },
            { label: '剩余预算', name: 'leftmoney', width: 80 },
            { label: '更新时间', name: 'uptdate', width: 80 }
        ],
        viewrecords: true,
        height: 385,
        rowNum: 10,
        rowList : [10,30,50],
        rownumbers: true,
        rownumWidth: 25,
        autowidth:true,
        multiselect: true,
        pager: "#jqGridPagerDetail",
        jsonReader : {
            root: "page.list",
            page: "page.currPage",
            total: "page.totalPage",
            records: "page.totalCount"
        },
        prmNames : {
            page:"page",
            rows:"limit",
            order: "order"
        },

        gridComplete:function(){
            //隐藏grid底部滚动条
            $("#jqGridDetail").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });
        }
    });

    vm.getTree();

    initGridHeightHalf("#jqGrid");
    initGridHeightHalf("#jqGridDetail");

});