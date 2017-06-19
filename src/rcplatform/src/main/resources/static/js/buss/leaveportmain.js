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
					                								                								                					ref_boxs:[],

                					
        //创建实体类
        leaveportmain: {
                                                portname:"",
                                                                shipcompanyname:"",
                                                                boxtypeboxsize:"",
                                                                                                        billno:"",                                                                 port:"",                                                                 shipcompany:"",                                                                 boxqty:"",                                                                 boxtype:"",                                                                 takeboxplaceid:"",                                                                 endplaceid:"",                                                                 planarrporttime:"",                                                                 planarrtime:"",                                                                 billuser:"",                                                                 billdate:"",                                                                 accuser:"",                                                                 accdate:"",                                                                 uptdate:""                            
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
			vm.leaveportmain = {
            //参照的虚拟字段也必须先声明好,不然饿了么ui组件不能双向绑定
                                                portname:"",
                                                                shipcompanyname:"",
                                                                boxtypeboxsize:"",
                                                                                                                                                                                billno:"*",                                                                                                                                                             port:"",                                                                                                                                                             shipcompany:"",                                                                                                                                                             boxqty:"",                                                                                                                                                             boxtype:"",                                                                                                                                                             takeboxplaceid:"",                                                                                                                                                             endplaceid:"",                                                                                                                                                             planarrporttime:"",                                                                                                                                                             planarrtime:"",                                                                                                                                                             billuser:"",                                                                                                                                                             billdate:"",                                                                                                                                                             accuser:"",                                                                                                                                                             accdate:"",                                                                                                                                                             uptdate:""                                                                        
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
			var url = vm.leaveportmain.id == null ? "../leaveportmain/save" : "../leaveportmain/update";
			$.ajax({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.leaveportmain),
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
				    url: "../leaveportmain/delete",
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
															                selectportplace: function (event) {
                    showrefgrid_place("参照", function (data) {
                        var seldata = data;
                        vm.leaveportmain.port =seldata['id'];
                        vm.leaveportmain.portplacename =seldata['name'];
                    });
                },
								                selectshipcompanyorganization: function (event) {
                    showrefgrid_organization("参照", function (data) {
                        var seldata = data;
                        vm.leaveportmain.shipcompany =seldata['id'];
                        vm.leaveportmain.shipcompanyorganizationname =seldata['name'];
                    });
                },
																		                selecttakeboxplaceidplace: function (event) {
                    showrefgrid_place("参照", function (data) {
                        var seldata = data;
                        vm.leaveportmain.takeboxplaceid =seldata['id'];
                        vm.leaveportmain.takeboxplaceidplacename =seldata['name'];
                    });
                },
								                selectendplaceidplace: function (event) {
                    showrefgrid_place("参照", function (data) {
                        var seldata = data;
                        vm.leaveportmain.endplaceid =seldata['id'];
                        vm.leaveportmain.endplaceidplacename =seldata['name'];
                    });
                },
																																								
        //生成参照调用下拉框函数,用来初始化远程数据
															                getRefboxs: function () {
                    $.get("../boxs/list?page=1&limit=1000", function (r) {
                        vm.ref_boxs = r.page.list;
                    });
                },

            		
        //生成弹出树形空间参照


        getInfo: function(id){
            $.get("../leaveportmain/info/"+id, function(r){
                vm.leaveportmain = r.leaveportmain;
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
        url: '../leaveportmain/list',
        datatype: "json",
        colModel: [
							                    { label: 'id', name: 'id', width: 50, key: true },
                							                    { label: '单据号', name: 'billno', width: 80 }, 
											                    { label: '港口', name: 'portname', width: 80 },                 							                    { label: '船公司', name: 'shipcompanyname', width: 80 },                 							                    { label: '箱量', name: 'boxqty', width: 80 }, 
											                    { label: '箱型', name: 'boxtypeboxsize', width: 80 },                 							                    { label: '提箱场站', name: 'takeboxplaceidname', width: 80 },                 							                    { label: '目的地', name: 'endplaceidname', width: 80 },                 							                    { label: '预计到港时间', name: 'planarrporttime', width: 80 }, 
											                    { label: '预计到场时间', name: 'planarrtime', width: 80 }, 
											                    { label: '制单人', name: 'billuser', width: 80 }, 
											                    { label: '制单日期', name: 'billdate', width: 80 }, 
											                    { label: '审核人', name: 'accuser', width: 80 }, 
											                    { label: '审核日期', name: 'accdate', width: 80 }, 
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
									            vm.getRefboxs();
        	



    initGridHeight();
});