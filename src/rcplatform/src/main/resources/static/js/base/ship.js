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
					                					ref_region:[],

                					
        //创建实体类
        ship: {
                                                regionname:"",
                                                                                                        code:"",                                                                 name:"",                                                                 enname:"",                                                                 region:"",                                                                 uncode:"",                                                                 type:"",                                                                 company:"",                                                                 coscode:"",                                                                 cosshipenname:"",                                                                 country:"",                                                                 contact:"",                                                                 address:"",                                                                 phone:"",                                                                 route:""                            
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
			vm.ship = {
            //参照的虚拟字段也必须先声明好,不然饿了么ui组件不能双向绑定
                                                regionname:"",
                                                                                                                                                                                code:"",                                                                                                                                                             name:"",                                                                                                                                                             enname:"",                                                                                                                                                             region:"",                                                                                                                                                             uncode:"",                                                                                                                                                             type:"",                                                                                                                                                             company:"",                                                                                                                                                             coscode:"",                                                                                                                                                             cosshipenname:"",                                                                                                                                                             country:"",                                                                                                                                                             contact:"",                                                                                                                                                             address:"",                                                                                                                                                             phone:"",                                                                                                                                                             route:""                                                                        
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
			var url = vm.ship.id == null ? "../ship/save" : "../ship/update";
			$.ajax({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.ship),
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
				    url: "../ship/delete",
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
					                getRefregion: function () {
                    $.get("../region/list?page=1&limit=1000", function (r) {
                        vm.ref_region = r.page.list;
                    });
                },

            		
        //生成弹出树形空间参照


        getInfo: function(id){
            $.get("../ship/info/"+id, function(r){
                vm.ship = r.ship;
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
        url: '../ship/list',
        datatype: "json",
        colModel: [
							                    { label: 'id', name: 'id', width: 50, key: true },
                							                    { label: '编码', name: 'code', width: 80 }, 
											                    { label: '中文名称', name: 'name', width: 80 }, 
											                    { label: '英文名称', name: 'enname', width: 80 }, 
											                    { label: '所属区域', name: 'regionname', width: 80 },                 							                    { label: 'UN代码', name: 'uncode', width: 80 }, 
											                    { label: '类型', name: 'type', width: 80 }, 
											                    { label: '所属船公司', name: 'company', width: 80 }, 
											                    { label: 'COS代码', name: 'coscode', width: 80 }, 
											                    { label: 'COS船英文名', name: 'cosshipenname', width: 80 }, 
											                    { label: '所属国家', name: 'country', width: 80 }, 
											                    { label: '联系人', name: 'contact', width: 80 }, 
											                    { label: '地址', name: 'address', width: 80 }, 
											                    { label: '电话', name: 'phone', width: 80 }, 
											                    { label: '航线', name: 'route', width: 80 }
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
			            vm.getRefregion();
        	



    initGridHeight();
});