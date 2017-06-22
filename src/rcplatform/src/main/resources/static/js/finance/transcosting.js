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
                                                                            bgndate:"",                                                                 enddate:"",                                                                 lineid:"",                                                                 boxtype:"",                                                                 boxprice:"",                                                                 remark:"",                                                                 makeuser:"",                                                                 makedate:"",                                                                 accuser:"",                                                                 accdate:"",                                                                 uptdate:""                            
        },
		showList: true,
        showQuery:false,
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
					                					ref_transline:[],

                								                					ref_boxs:[],

                					
        //创建实体类
        transcosting: {
                                                lineidname:"",
                                                                boxtypeboxsize:"",
                                                                                                        bgndate:"",                                                                 enddate:"",                                                                 lineid:"",                                                                 boxtype:"",                                                                 boxprice:"",                                                                 remark:"",                                                                 makeuser:"",                                                                 makedate:"",                                                                 accuser:"",                                                                 accdate:"",                                                                 uptdate:""                            
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
			vm.transcosting = {
                //参照的虚拟字段也必须先声明好,不然饿了么ui组件不能双向绑定
                                                            lineidname:"",
                                                                                boxtypeboxsize:"",
                                                                                                                                                                bgndate:"",                                                                                                                                     enddate:"",                                                                                                                                     lineid:"",                                                                                                                                     boxtype:"",                                                                                                                                     boxprice:"",                                                                                                                                     remark:"",                                                                                                                                     makeuser:gUserName,                                                                                                                                     makedate:mktime,                                                                                                                                     accuser:"",                                                                                                                                     accdate:"",                                                                                                                                     uptdate:""                                                            
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
			var url = vm.transcosting.id == null ? "../transcosting/save" : "../transcosting/update";
			$.ajax({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.transcosting),
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
				    url: "../transcosting/delete",
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

            		
        //生成弹出树形空间参照
        
        getInfo: function(id){
            $.get("../transcosting/info/"+id, function(r){
                vm.transcosting = r.transcosting;
            });
        },
        reload: function (event) {
            vm.showList = true;
            var page = $("#jqGrid").jqGrid('getGridParam','page');
            $("#jqGrid").jqGrid('setGridParam',{
                postData: {'query': JSON.stringify(vm.q)},
                page:page
            }).trigger("reloadGrid");
        }
	}
});

$(function () {
    $("#jqGrid").jqGrid({
        url: '../transcosting/list',
        datatype: "json",
        colModel: [
							                    { label: 'id', name: 'id', width: 50, key: true,hidden:true },
                							                    { label: '生效日期', name: 'bgndate', width: 80 }, 
											                    { label: '失效日期', name: 'enddate', width: 80 }, 
											                    { label: '线路', name: 'lineidname', width: 80 },                 							                    { label: '箱型', name: 'boxtypeboxsize', width: 80 },                 							                    { label: '最低成本', name: 'boxprice', width: 80 }, 
											                    { label: '备注', name: 'remark', width: 80 }, 
											                    { label: '制单人', name: 'makeuser', width: 80 }, 
											                    { label: '制单日期', name: 'makedate', width: 80 }, 
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
			            vm.getReftransline();
        			            vm.getRefboxs();
        	



    initGridHeight();
});