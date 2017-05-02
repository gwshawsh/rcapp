var ztreeStartPlace;
var ztreeEndPlace;
var ztreeTransCompany;

var vm = new Vue({
    el: '#rrapp',
    data: {
        showList: true,
        showEdit:false,
        showFangxiang:false,

        title: null,
        planKongxiangMain: {trancompanyId:0,startplaceId:0,endplaceId:0}

    },
    methods: {
        //获取运输公司数据
        getTransTree: function(menuId){
            //加载菜单树
            $.get("../organization/select", function(r){
                ztreeTransCompany = $.fn.zTree.init($("#transTree"), setting, r.orgList);
                var node = ztreeTransCompany.getNodeByParam("id", vm.planKongxiangMain.trancompanyId);
                ztreeTransCompany.selectNode(node);
                vm.planKongxiangMain.trancompanyName = node.name;
            })
        },
        getStartPlaceTree: function(menuId){
            //加载菜单树
            $.get("../organization/select", function(r){
                ztreeStartPlace = $.fn.zTree.init($("#startplaceTree"), setting, r.orgList);
                var node = ztreeStartPlace.getNodeByParam("id", vm.planKongxiangMain.startplaceId);
                ztreeStartPlace.selectNode(node);
                vm.planKongxiangMain.startplaceName = node.name;
            })
        },
        getEndPlaceTree: function(menuId){
            //加载菜单树
            $.get("../organization/select", function(r){
                ztreeEndPlace = $.fn.zTree.init($("#endplaceTree"), setting, r.orgList);
                var node = ztreeEndPlace.getNodeByParam("id", vm.planKongxiangMain.endplaceId);
                ztreeEndPlace.selectNode(node);
                vm.planKongxiangMain.endplaceName = node.name;
            })
        },
        query: function () {
            vm.reload();
        },
        add: function () {
            vm.showList = false;
            vm.showEdit=true;
            vm.showFangxiang=false;
            vm.title = "新增";
            vm.planKongxiangMain = {};
        },
        update: function (event) {
            var id = getSelectedRow();
            if (id == null) {
                return;
            }
            vm.showList = false;
            vm.showEdit=true;
            vm.showFangxiang=false;
            vm.title = "修改";

            vm.getInfo(id)
        },
        saveOrUpdate: function (event) {
            var url = vm.planKongxiangMain.id == null ? "../plankongxiangmain/save" : "../plankongxiangmain/update";
            $.ajax({
                type: "POST",
                url: url,
                data: JSON.stringify(vm.planKongxiangMain),
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
                    url: "../plankongxiangmain/delete",
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
        fangxiang:function(){
            var id = getSelectedRow();
            if (id == null) {
                return;
            }
            vm.showList = false;
            vm.showEdit=false;
            vm.showFangxiang=true;
            vm.title = "放箱";

            vm.getInfo(id)
        },
        startplaceTree: function(){
            layer.open({
                type: 1,
                offset: '50px',
                skin: 'layui-layer-molv',
                title: "选择菜单",
                area: ['300px', '450px'],
                shade: 0,
                shadeClose: false,
                content: jQuery("#startplaceLayer"),
                btn: ['确定', '取消'],
                btn1: function (index) {
                    var node = ztreeStartPlace.getSelectedNodes();
                    //选择上级菜单
                    vm.planKongxiangMain.startplaceId = node[0].id;
                    vm.planKongxiangMain.startplaceName = node[0].name;

                    layer.close(index);
                }
            });
        },
        endplaceTree: function(){
            layer.open({
                type: 1,
                offset: '50px',
                skin: 'layui-layer-molv',
                title: "选择菜单",
                area: ['300px', '450px'],
                shade: 0,
                shadeClose: false,
                content: jQuery("#endplaceLayer"),
                btn: ['确定', '取消'],
                btn1: function (index) {
                    var node = ztreeEndPlace.getSelectedNodes();
                    //选择上级菜单
                    vm.planKongxiangMain.endplaceId = node[0].id;
                    vm.planKongxiangMain.endplaceName = node[0].name;

                    layer.close(index);
                }
            });
        },
        transCompanyTree: function(){
            layer.open({
                type: 1,
                offset: '50px',
                skin: 'layui-layer-molv',
                title: "选择菜单",
                area: ['300px', '450px'],
                shade: 0,
                shadeClose: false,
                content: jQuery("#transLayer"),
                btn: ['确定', '取消'],
                btn1: function (index) {
                    var node = ztreeTransCompany.getSelectedNodes();
                    //选择上级菜单
                    vm.planKongxiangMain.trancompanyId = node[0].id;
                    vm.planKongxiangMain.trancompanyName = node[0].name;

                    layer.close(index);
                }
            });
        },
        getInfo: function (id) {
            $.get("../plankongxiangmain/info/" + id, function (r) {
                vm.planKongxiangMain = r.planKongxiangMain;
            });
        },
        reload: function (event) {
            vm.showList = true;
            vm.showEdit=false;
            vm.showFangxiang=false;
            var page = $("#jqGrid").jqGrid('getGridParam', 'page');
            $("#jqGrid").jqGrid('setGridParam', {
                page: page
            }).trigger("reloadGrid");
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
            url:"nourl"
        }
    },
    callback:{
        onClick:vm.onClickNode
    }
};


$(function () {
    $("#jqGrid").jqGrid({
        url: '../plankongxiangmain/list',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', width: 50, key: true,hidden:true},
            {label: '单据号', name: 'billno', width: 80},
            {label: '组织id', name: 'orgId', width: 80},
            {label: '组织编码', name: 'orgcode', width: 80},
            {label: '提单号', name: 'lazingno', width: 80},
            {label: '船名', name: 'shipname', width: 80},
            {label: '航次', name: 'voyage', width: 80},
            {label: '港口', name: 'portid', width: 80},
            {label: '箱量', name: 'boxqty', width: 80},
            {label: '箱型', name: 'boxtype', width: 80},
            {label: '提箱场站', name: 'startplaceId', width: 80},
            {label: '放箱地点', name: 'endplaceId', width: 80},
            {label: '截港时间', name: 'closedate', width: 80},
            {label: '客户', name: 'client', width: 80},
            {label: '业务员', name: 'clerk', width: 80},
            {label: '最早到场时间', name: 'bgnplanarrtime', width: 80},
            {label: '最晚到场时间', name: 'endplanarrtime', width: 80},
            {label: '运输公司', name: 'trancompanyid', width: 80},
            {label: '备注', name: 'remark', width: 80},
            {label: '单据状态', name: 'billstate', width: 80},
            {label: '制单人', name: 'billuser', width: 80},
            {label: '制单日期', name: 'billdate', width: 80},
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
        shrinkToFit:false,
        autoWidth:true,
        forceFit:true,
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
        gridComplete: function () {
            //隐藏grid底部滚动条
            $("#jqGrid").closest(".ui-jqgrid-bdiv").css({"overflow-x": "hidden"});
        }
    });

    $("#jqGridBoxs").jqGrid({
        url: '../plankongxiangdetailed/list',
        datatype: "json",
        colModel: [
            { label: 'id', name: 'id', width: 50, key: true,hidden:true },
            { label: '序号', name: 'serialno', width: 80 },
            { label: '提箱点', name: 'risiboxplace', width: 80 },
            { label: '还箱点', name: 'returnboxplace', width: 80 },
            { label: '箱号', name: 'boxno', width: 80 },
            { label: '实际到场时间', name: 'realarrtime', width: 80 },
            { label: '运输公司编码', name: 'trancompanycode', width: 80 },
            { label: '车牌号', name: 'plateno', width: 80 },
            { label: '司机', name: 'driver', width: 80 }
        ],
        viewrecords: true,
        height: 385,
        rowNum: 10,
        rowList : [10,30,50],
        rownumbers: true,
        rownumWidth: 25,
        autowidth:true,
        multiselect: true,
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
            $("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });
        }
    });


    vm.getTransTree();
    vm.getStartPlaceTree();
    vm.getEndPlaceTree();
    initGridHeight();
});