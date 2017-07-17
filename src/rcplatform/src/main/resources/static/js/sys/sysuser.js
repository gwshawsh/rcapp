//生成弹出树形空间参照
var ztreeorgid;
var ztreedeptId;

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
            username: "",
            fullname: "",
            password: "",
            entrytime: "",
            email: "",
            englishname: "",
            brithday: "",
            englishlevel: "",
            graduationtime: "",
            residence: "",
            census: "",
            educationexperience: "",
            workexperience: "",
            family: "",
            mobile: "",
            startedworktime: "",
            name: "",
            gender: "",
            nationality: "",
            computerlevel: "",
            major: "",
            thermobile: "",
            vacationyear: "",
            vacationlastyear: "",
            identification: "",
            qulification: "",
            marriage: "",
            academictitle: "",
            school: "",
            status: "",
            orgid: "",
            deptId: "",
            createTime: ""
        },
        showList: true,
        showQuery: false,
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
        ref_enum1015: [],
        ref_enum1016: [],
        ref_enum1017: [],
        ref_enum1018: [],
        ref_enum1020: [],
        roleList:{},
        fileslist:[],
        //创建实体类
        sysUser: {
            genderenumvaluename: "",
            vacationyearenumvaluename: "",
            vacationlastyearenumvaluename: "",
            marriageenumvaluename: "",
            statusenumvaluename: "",
            orgidname: "",
            deptIdname: "",
            username: "",
            fullname: "",
            password: "",
            entrytime: "",
            email: "",
            englishname: "",
            brithday: "",
            englishlevel: "",
            graduationtime: "",
            residence: "",
            census: "",
            educationexperience: "",
            workexperience: "",
            family: "",
            mobile: "",
            startedworktime: "",
            name: "",
            gender: "",
            nationality: "",
            computerlevel: "",
            major: "",
            thermobile: "",
            vacationyear: "",
            vacationlastyear: "",
            identification: "",
            qulification: "",
            marriage: "",
            academictitle: "",
            school: "",
            status: 1,
            orgid: "",
            deptId: "",
            createTime: "",
            roleIdList:[]

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
            //获取角色信息

            var mktime = moment().format("YYYY-MM-DD");
            vm.showList = false;
            vm.title = "新增";
            vm.sysUser = {
                //参照的虚拟字段也必须先声明好,不然饿了么ui组件不能双向绑定
                genderenumvaluename: "",
                vacationyearenumvaluename: "",
                vacationlastyearenumvaluename: "",
                marriageenumvaluename: "",
                statusenumvaluename: "",
                orgidname: "",
                deptIdname: "",
                username: "",
                fullname: "",
                password: "",
                entrytime: "",
                email: "",
                englishname: "",
                brithday: "",
                englishlevel: "",
                graduationtime: "",
                residence: "",
                census: "",
                educationexperience: "",
                workexperience: "",
                family: "",
                mobile: "",
                startedworktime: "",
                name: "",
                gender: "",
                nationality: "",
                computerlevel: "",
                major: "",
                thermobile: "",
                vacationyear: "",
                vacationlastyear: "",
                identification: "",
                qulification: "",
                marriage: "",
                academictitle: "",
                school: "",
                status: "",
                orgid: "",
                deptId: "",
                createTime: "",
                roleIdList:[]
            };

            this.getRoleList();
        },
        getRoleList: function(){
            $.get("../sys/role/select", function(r){
                vm.roleList = r.list;
            });
        },
        update: function (event) {
            var id = getSelectedRow();
            if (id == null) {
                return;
            }
            vm.showList = false;
            vm.title = "修改";

            vm.getInfo(id);
            //获取角色信息
            this.getRoleList();
        },
        saveOrUpdate: function (event) {
            var url = vm.sysUser.id == null ? "../sys_user/save" : "../sys_user/update";
            $.ajax({
                type: "POST",
                url: url,
                data: JSON.stringify(vm.sysUser),
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
                    url: "../sys_user/delete",
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
        getRef1015: function () {
            $.get("../enumtable/listone?enumid=1015&page=1&limit=1000", function (r) {
                vm.ref_enum1015 = r.page.list;
            });
        },
        getRef1016: function () {
            $.get("../enumtable/listone?enumid=1016&page=1&limit=1000", function (r) {
                vm.ref_enum1016 = r.page.list;
            });
        },
        getRef1017: function () {
            $.get("../enumtable/listone?enumid=1017&page=1&limit=1000", function (r) {
                vm.ref_enum1017 = r.page.list;
            });
        },
        getRef1018: function () {
            $.get("../enumtable/listone?enumid=1018&page=1&limit=1000", function (r) {
                vm.ref_enum1018 = r.page.list;
            });
        },
        getRef1020: function () {
            $.get("../enumtable/listone?enumid=1020&page=1&limit=1000", function (r) {
                vm.ref_enum1020 = r.page.list;
            });
        },

        //生成弹出树形空间参照

        getRefTreeorganizationorgid: function (menuId) {
            //加载菜单树
            $.get("../organization/select", function (r) {
                ztreeorgid = $.fn.zTree.init($("#refTreeorganization"), setting, r.treeList);
                var node = ztreeorgid.getNodeByParam("id", vm.sysUser.orgid);
                ztreeorgid.selectNode(node);
                vm.sysUser.orgidname = node.name;

            })
        },

        openRefTreeorganizationorgid: function () {
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
                    var node = ztreeorgid.getSelectedNodes();
                    //选择上级菜单
                    vm.sysUser.orgid = node[0].id;
                    vm.sysUser.orgidname = node[0].name;

                    layer.close(index);
                }
            });
        },

        getRefTreesys_deptdeptId: function (menuId) {
            //加载菜单树
            $.get("../sys_dept/select", function (r) {
                ztreedeptId = $.fn.zTree.init($("#refTreesys_dept"), setting, r.treeList);
                var node = ztreedeptId.getNodeByParam("id", vm.sysUser.deptId);
                ztreedeptId.selectNode(node);
                vm.sysUser.deptIdname = node.name;

            })
        },

        openRefTreesys_deptdeptId: function () {
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
                    var node = ztreedeptId.getSelectedNodes();
                    //选择上级菜单
                    vm.sysUser.deptId = node[0].id;
                    vm.sysUser.deptIdname = node[0].name;

                    layer.close(index);
                }
            });
        },

        getInfo: function (id) {
            $.get("../sys_user/info/" + id, function (r) {
                vm.sysUser = r.sysUser;
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

            if (!vm.sysUser.files) {
                vm.sysUser.files = [];
            }
            if (response.page.list && response.page.list.length > 0) {
                vm.sysUser.files.push(response.page.list[0]);
            }


        },

        upload_on_change: function (file, fileList) {
            this.fileslist = fileList;
        }
    }
});

$(function () {
    $("#jqGrid").jqGrid({
        url: '../sys_user/list',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', width: 50, key: true, hidden: true},
            {label: '用户编码', name: 'username', width: 80},
            {label: '姓名', name: 'fullname', width: 80},
            {label: '密码', name: 'password', width: 80},
            {label: '入职时间', name: 'entrytime', width: 80},
            {label: '邮箱', name: 'email', width: 80},
            {label: '英文名', name: 'englishname', width: 80},
            {label: '出生日期', name: 'brithday', width: 80},
            {label: '外语水平', name: 'englishlevel', width: 80},
            {label: '毕业时间', name: 'graduationtime', width: 80},
            {label: '现住址', name: 'residence', width: 80},
            {label: '户籍在地', name: 'census', width: 80},
            {label: '教育经历', name: 'educationexperience', width: 80},
            {label: '工作经历', name: 'workexperience', width: 80},
            {label: '家庭状况', name: 'family', width: 80},
            {label: '电话', name: 'mobile', width: 80},
            {label: '参加工作时间', name: 'startedworktime', width: 80},
            {label: '姓名', name: 'name', width: 80},
            {label: '性别', name: 'genderenumvaluename', width: 80}, {label: '民族', name: 'nationality', width: 80},
            {label: '计算机水平', name: 'computerlevel', width: 80},
            {label: '所学专业', name: 'major', width: 80},
            {label: '其他联系方式', name: 'thermobile', width: 80},
            {label: '本年假天数', name: 'vacationyearenumvaluename', width: 80}, {
                label: '上年假天数',
                name: 'vacationlastyearenumvaluename',
                width: 80
            }, {label: '身份证', name: 'identification', width: 80},
            {label: '学历', name: 'qulification', width: 80},
            {label: '婚姻状况', name: 'marriageenumvaluename', width: 80}, {
                label: '专业职称',
                name: 'academictitle',
                width: 80
            },
            {label: '毕业院校', name: 'school', width: 80},
            {label: '状态', name: 'statusenumvaluename', width: 80}, {
                label: '所属组织',
                name: 'orgidname',
                width: 80
            }, {label: '所属部门', name: 'deptIdname', width: 80}, {label: '创建时间', name: 'createTime', width: 80}
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
    vm.getRef1015();
    vm.getRef1016();
    vm.getRef1017();
    vm.getRef1018();
    vm.getRef1020();
    vm.getRefTreeorganizationorgid();
    vm.getRefTreesys_deptdeptId();


    initGridHeight();
});