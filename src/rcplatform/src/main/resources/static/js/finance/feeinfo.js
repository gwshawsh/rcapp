var ztree;
//生成弹出树形空间参照
                                                        


var vm = new Vue({
	el:'#rrapp',
	data:{
        q:{
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
                                                        ref_enum2006:[],
                                                                                    ref_enum1011:[],
                                                                                    ref_transline:[],

                                                                                    ref_boxs:[],

                                                                                    ref_enum2004:[],
                                    
        //创建实体类
        feeinfo: {
                                                feetypeenumvaluename:"",
                                                                paytypeenumvaluename:"",
                                                                lineidname:"",
                                                                boxtypeboxsize:"",
                                                                nodetypeenumvaluename:"",
                                                                                                        parentId:"",                                                                 code:"",                                                                 name:"",                                                                 feetype:"",                                                                 paytype:"",                                                                 lineid:"",                                                                 boxtype:"",                                                                 price:"",                                                                 cost:"",                                                                 remark:"",                                                                 status:"",                                                                 nodetype:"",                                                                 uptdate:""                            
        }
	},
	methods: {
		query: function () {
            vm.reload();
            vm.getLeftTree();
		},
        getLeftTree: function(menuId){
            //加载菜单树
            $.get("../feeinfo/select", function(r){
                ztreeLeft = $.fn.zTree.init($("#leftTree"), setting, r.treeList);
                var node2 = ztreeLeft.getNodeByParam("id", vm.feeinfo.parentId);
                ztreeLeft.selectNode(node2);

            })
        },
		add: function(){
            var mktime = moment().format("YYYY-MM-DD");
            vm.showList = false;
            vm.title = "新增";
            vm.feeinfo = {
            //参照的虚拟字段也必须先声明好,不然饿了么ui组件不能双向绑定
                                                feetypeenumvaluename:"",
                                                                paytypeenumvaluename:"",
                                                                lineidname:"",
                                                                boxtypeboxsize:"",
                                                                nodetypeenumvaluename:"",
                                                                                                                                parentId:"",                                                                                                             code:"",                                                                                                             name:"",                                                                                                             feetype:"",                                                                                                             paytype:"",                                                                                                             lineid:"",                                                                                                             boxtype:"",                                                                                                             price:"",                                                                                                             cost:"",                                                                                                             remark:"",                                                                                                             status:"",                                                                                                             nodetype:"",                                                                                                             uptdate:""                                                
        };
		},
		update: function (event) {
			var id = getSelectedRow();
			if(id == null){
				return ;
			}
			vm.showList = false;
            vm.title = "修改";

            vm.getInfo(id)
		},
		saveOrUpdate: function (event) {
			var url = vm.feeinfo.id == null ? "../feeinfo/save" : "../feeinfo/update";
			$.ajax({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.feeinfo),
			    success: function(r){
			    	if(r.code === 0){
						alert('操作成功', function(index){
							vm.reload();
						});
					}else{
						alert(r.msg);
					}
				}
			});
		},
		del: function (event) {
			var ids = getSelectedRows();
			if(ids == null){
				return ;
			}

			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: "../feeinfo/delete",
				    data: JSON.stringify(ids),
				    success: function(r){
						if(r.code == 0){
							alert('操作成功', function(index){
								$("#jqGrid").trigger("reloadGrid");
							});
						}else{
							alert(r.msg);
						}
					}
				});
			});
		},
		getInfo: function(id){
			$.get("../feeinfo/info/"+id, function(r){
                vm.feeinfo = r.feeinfo;
            });
		},
        //生成参照调用弹出框函数
                                                                                                                                                                                                                                                                                                
        //生成参照调用下拉框函数,用来初始化远程数据
                                    getRef2006: function () {
                    $.get("../enumtable/listone?enumid=2006&page=1&limit=1000", function (r) {
                        vm.ref_enum2006 = r.page.list;
                    });
                },
                                                getRef1011: function () {
                    $.get("../enumtable/listone?enumid=1011&page=1&limit=1000", function (r) {
                        vm.ref_enum1011 = r.page.list;
                    });
                },
                                                getReftransline: function () {
                    $.get("../transline/list?page=1&limit=1000", function (r) {
                        vm.ref_transline = r.page.list;
                    });
                },

                                                getRefboxs: function () {
                    $.get("../boxs/list?page=1&limit=1000", function (r) {
                        vm.ref_boxs = r.page.list;
                    });
                },

                                                getRef2004: function () {
                    $.get("../enumtable/listone?enumid=2004&page=1&limit=1000", function (r) {
                        vm.ref_enum2004 = r.page.list;
                    });
                },
                            //生成弹出树形空间参照
                                                                                                                                                                                                                                                                                                        menuTree: function(){
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
                    vm.feeinfo.parentId = node[0].id;
                    vm.feeinfo.parentName = node[0].name;

                    layer.close(index);
                }
            });
        },
		reload: function (event) {
			vm.showList = true;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{
                page:page,
                postData:{'id':vm.q.id}
            }).trigger("reloadGrid");
		},
        onClickNode:function(event, treeId, treeNode) {
            if(vm.showList) {
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
            url:"nourl"
        }
    },
    callback:{
        onClick:vm.onClickNode
    }
};

$(function () {
    $("#jqGrid").jqGrid({
        url: '../feeinfo/list',
        datatype: "json",
        colModel: [
							                    { label: 'id', name: 'id', width: 50, key: true ,hidden:true},
											                    { label: '上级费用', name: 'parentId', width: 80 }, 
											                    { label: '编码', name: 'code', width: 80 }, 
											                    { label: '名称', name: 'name', width: 80 }, 
											                    { label: '类型', name: 'feetype', width: 80 }, 
											                    { label: '收付款', name: 'paytype', width: 80 }, 
											                    { label: '线路', name: 'lineid', width: 80 }, 
											                    { label: '箱型', name: 'boxtype', width: 80 }, 
											                    { label: '标准单价', name: 'price', width: 80 }, 
											                    { label: '标准成本', name: 'cost', width: 80 }, 
											                    { label: '备注', name: 'remark', width: 80 }, 
											                    { label: '状态', name: 'status', width: 80 }, 
											                    { label: '节点类型', name: 'nodetype', width: 80 }, 
											                    { label: '更新时间', name: 'uptdate', width: 80 }
							        ],
        viewrecords: true,
        height: 385,
        rowNum: 10,
        rowList : [10,30,50],
        rownumbers: true,
        rownumWidth: 25,
        autowidth: true,
        autoScroll: true,
        shrinkToFit:false,
        multiselect: true,
        pager: "#jqGridPager",
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
            //$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });
        }
    });
    //执行调用参照调用下拉框函数,初始化下拉数据
                        vm.getRef2006();
                                vm.getRef1011();
                                vm.getReftransline();
                                vm.getRefboxs();
                                vm.getRef2004();
            
    vm.getLeftTree();

	initGridHeight();
});