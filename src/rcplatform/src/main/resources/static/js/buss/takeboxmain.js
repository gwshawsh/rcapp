var vm = new Vue({
    el: '#rrapp',
    data: {
        showList: true,
        showDetailList: true,
        title: null,
        takeboxmain: {}
    },
    methods: {
        query: function () {
            vm.reload();
        },
        add: function () {
            vm.showList = false;
            vm.showDetailList=false;
            vm.title = "新增";
            vm.takeboxmain = {};
        },
        update: function (event) {
            var id = getSelectedRow();
            if (id == null) {
                return;
            }
            $.get("../takeboxmain/info/" + id, function (r) {
                vm.takeboxmain = r.takeboxmain;
                if(vm.takeboxmain.billstatus=="1"){
                    alert("单据已经审核,不能修改");
                }
                else{
                    vm.showList = false;
                    vm.showDetailList = false;
                    vm.title = "修改";
                }
            });

        },
        saveOrUpdate: function (event) {
            var url = vm.takeboxmain.id == null ? "../takeboxmain/save" : "../takeboxmain/update";
            $.ajax({
                type: "POST",
                url: url,
                data: JSON.stringify(vm.takeboxmain),
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
                    url: "../takeboxmain/delete",
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
            $.get("../takeboxmain/info/" + id, function (r) {
                vm.takeboxmain = r.takeboxmain;
            });
        },
        reload: function (event) {
            vm.showList = true;
            var page = $("#jqGrid").jqGrid('getGridParam', 'page');
            $("#jqGrid").jqGrid('setGridParam', {
                page: page
            }).trigger("reloadGrid");
        },
        //审核放箱单,生成运输单
        accbill:function(){
            var ids = getSelectedRows();
            if (ids == null) {
                return;
            }

            confirm('确定要审核选中的记录？', function () {
                $.ajax({
                    type: "POST",
                    url: "../takeboxmain/shenhe",
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
        //改单,生成改箱单
        changeTakeBoxPlace:function(){
            var ids = getSelectedRows();
            if (ids == null) {
                return;
            }

            confirm('确定要审核选中的记录？', function () {

                $.ajax({
                    type: "POST",
                    url: "../takeboxmain/shenhe",
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
                });//end ajax
            });
        },

        //单据明细的相关操作
        queryDetail: function () {
            var id = getSelectedRow();
            if (id == null) {
                return;
            }
            vm.showDetailList = true;

            $("#jqGridDetail").jqGrid('setGridParam', {
                page: 1,
                postData: {'formid': id},
                datatype: "json"
            }).trigger("reloadGrid");
        },
        additem: function () {
            var idx = vm.takeboxmain.details.length;
            //var item={billno:"*",
            //    serialno:idx,
            //    transcompanyid:"",
            //    startplaceid1:" "+idx,
            //    startplaceid2:"0",
            //    endplaceid:"",
            //    boxno:"",
            //    plantaketime:"",
            //    realtaketime:"",
            //    planarrvetime:"",
            //    realarrvetime:""
            //
            //};
            // vm.takeboxmain.details.push(item);
        },

        selectitem: function (index) {
            var sel = index;
            var item = vm.budgetform.details[sel];
        },
        delitem: function (event) {
            var obj = event.currentTarget;
            var index = obj.attributes['idx'].value
            vm.takeboxmain.details.splice(index, 1);
            for (var i = 0; i < vm.takeboxmain.details.length; i++) {
                vm.takeboxmain.details[i].serialno = i;
            }
        },
        //选择车队
        selectTransteam: function () {
            showrefgrid_transteam("选择车队", function (data) {
                var seldata = data;
                for (var i = 0; i < vm.takeboxmain.details.length; i++) {
                    vm.takeboxmain.details[i].transcompanyid = seldata['id'];
                }

            })
        },
        //选择明细中的车队
        selTransTeamInDetail:function(event){
            var cmp=event.currentTarget;
            showrefgrid_transteam("选择车队", function (data) {
                var seldata = data;
                var index = cmp.attributes['idx'].value;
                if(vm.takeboxmain.details&&vm.takeboxmain.details.length>0){
                    var item=vm.takeboxmain.details[index];
                    item['transcompanyid']=seldata['id'];
                }


            })

        },
        selectBgnshipdate: function (event) {
            var option = {
                elem: event.currentTarget,
                istime: true,
                format: 'YYYY-MM-DD hh:mm:ss',
                choose: function (dates) {
                    vm.takeboxmain.bgnshipdate = dates;
                }
            }
            layui.laydate(option);
        },
        selectEndshipdate: function (event) {
            var option = {
                elem: event.currentTarget,
                istime: true,
                format: 'YYYY-MM-DD hh:mm:ss',
                choose: function (dates) {
                    vm.takeboxmain.endshipdate = dates;
                }
            }
            layui.laydate(option);
        },
        selectBgnplanarrtime: function (event) {
            var option = {
                elem: event.currentTarget,
                istime: true,
                format: 'YYYY-MM-DD hh:mm:ss',
                choose: function (dates) {
                    vm.takeboxmain.endbgnplanarrtime = dates;
                }
            }
            layui.laydate(option);
        },

        selectEndplanarrtime: function (event) {
            var option = {
                elem: event.currentTarget,
                istime: true,
                format: 'YYYY-MM-DD hh:mm:ss',
                choose: function (dates) {
                    vm.takeboxmain.endplanarrtime = dates;
                }
            }
            layui.laydate(option);
        },
    }
});

$(function () {
    $("#jqGrid").jqGrid({
        url: '../takeboxmain/list',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', width: 50, key: true,hidden:true},
            {label: '单据号', name: 'billno', width: 80},
            {label: '参照单据号', name: 'refbillno', width: 80},
            {label: '参照单据类型', name: 'refbilltype', width: 80,formatter:formater_billtype},
            {label: '客户', name: 'orgname', width: 80},
            {label: '提单号', name: 'ladingcode', width: 80},
            {label: '船名', name: 'shipname', width: 80},
            {label: '航次', name: 'flight', width: 80},
            {label: '港口', name: 'portid', width: 80},
            {label: '箱量', name: 'boxqty', width: 80},
            {label: '箱型', name: 'boxtype', width: 80},
            {label: '状态', name: 'billstatus', width: 80,formatter:formater_billstatus},
            {label: '提箱场站', name: 'takeboxplacename', width: 80},
            {label: '目的地', name: 'endplacename', width: 80},
            {label: '集港时间', name: 'bgnshipdate', width: 80},
            {label: '截港时间', name: 'endshipdate', width: 80},
            {label: '最早到场时间', name: 'bgnplanarrtime', width: 80},
            {label: '最晚到场时间', name: 'endplanarrtime', width: 80},
            {label: '应收费用', name: 'yingshou', width: 80},
            {label: '应付费用', name: 'yingfu', width: 80},
            {label: '备注', name: 'remark', width: 80},
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
        onSelectRow: function () {
            vm.queryDetail();
        },
        gridComplete: function () {
            //隐藏grid底部滚动条
            //$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });
        }
    });

    $("#jqGridDetail").jqGrid({
        url: '../takeboxmain/listdetail',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', width: 50, key: true, hidden: true},
            {label: '单据号', name: 'billno', width: 80, hidden: true},
            {label: '序号', name: 'serialno', width: 80},
            {label: '运输公司', name: 'transcompanyname', width: 80},
            {label: '原起运地点', name: 'startplacename1', width: 80},
            {label: '现起运点', name: 'startplacename2', width: 80},
            {label: '目的地', name: 'endplacename', width: 80},
            {label: '箱号', name: 'boxno', width: 80},
            {label: '计划提箱时间', name: 'plantaketime', width: 80},
            {label: '实际提箱时间', name: 'realtaketime', width: 80},
            {label: '计划到场时间', name: 'planarrvetime', width: 80},
            {label: '实际到场时间', name: 'realarrvetime', width: 80},
            {label: '应收费用', name: 'yingshou', width: 80},
            {label: '应付费用', name: 'yingfu', width: 80}
        ],
        viewrecords: true,
        height: 385,
        rowNum: 100,
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
    initGridHeight();

});