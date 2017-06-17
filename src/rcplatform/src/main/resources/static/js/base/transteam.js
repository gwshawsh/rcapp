
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
					                                    ref_enum2003:[],
                					
        //创建实体类
        transteam: {
                                                                            code:"",                                                                 name:"",                                                                 address:"",                                                                 contact:"",                                                                 contactNumber:"",                                                                 vehicleType:"",                                                                 billingInformation:"",                                                                 accountInformation:""                                    }
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
            var mktime = moment().format("YYYY-MM-DD");
			vm.showList = false;
			vm.title = "新增";
			vm.transteam = {
                                                                                                                                                    code:"",                                                                                                                                                             name:"",                                                                                                                                                             address:"",                                                                                                                                                             contact:"",                                                                                                                                                             contactNumber:"",                                                                                                                                                             vehicleType:"",                                                                                                                                                             billingInformation:"",                                                                                                                                                             accountInformation:""                                                                                    };
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
			var url = vm.transteam.id == null ? "../transteam/save" : "../transteam/update";
			$.ajax({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.transteam),
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
				    url: "../transteam/delete",
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
            		


        getInfo: function(id){
            $.get("../transteam/info/"+id, function(r){
                vm.transteam = r.transteam;
            });
        },
        reload: function (event) {
            vm.showList = true;
            var page = $("#jqGrid").jqGrid('getGridParam','page');
            $("#jqGrid").jqGrid('setGridParam',{
                page:page
            }).trigger("reloadGrid");
        },
	}
});

$(function () {
    $("#jqGrid").jqGrid({
        url: '../transteam/list',
        datatype: "json",
        colModel: [
							                    { label: 'id', name: 'id', width: 50, key: true },
                							                    { label: '编码', name: 'code', width: 80 }, 
											                    { label: '名称', name: 'name', width: 80 }, 
											                    { label: '地址', name: 'address', width: 80 }, 
											                    { label: '联系人', name: 'contact', width: 80 }, 
											                    { label: '联系电话', name: 'contactNumber', width: 80 }, 
											                    { label: '车辆类型', name: 'vehicleType', width: 80 }, 
											                    { label: '开票信息', name: 'billingInformation', width: 80 }, 
											                    { label: '账户信息', name: 'accountInformation', width: 80 }
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
				


    initGridHeight();
});