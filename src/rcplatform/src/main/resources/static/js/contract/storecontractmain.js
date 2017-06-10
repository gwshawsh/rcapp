var vm = new Vue({
    el: '#rrapp',
    data: {
        showList: true,
        showDetailList:true,
        title: null,
        storecontractmain: {}
    },
    methods: {
        query: function () {
            vm.reload();
        },
        add: function () {
            var mktime=moment().format("YYYY-MM-DD");
            vm.showList = false;
            vm.showDetailList=false;
            vm.title = "新增";
            vm.storecontractmain = {billno:"*",makeuser:gUserName,makedate:mktime,details:[]};
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
            var url = vm.storecontractmain.id == null ? "../storecontractmain/save" : "../storecontractmain/update";
            $.ajax({
                type: "POST",
                url: url,
                data: JSON.stringify(vm.storecontractmain),
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
                    url: "../storecontractmain/delete",
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
            $.get("../storecontractmain/info/" + id, function (r) {
                vm.storecontractmain = r.storecontractmain;
            });
        },
        reload: function (event) {
            vm.showList = true;
            vm.showDetailList=true;
            var page = $("#jqGrid").jqGrid('getGridParam', 'page');
            $("#jqGrid").jqGrid('setGridParam', {
                page: page
            }).trigger("reloadGrid");
        },
        //单据明细的相关操作
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
        additem:function(){
            var idx=vm.storecontractmain.details.length;
            var item={billno:"*",serialno:idx};
            vm.storecontractmain.details.push(item);
        },

        selectitem:function(index){
            var sel=index;
            var item=vm.storecontractmain.details[sel];
        },
        delitem:function(event){
            var obj=event.currentTarget;
            var index=obj.attributes['idx'].value
            vm.storecontractmain.details.splice(index, 1);
            for(var i=0;i<vm.storecontractmain.details.length;i++){
                vm.storecontractmain.details[i].serialno=i;
            }
        }
    }
});

$(function () {
    $("#jqGrid").jqGrid({
        url: '../storecontractmain/list',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', width: 50, key: true},
            {label: '单据号', name: 'billno', width: 80},
            {label: '客户', name: 'orgid', width: 80},
            {label: '付款方式', name: 'paytype', width: 80},
            {label: '币别', name: 'boctid', width: 80},
            {label: '汇率', name: 'rate', width: 80},
            {label: '税率', name: 'taxrate', width: 80},
            {label: '放箱费单价', name: 'takeboxfee', width: 80},
            {label: '放箱费含税单价', name: 'takeboxfeetax', width: 80},
            {label: '生效日期', name: 'bgndate', width: 80},
            {label: '失效日期', name: 'enddate', width: 80},
            {label: '备注', name: 'remark', width: 80},
            {label: '单据状态', name: 'billstatus', width: 80},
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


    $("#jqGridDetail").jqGrid({
        url: '../storecontractmain/listdetail',
        datatype: "json",
        colModel: [
            { label: 'id', name: 'id', width: 50, key: true },
            { label: '单据号', name: 'billno', width: 80 },
            { label: '序号', name: 'serialno', width: 80 },
            { label: '线路', name: 'lineid', width: 80 },
            { label: '箱型', name: 'boxtype', width: 80 },
            { label: '空重类型：0-空箱 1-重箱', name: 'weighttype', width: 80 },
            { label: '应收单价', name: 'boxprice', width: 80 }
        ],
        viewrecords: true,
        height: 385,
        rowNum: 10,
        rowList : [10,30,50],
        rownumbers: true,
        rownumWidth: 25,
        autowidth: true,
        autoScroll: true,
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
        shrinkToFit:false,
        gridComplete:function(){
            //隐藏grid底部滚动条
            //$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });
        }
    });

    initGridHeight();
});