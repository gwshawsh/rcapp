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
	    q:{
                                                                            carcode:"",                                                                 carname:"",                                                                 carinfo:"",                                                                 driverid:"",                                                                 drivername:"",                                                                 ownertype:"",                                                                 transteam:"",                                                                 cartype:""                            
        },
		showList: true,
        showQuery:false,
		title: null,
        fileslist:[],
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
					                                    ref_enum2003:[],
                								                					ref_transteam:[],

                								                                    ref_enum1007:[],
                					
        //创建实体类
        car: {
                                                ownertypeenumvaluename:"",
                                                                transteamname:"",
                                                                cartypeenumvaluename:"",
                                                                                                        carcode:"",                                                                 carname:"",                                                                 carinfo:"",                                                                 driverid:"",                                                                 drivername:"",                                                                 ownertype:"",                                                                 transteam:"",                                                                 cartype:""                            
        }
	},
	methods: {
	    showQueryPanel:function(){
	        vm.showQuery=!vm.showQuery;
        },
		query: function () {
			vm.reload();
		},
		add: function(){
            var mktime = moment().format("YYYY-MM-DD");
			vm.showList = false;
			vm.title = "新增";
			vm.car = {
                //参照的虚拟字段也必须先声明好,不然饿了么ui组件不能双向绑定
                                                            ownertypeenumvaluename:"",
                                                                                transteamname:"",
                                                                                cartypeenumvaluename:"",
                                                                                                                                                                carcode:"",                                                                                                                                     carname:"",                                                                                                                                     carinfo:"",                                                                                                                                     driverid:"",                                                                                                                                     drivername:"",                                                                                                                                     ownertype:"",                                                                                                                                     transteam:"",                                                                                                                                     cartype:""                                                            
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
			var url = vm.car.id == null ? "../car/save" : "../car/update";
			$.ajax({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.car),
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
				    url: "../car/delete",
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
					                getRef2003: function () {
                    $.get("../enumtable/listone?enumid=2003&page=1&limit=1000", function (r) {
                        vm.ref_enum2003 = r.page.list;
                    });
                },
            					                getReftransteam: function () {
                    $.get("../transteam/list?page=1&limit=1000", function (r) {
                        vm.ref_transteam = r.page.list;
                    });
                },

            					                getRef1007: function () {
                    $.get("../enumtable/listone?enumid=1007&page=1&limit=1000", function (r) {
                        vm.ref_enum1007 = r.page.list;
                    });
                },
            		
        //生成弹出树形空间参照
        
        getInfo: function(id){
            $.get("../car/info/"+id, function(r){
                vm.car = r.car;
            });
        },
        reload: function (event) {
            vm.showList = true;
            var page = $("#jqGrid").jqGrid('getGridParam','page');
            $("#jqGrid").jqGrid('setGridParam',{
                postData: {'query': JSON.stringify(vm.q)},
                page:page
            }).trigger("reloadGrid");
        },
        upload_on_success:function (response,file,fileList) {

            if(!vm.car.files){
                vm.car.files=[];
            }
            if(response.page.list&&response.page.list.length>0){
                vm.car.files.push(response.page.list[0]);
            }


        },

        upload_on_change: function (file, fileList) {
            this.fileslist = fileList;
        }
	}
});

$(function () {
    $("#jqGrid").jqGrid({
        url: '../car/list',
        datatype: "json",
        colModel: [
			                                                            { label: 'id', name: 'id', width: 50, key: true,hidden:true },
                                    			                                                            { label: '编码', name: 'carcode', width: 80 }, 
                                    			                                                            { label: '车牌号', name: 'carname', width: 80 }, 
                                    			                                                            { label: '车辆辨识信息', name: 'carinfo', width: 80 }, 
                                    			                                                            { label: '主司机编码', name: 'driverid', width: 80 }, 
                                    			                                                            { label: '主司机姓名', name: 'drivername', width: 80 }, 
                                    			                                                            { label: '车辆所属', name: 'ownertypeenumvaluename', width: 80 },                                     			                                                            { label: '所属车队', name: 'transteamname', width: 80 },                                     			                                                            { label: '车辆类型', name: 'cartypeenumvaluename', width: 80 }                                    			        ],
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
			            vm.getRef2003();
        			            vm.getReftransteam();
        			            vm.getRef1007();
        	



    initGridHeight();
});