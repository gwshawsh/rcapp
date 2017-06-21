//生成弹出树形空间参照
                                           var ztreeorganization;
        
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
    }
};

var vm = new Vue({
	el:'#rrapp',
	data:{
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
					                								                                    ref_enum2001:[],
                					
        //创建实体类
        place: {
                                                organizationname:"",
                                                                placetypeenumvaluename:"",
                                                                                                        code:"",                                                                 name:"",                                                                 linkman:"",                                                                 phone:"",                                                                 address:"",                                                                 longitude:"",                                                                 latitude:"",                                                                 organization:"",                                                                 placetype:""                            
        }
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
            var mktime = moment().format("YYYY-MM-DD");
			vm.showList = false;
			vm.title = "新增";
			vm.place = {
            //参照的虚拟字段也必须先声明好,不然饿了么ui组件不能双向绑定
                                                organizationname:"",
                                                                placetypeenumvaluename:"",
                                                                                                                                                                                code:"",                                                                                                                                                             name:"",                                                                                                                                                             linkman:"",                                                                                                                                                             phone:"",                                                                                                                                                             address:"",                                                                                                                                                             longitude:"",                                                                                                                                                             latitude:"",                                                                                                                                                             organization:"",                                                                                                                                                             placetype:""                                                                        
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
			var url = vm.place.id == null ? "../place/save" : "../place/update";
			$.ajax({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.place),
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
				    url: "../place/delete",
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

        //生成参照调用弹出框函数
																																																				
        //生成参照调用下拉框函数,用来初始化远程数据
										                getRef2001: function () {
                    $.get("../enumtable/listone?enumid=2001&page=1&limit=1000", function (r) {
                        vm.ref_enum2001 = r.page.list;
                    });
                },
            		
        //生成弹出树形空间参照

        getRefTreeorganizationorganization: function(menuId){
            //加载菜单树
            $.get("../organization/select", function(r){
                ztreeorganization = $.fn.zTree.init($("#refTreeorganization"), setting, r.treeList);
                var node = ztreeorganization.getNodeByParam("id", vm.place.organization);
                ztreeorganization.selectNode(node);
                vm.place.organizationname = node.name;

            })
        },

        openRefTreeorganizationorganization: function(){
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
                    var node = ztreeorganization.getSelectedNodes();
                    //选择上级菜单
                    vm.place.organization = node[0].id;
                    vm.place.organizationname = node[0].name;

                    layer.close(index);
                }
            });
        },


        getInfo: function(id){
            $.get("../place/info/"+id, function(r){
                vm.place = r.place;
            });
        },
        reload: function (event) {
            vm.showList = true;
            var page = $("#jqGrid").jqGrid('getGridParam','page');
            $("#jqGrid").jqGrid('setGridParam',{
                page:page
            }).trigger("reloadGrid");
        }
	}
});

$(function () {
    $("#jqGrid").jqGrid({
        url: '../place/list',
        datatype: "json",
        colModel: [
							                    { label: 'id', name: 'id', width: 50, key: true },
                							                    { label: '编码', name: 'code', width: 80 }, 
											                    { label: '名称', name: 'name', width: 80 }, 
											                    { label: '联系人', name: 'linkman', width: 80 }, 
											                    { label: '联系电话', name: 'phone', width: 80 }, 
											                    { label: '地址', name: 'address', width: 80 }, 
											                    { label: '经度', name: 'longitude', width: 80 }, 
											                    { label: '纬度', name: 'latitude', width: 80 }, 
											                    { label: '所属组织', name: 'organizationname', width: 80 },                 							                    { label: '地点类型', name: 'placetypeenumvaluename', width: 80 }                			        ],
        viewrecords: true,
        height: 385,
        rowNum: 10,
        rowList : [10,30,50],
        rownumbers: true,
        rownumWidth: 25,
        autowidth: true,
        autoScroll: true,
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
        shrinkToFit:false,
        gridComplete:function(){
            //隐藏grid底部滚动条
            //$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });
        }
    });

    //执行调用参照调用下拉框函数,初始化下拉数据
			            vm.getRefTreeorganizationorganization();
					            vm.getRef2001();
        	



    initGridHeight();
});