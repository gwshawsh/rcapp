//生成弹出树形空间参照
var ztreeorgid;
var ztreetakeboxorgid;

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
            refbillno: "",
            refbilltype: "",
            orgid: "",
            ladingcode: "",
            shipname: "",
            flight: "",
            shipid: "",
            portid: "",
            boxqty: "",
            boxtype: "",
            takeboxplaceid: "",
            endplaceid: "",
            shipdate: "",
            bgnshipdatetime: "",
            endshipdatetime: "",
            bgnplanarrtime: "",
            endplanarrtime: "",
            yingshou: "",
            yingfu: "",
            remark: "",
            linkman: "",
            linkmobile: "",
            billstatus: "",
            makeuser: "",
            makedate: "",
            accuser: "",
            accdate: "",
            uptdate: ""
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
            },
                {
                    text: '昨天',
                    onClick(picker) {
                        const date = new Date();
                        date.setTime(date.getTime() - 3600 * 1000 * 24);
                        picker.$emit('pick', date);
                    }
                },
                {
                    text: '一周前',
                    onClick(picker) {
                        const date = new Date();
                        date.setTime(date.getTime() - 3600 * 1000 * 24 * 7);
                        picker.$emit('pick', date);
                    }
                }]
        },

        //用户下拉参照的属性
        ref_enum1006: [],

        ref_boxs: [],
        ref_enum2002: [],

        ref_sys_user: [],

        ref_organization: [],
        //明细表用户下拉参照的属性
        ref_place: [],
        ref_enum2009: [],

        changeplacetype: "",
        newstartplaceid: "",
        changeremark: "",
        //改单要求
        showtakeboxenddlg: false,
        //放箱完成对话框
        showtakeboxchangedlg: false,
        //改单申请对话框
        showtakeboxchangeenddlg: false,
        //改单完成对话框

        fangdanfeein: 0.00,
        laowufeein: 0.00,
        tixiangfeein: 0.00,
        otherfeein: 0.00,

        fangdanfeeout: 0.00,
        tixiangfeeout: 0.00,
        laowufeeout: 0.00,
        otherfeeout: 0.00,

        //单据主表实体类
        takeboxmain: {
            billno: "*",
            refbillno: "",
            refbilltype: "",
            orgid: "",
            ladingcode: "",
            shipname: "",
            flight: "",
            shipid: "",
            portid: "",
            boxqty: "",
            realboxqty: "",
            boxtype: "",
            takeboxplaceid: "",
            endplaceid: "",
            shipdate: "",
            bgnshipdatetime: "",
            endshipdatetime: "",
            bgnplanarrtime: "",
            endplanarrtime: "",
            changefee: "",
            yingshou: "",
            yingfu: "",
            custremark: "",
            takeboxremark: "",
            errorremark: "",
            changeremark: "",
            takeboxorgid: "",
            linkman: "",
            linkmobile: "",
            billstatus: "",
            makeuser: gUserId,
            makedate: "",
            accuser: "",
            accdate: "",
            uptdate: "",
            details: []

        }
    },
    methods: {
        rules: {
            takeboxplaceid: {
                required: true,
                message: '请输入提箱场站',
                trigger: 'blur'
            },
            takeboxorgidname: {
                required: true,
                message: '请输入放箱公司',
                trigger: 'blur'
            }
        },
        showQueryPanel: function() {
            vm.showQuery = !vm.showQuery;
        },
        query: function() {
            vm.reload();
        },
        showdetail: function() {
            vm.showDetailList = !vm.showDetailList;
            if (vm.showDetailList) {
                initGridHeightHalf("#jqGrid");
                initGridHeightHalf("#jqGridDetail");
            } else {
                initGridHeight("#jqGrid");
            }
        },
        add: function() {
            var mktime = moment().format("YYYY-MM-DD");
            vm.showList = false;
            vm.showDetailList = false;
            vm.title = "新增";
            vm.takeboxmain = {
                billno: "*",
                refbillno: "",
                refbilltype: "",
                orgid: "",
                ladingcode: "",
                shipname: "",
                flight: "",
                shipid: "",
                portid: "",
                boxqty: "",
                realboxqty: "",
                boxtype: "",
                takeboxplaceid: "",
                endplaceid: "",
                shipdate: "",
                bgnshipdatetime: "",
                endshipdatetime: "",
                bgnplanarrtime: "",
                endplanarrtime: "",
                changefee: "",
                yingshou: "",
                yingfu: "",
                custremark: "",
                takeboxremark: "",
                errorremark: "",
                changeremark: "",
                takeboxorgid: "",
                linkman: "",
                linkmobile: "",
                billstatus: "0",
                makeuser: gUserId,
                makedate: mktime,
                accuser: "",
                accdate: "",
                uptdate: "",
                details: []
            };
            vm.additem();
        },
        update: function(event) {
            var id = getSelectedRow();
            if (id == null) {
                return;
            }
            vm.showList = false;
            vm.showDetailList = false;
            vm.title = "修改";

            vm.getInfo(id)
        },
        saveOrUpdate: function(event) {
            var url = vm.takeboxmain.id == null ? "../takeboxmain/save": "../takeboxmain/update";
            $.ajax({
                type: "POST",
                url: url,
                data: JSON.stringify(vm.takeboxmain),
                success: function(r) {
                    if (r.code === 0) {
                        alert('操作成功',
                            function(index) {
                                vm.reload();
                            });
                    } else {
                        alert(r.msg);
                    }
                }
            });
        },
        //提交到工作流
        submitworkflow: function() {
            var row = getSelectedRow();
            if (row == null) {
                return;
            }
            confirm('确定要提交选中的任务？',
                function() {
                    $.ajax({
                        type: "POST",
                        url: "../takeboxmain/submitworkflow",
                        data: JSON.stringify(row),
                        success: function(r) {
                            if (r.code == 0) {
                                alert('操作成功',
                                    function(index) {
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
        copybill: function(event) {
            var id = getSelectedRow();
            if (id == null) {
                return;
            }
            vm.showList = false;
            vm.showDetailList = false;
            vm.title = "新增";
            vm.getInfo(id);

            $.get("../takeboxmain/info/" + id,
                function(r) {
                    vm.takeboxmain = r.takeboxmain;
                    vm.takeboxmain.id = null;
                    vm.takeboxmain.billno = "*";
                });

        },
        //作废单据
        cancel: function(event) {
            var ids = getSelectedRows();
            if (ids == null) {
                return;
            }
            confirm('确定要作废选中的单据？',
                function() {
                    $.ajax({
                        type: "POST",
                        url: "../takeboxmain/cancel",
                        data: JSON.stringify(ids),
                        success: function(r) {
                            if (r.code == 0) {
                                alert('操作成功',
                                    function(index) {
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
        claim: function(event) {
            var ids = getSelectedRows();
            if (ids == null) {
                return;
            }

            confirm('确定要签收选中的任务？',
                function() {
                    $.ajax({
                        type: "POST",
                        url: "../takeboxmain/claim",
                        data: JSON.stringify(ids),
                        success: function(r) {
                            if (r.code == 0) {
                                alert('操作成功',
                                    function(index) {
                                        $("#jqGrid").trigger("reloadGrid");
                                    });
                            } else {
                                alert(r.msg);
                            }
                        }
                    });
                });
        },
        //审核单据，生成运输单
        audit: function(event) {
            var ids = getSelectedRows();
            if (ids == null) {
                return;
            }
            $.get("../takeboxmain/info/" + id,
                function(r) {
                    vm.takeboxmain = r.takeboxmain;
                    $.ajax({
                        type: "POST",
                        url: "../takeboxmain/audit",
                        data: JSON.stringify(ids),
                        success: function(r) {
                            if (r.code == 0) {
                                alert('操作成功',
                                    function(index) {
                                        $("#jqGrid").trigger("reloadGrid");
                                    });
                            } else {
                                alert(r.msg);
                            }
                        }
                    });
                });

        },

        unaudit: function() {
            var ids = getSelectedRows();
            if (ids == null) {
                return;
            }

            confirm('确定要反审核选中的记录？',
                function() {
                    $.ajax({
                        type: "POST",
                        url: "../takeboxmain/unaudit",
                        data: JSON.stringify(ids),
                        success: function(r) {
                            if (r.code == 0) {
                                alert('操作成功',
                                    function(index) {
                                        $("#jqGrid").trigger("reloadGrid");
                                    });
                            } else {
                                alert(r.msg);
                            }
                        }
                    });
                });
        },

        del: function(event) {
            var ids = getSelectedRows();
            if (ids == null) {
                return;
            }

            confirm('确定要删除选中的记录？',
                function() {
                    $.ajax({
                        type: "POST",
                        url: "../takeboxmain/delete",
                        data: JSON.stringify(ids),
                        success: function(r) {
                            if (r.code == 0) {
                                alert('操作成功',
                                    function(index) {
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
        getRef1006: function() {
            $.get("../enumtable/listone?enumid=1006&page=1&limit=1000",
                function(r) {
                    vm.ref_enum1006 = r.page.list;
                });
        },
        getRefplace: function() {
            $.get("../place/list?page=1&limit=1000",
                function(r) {
                    vm.ref_place = r.page.list;
                });
        },
        getRefboxs: function() {
            $.get("../boxs/list?page=1&limit=1000",
                function(r) {
                    vm.ref_boxs = r.page.list;
                });
        },
        getRef2002: function() {
            $.get("../enumtable/listone?enumid=2002&page=1&limit=1000",
                function(r) {
                    vm.ref_enum2002 = r.page.list;
                });
        },
        getRefsys_user: function() {
            $.get("../sys_user/list?page=1&limit=1000",
                function(r) {
                    vm.ref_sys_user = r.page.list;
                });
        },

        getReforganization: function() {
            $.get("../organization/list?page=1&limit=1000",
                function(r) {
                    vm.ref_organization = r.page.list;
                });
        },

        getRef2009: function() {
            $.get("../enumtable/listone?enumid=2009&page=1&limit=1000",
                function(r) {
                    vm.ref_enum2009 = r.page.list;
                });
        },

        //生成弹出树形空间参照
        getRefTreeorganizationorgid: function(menuId) {
            //加载菜单树
            $.get("../organization/select",
                function(r) {
                    ztreeorgid = $.fn.zTree.init($("#refTreeorganization"), setting, r.treeList);
                    var node = ztreeorgid.getNodeByParam("id", vm.takeboxmain.orgid);
                    ztreeorgid.selectNode(node);
                    vm.takeboxmain.orgidname = node.name;

                })
        },

        openRefTreeorganizationorgid: function() {
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
                btn1: function(index) {
                    var node = ztreeorgid.getSelectedNodes();
                    //选择上级菜单
                    vm.takeboxmain.orgid = node[0].id;
                    vm.takeboxmain.orgidname = node[0].name;

                    layer.close(index);
                }
            });
        },
        getRefTreeorganizationtakeboxorgid: function(menuId) {
            //加载菜单树
            $.get("../organization/select",
                function(r) {
                    ztreetakeboxorgid = $.fn.zTree.init($("#refTreeorganization"), setting, r.treeList);
                    var node = ztreetakeboxorgid.getNodeByParam("id", vm.takeboxmain.takeboxorgid);
                    ztreetakeboxorgid.selectNode(node);
                    vm.takeboxmain.takeboxorgidname = node.name;

                })
        },

        openRefTreeorganizationtakeboxorgid: function() {
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
                btn1: function(index) {
                    var node = ztreetakeboxorgid.getSelectedNodes();
                    //选择上级菜单
                    vm.takeboxmain.takeboxorgid = node[0].id;
                    vm.takeboxmain.takeboxorgidname = node[0].name;

                    layer.close(index);
                }
            });
        },

        getInfo: function(id) {
            $.get("../takeboxmain/info/" + id,
                function(r) {
                    vm.takeboxmain = r.takeboxmain;
                });
        },
        reload: function(event) {
            vm.showList = true;
            vm.showDetailList = true;
            var page = $("#jqGrid").jqGrid('getGridParam', 'page');
            $("#jqGrid").jqGrid('setGridParam', {
                postData: {
                    'query': JSON.stringify(vm.q)
                },
                page: page
            }).trigger("reloadGrid");
        },

        //单据明细的相关操作
        //查询单据明细
        queryDetail: function() {
            var row = getSelectedRowData();

            var id = row.billno;
            if (id == null) {
                return;
            }
            vm.showDetailList = true;

            //查询单据明细
            $("#jqGridDetail").jqGrid('setGridParam', {
                page: 1,
                postData: {
                    'formid': id
                },
                datatype: "json"
            }).trigger("reloadGrid");

            //查询单据审批明细
            $("#jqGridComments").jqGrid('setGridParam', {
                page: 1,
                postData: {
                    'billno': id
                },
                datatype: "json"
            }).trigger("reloadGrid");

            //查询单据审批明细
            $("#jqGridFiles").jqGrid('setGridParam', {
                page: 1,
                postData: {
                    'billno': id
                },
                datatype: "json"
            }).trigger("reloadGrid");

        },

        //增加明细表一条记录
        additem: function() {
            var mktime = moment().format("YYYY-MM-DD");
            var idx = vm.takeboxmain.details.length;
            var item = {
                id: "",
                billno: "*",
                serialno: idx,
                transcompanyid: "",
                startplaceid1: "",
                startplaceid2: "",
                realplaceid2: "",
                endplaceid: "",
                changeplacetype: "",
                boxno: "",
                fengno: "",
                plantaketime: "",
                realtaketime: "",
                planarrvetime: "",
                realarrvetime: "",
                changefee: "",
                yingshou: "",
                fangdanfeein: "",
                laowufeein: "",
                tixiangfeein: "",
                otherfeein: "",
                yingfu: "",
                dadanfeeout: "",
                fangdanfeeout: "",
                tixiangfeeout: "",
                laowufeeout: "",
                otherfeeout: "",
                remark: "",
                uptdate: mktime,
            };

            vm.takeboxmain.details.push(item);
        },

        selectitem: function(index) {
            var sel = index;
            var item = vm.takeboxmain.details[sel];
        },
        delitem: function(event) {
            var obj = event.currentTarget;
            var index = obj.attributes['idx'].value;
            vm.takeboxmain.details.splice(index, 1);
            for (var i = 0; i < vm.takeboxmain.details.length; i++) {
                vm.takeboxmain.details[i].serialno = i;
            }
        },
        upload_on_success: function(response, file, fileList) {

            if (!vm.takeboxmain.files) {
                vm.takeboxmain.files = [];
            }
            if (response.page.list && response.page.list.length > 0) {
                vm.takeboxmain.files.push(response.page.list[0]);
            }

        },

        upload_on_change: function(file, fileList) {
            this.fileslist = fileList;
        },

        //放单
        takebox: function() {
            var ids = getSelectedRows();
            if (ids == null) {
                return;
            }

            confirm('确定执行放单？',
                function() {
                    $.ajax({
                        type: "POST",
                        url: "../takeboxmain/takebox",
                        data: JSON.stringify(ids),
                        success: function(r) {
                            if (r.code == 0) {
                                alert('操作成功',
                                    function(index) {
                                        $("#jqGrid").trigger("reloadGrid");
                                    });
                            } else {
                                alert(r.msg);
                            }
                        }
                    });
                });
        },
        //放单异常
        takeboxerror: function() {
            var id = getSelectedRow();
            if (id == null) {
                return;
            }

            layer.prompt({
                    title: '输入放单异常原因，并确认',
                    formType: 2
                },
                function(text, index) {
                    layer.close(index);
                    $.get("../takeboxmain/info/" + id,
                        function(r) {
                            vm.takeboxmain = r.takeboxmain;
                            vm.takeboxmain.remark = text;
                            $.ajax({
                                type: "POST",
                                url: "../takeboxmain/takeboxerror",
                                data: JSON.stringify(vm.takeboxmain),
                                success: function(r) {
                                    if (r.code == 0) {
                                        alert('操作成功',
                                            function(index) {
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
        //打开放单结束对话框
        takeboxend: function() {
            var id = getSelectedRow();
            if (id == null) {
                return;
            }

            vm.showtakeboxenddlg = true;

            $.get("../takeboxmain/info/" + id,
                function(r) {
                    vm.takeboxmain = r.takeboxmain;

                });

        },
        dotakeboxend: function() {
            this.$refs['takeboxend'].validate(function(valid) {
                if (valid) {
                    confirm('确定执行放单结束？',
                        function() {
                            var sumyingfu = 0.00;
                            var sumyingshou = 0.00;
                            for (var i = 0; i < vm.takeboxmain.details.length; i++) {
                                vm.takeboxmain.details[i].yingshou = parseFloat(vm.fangdanfeein) + parseFloat(vm.laowufeein) + parseFloat(vm.tixiangfeein) + parseFloat(vm.otherfeein);
                                vm.takeboxmain.details[i].fangdanfeein = vm.fangdanfeein;
                                vm.takeboxmain.details[i].laowufeein = vm.laowufeein;
                                vm.takeboxmain.details[i].tixiangfeein = vm.tixiangfeein;
                                vm.takeboxmain.details[i].otherfeein = vm.otherfeein;

                                vm.takeboxmain.details[i].yingfu = parseFloat(vm.fangdanfeeout) + parseFloat(vm.tixiangfeeout) + parseFloat(vm.otherfeeout);
                                vm.takeboxmain.details[i].dadanfeeout = vm.fangdanfeeout + vm.tixiangfeeout;
                                vm.takeboxmain.details[i].laowufeeout = vm.laowufeeout;
                                vm.takeboxmain.details[i].otherfeeout = vm.otherfeeout;

                                sumyingfu = sumyingfu + parseFloat(vm.takeboxmain.details[i].yingfu);
                                sumyingshou = sumyingshou + parseFloat(vm.takeboxmain.details[i].yingshou);

                            }

                            vm.takeboxmain.yingfu = sumyingfu;
                            vm.takeboxmain.yingshou = sumyingshou;

                            $.ajax({
                                type: "POST",
                                url: "../takeboxmain/takeboxend",
                                data: JSON.stringify(vm.takeboxmain),
                                success: function(r) {
                                    if (r.code == 0) {
                                        alert('操作成功',
                                            function(index) {
                                                $("#jqGrid").trigger("reloadGrid");
                                            });
                                    } else {
                                        alert(r.msg);
                                    }
                                    vm.showtakeboxenddlg=false;
                                }
                            });
                        });
                } else {
                    console.log('error submit!!');
                    return false;
                }
            });

        },

        //改单申请
        takeboxchange: function() {
            var id = getSelectedRow();
            if (id == null) {
                return;
            }
            vm.showtakeboxchangedlg = true;
            $.get("../takeboxmain/info/" + id,
                function(r) {
                    vm.takeboxmain = r.takeboxmain;

                });
        },

        dotakeboxchange: function() {
            for (var i = 0; i < vm.takeboxmain.details.length; i++) {
                vm.takeboxmain.details[i].changeplacetype = vm.changeplacetype;

            }

            $.ajax({
                type: "POST",
                url: "../takeboxmain/takeboxchange",
                data: JSON.stringify(vm.takeboxmain),
                success: function(r) {
                    if (r.code == 0) {
                        alert('操作成功',
                            function(index) {
                                $("#jqGrid").trigger("reloadGrid");
                            });
                    } else {
                        alert(r.msg);
                    }
                    vm.showtakeboxchangedlg=false;
                    vm.changeplacetype = "";
                    vm.newstartplaceid = "";
                    vm.changeremark = "";
                }
            });
        },

        //改单完成
        takeboxchangeend: function() {
            var id = getSelectedRow();
            if (id == null) {
                return;
            }
            vm.showtakeboxchangeenddlg = true;


        },
        dotakeboxchangeend: function() {
            var id = getSelectedRow();
            if (id == null) {
                return;
            }
            $.get("../takeboxmain/info/" + id,
                function(r) {
                    vm.takeboxmain = r.takeboxmain;
                    for (var i = 0; i < vm.takeboxmain.details.length; i++) {
                        vm.takeboxmain.details[i].changeplacetype = vm.changeplacetype;
                        vm.takeboxmain.details[i].startplaceid2 = vm.newstartplaceid;
                        vm.takeboxmain.details[i].remark = vm.changeremark;
                    }

                    $.ajax({
                        type: "POST",
                        url: "../takeboxmain/takeboxchangeend",
                        data: JSON.stringify(vm.takeboxmain),
                        success: function(r) {
                            if (r.code == 0) {
                                alert('操作成功',
                                    function(index) {
                                        $("#jqGrid").trigger("reloadGrid");
                                    });
                            } else {
                                alert(r.msg);
                            }
                            vm.showtakeboxchangeenddlg=false;
                            vm.changeplacetype = "";
                            vm.newstartplaceid = "";
                            vm.changeremark = "";
                        }
                    });

                });

        },

    }
});

$(function() {
    $("#jqGrid").jqGrid({
        url: '../takeboxmain/list',
        datatype: "json",
        colModel: [{
            label: 'id',
            name: 'id',
            width: 50,
            key: true,
            hidden: true
        },
            {
                label: '单据号',
                name: 'billno',
                width: 80
            },
            {
                label: '客户',
                name: 'orgid',
                width: 80
            },
            {
                label: '单据状态',
                name: 'billstatus',
                width: 80,
                formatter: formater_takeboxbillstatus
            },
            {
                label: '提单号',
                name: 'ladingcode',
                width: 80
            },
            {
                label: '船名',
                name: 'shipname',
                width: 80
            },
            {
                label: '航次',
                name: 'flight',
                width: 80
            },
            {
                label: '船公司',
                name: 'shipid',
                width: 80
            },
            {
                label: '进港点',
                name: 'portidname',
                width: 80
            },
            {
                label: '箱量',
                name: 'boxqty',
                width: 80
            },
            {
                label: '箱型',
                name: 'boxtypeboxsize',
                width: 80
            },

            {
                label: '提箱场站',
                name: 'takeboxplaceidname',
                width: 80
            },
            {
                label: '目的地',
                name: 'endplaceidname',
                width: 80
            },
            {
                label: '船期',
                name: 'shipdate',
                width: 80
            },
            {
                label: '集港时间',
                name: 'bgnshipdatetime',
                width: 80
            },
            {
                label: '截港时间',
                name: 'endshipdatetime',
                width: 80
            },
            {
                label: '用箱时间',
                name: 'bgnplanarrtime',
                width: 80
            },

            {
                label: '放单收入',
                name: 'yingshou',
                width: 80
            },
            {
                label: '放单成本',
                name: 'yingfu',
                width: 80
            },
            {
                label: '用箱要求',
                name: 'custremark',
                width: 80
            },
            {
                label: '放单备注',
                name: 'takeboxremark',
                width: 80
            },
            {
                label: '异常原因',
                name: 'errorremark',
                width: 80
            },
            {
                label: '改单要求',
                name: 'changeremark',
                width: 80
            },
            {
                label: '放箱公司',
                name: 'takeboxorgidname',
                width: 80
            },
            {
                label: '联系人',
                name: 'linkman',
                width: 80
            },
            {
                label: '联系电话',
                name: 'linkmobile',
                width: 80
            },

            {
                label: '备注',
                name: 'remark',
                width: 80
            },
            {
                label: '制单人',
                name: 'makeuserfullname',
                width: 80
            },


            {
                label: '制单日期',
                name: 'makedate',
                width: 80
            },
            {
                label: '审核人',
                name: 'accuserfullname',
                width: 80
            },
            {
                label: '审核日期',
                name: 'accdate',
                width: 80
            },
            {
                label: '更新时间',
                name: 'uptdate',
                width: 80
            }],
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
        onSelectRow: function() {
            vm.queryDetail();
        },
        gridComplete: function() {
            //隐藏grid底部滚动条
            //$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });
        }
    });

    $("#jqGridDetail").jqGrid({
        url: '../takeboxmain/listdetail',
        datatype: "local",
        colModel: [{
            label: 'id',
            name: 'id',
            width: 50,
            key: true,
            hidden: true
        },
            {
                label: '序号',
                name: 'serialno',
                width: 80
            },
            {
                label: '运输公司',
                name: 'transcompanyidname',
                width: 80
            },
            {
                label: '原起运地点',
                name: 'startplaceid1name',
                width: 80
            },
            {
                label: '现起运点',
                name: 'startplaceid2name',
                width: 80
            },
            {
                label: '现起运点',
                name: 'realplaceid2name',
                width: 80
            },
            {
                label: '目的地',
                name: 'endplaceidname',
                width: 80
            },
            {
                label: '改单类型',
                name: 'changeplacetypeenumvaluename',
                width: 80
            },
            {
                label: '箱号',
                name: 'boxno',
                width: 80
            },
            {
                label: '铅封号',
                name: 'fengno',
                width: 80
            },
            {
                label: '计划提箱时间',
                name: 'plantaketime',
                width: 80
            },
            {
                label: '实际提箱时间',
                name: 'realtaketime',
                width: 80
            },
            {
                label: '计划到场时间',
                name: 'planarrvetime',
                width: 80
            },
            {
                label: '实际到场时间',
                name: 'realarrvetime',
                width: 80
            },
            {
                label: '改单费',
                name: 'changefee',
                width: 80
            },
            {
                label: '收入合计',
                name: 'yingshou',
                width: 80
            },
            {
                label: '放单费',
                name: 'fangdanfeein',
                width: 80
            },
            {
                label: '劳务费',
                name: 'laowufeein',
                width: 80
            },
            {
                label: '提箱费',
                name: 'tixiangfeein',
                width: 80
            },
            {
                label: '其他费用',
                name: 'otherfeein',
                width: 80
            },
            {
                label: '成本合计',
                name: 'yingfu',
                width: 80
            },
            {
                label: '打单费',
                name: 'dadanfeeout',
                width: 80
            },
            {
                label: '放单费',
                name: 'fangdanfeeout',
                width: 80
            },
            {
                label: '提箱费',
                name: 'tixiangfeeout',
                width: 80
            },
            {
                label: '劳务费',
                name: 'laowufeeout',
                width: 80
            },
            {
                label: '其他费用',
                name: 'otherfeeout',
                width: 80
            },
            {
                label: '备注',
                name: 'remark',
                width: 80
            },
            {
                label: '更新时间',
                name: 'uptdate',
                width: 80
            },
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
        gridComplete: function() {
            //隐藏grid底部滚动条
            //$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });
        }
    });

    jQuery("#jqGridDetail").jqGrid('setGroupHeaders', {
        useColSpanStyle: true,
        groupHeaders:[
            {startColumnName: 'yingshou', numberOfColumns: 5, titleText: '放单收入'},
            {startColumnName: 'yingfu', numberOfColumns: 6, titleText: '放单成本'}
        ]
    });

    //执行调用参照调用下拉框函数,初始化下拉数据
    vm.getRef1006();
    vm.getRefTreeorganizationorgid();
    vm.getRefplace();
    vm.getRefboxs();
    vm.getRef2002();
    vm.getRefsys_user();
    vm.getReforganization();

    //执行调用参照调用下拉框函数,初始化下拉数据
    vm.getRef2009();

    createBillAttachmentsGrid();
    createBillCommentsGrid();

    initGridHeightHalf("#jqGrid");
    initGridHeightHalf("#jqGridDetail");
});