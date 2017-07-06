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
                                                                            enshipname:"",                                                                 chshipname:"",                                                                 expvoyage:"",                                                                 impvoyage:"",                                                                 arrivalstate:"",                                                                 arrivaldate:"",                                                                 shipid:"",                                                                 imono:"",                                                                 dockcode:"",                                                                 dockname:"",                                                                 dockunit:"",                                                                 route:"",                                                                 arrivaltime:"",                                                                 leavetime:"",                                                                 shipment:"",                                                                 remark:""                            
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
		
        //创建实体类
        shipplan: {
                                                                                        enshipname:"",                                                                 chshipname:"",                                                                 expvoyage:"",                                                                 impvoyage:"",                                                                 arrivalstate:"",                                                                 arrivaldate:"",                                                                 shipid:"",                                                                 imono:"",                                                                 dockcode:"",                                                                 dockname:"",                                                                 dockunit:"",                                                                 route:"",                                                                 arrivaltime:"",                                                                 leavetime:"",                                                                 shipment:"",                                                                 remark:""                            
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
			vm.shipplan = {
                //参照的虚拟字段也必须先声明好,不然饿了么ui组件不能双向绑定
                                                                                                                                            enshipname:"",                                                                                                                                     chshipname:"",                                                                                                                                     expvoyage:"",                                                                                                                                     impvoyage:"",                                                                                                                                     arrivalstate:"",                                                                                                                                     arrivaldate:"",                                                                                                                                     shipid:"",                                                                                                                                     imono:"",                                                                                                                                     dockcode:"",                                                                                                                                     dockname:"",                                                                                                                                     dockunit:"",                                                                                                                                     route:"",                                                                                                                                     arrivaltime:"",                                                                                                                                     leavetime:"",                                                                                                                                     shipment:"",                                                                                                                                     remark:""                                                            
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
			var url = vm.shipplan.id == null ? "../shipplan/save" : "../shipplan/update";
			$.ajax({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.shipplan),
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
				    url: "../shipplan/delete",
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
		
        //生成弹出树形空间参照
        
        getInfo: function(id){
            $.get("../shipplan/info/"+id, function(r){
                vm.shipplan = r.shipplan;
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

            if(!vm.shipplan.files){
                vm.shipplan.files=[];
            }
            if(response.page.list&&response.page.list.length>0){
                vm.shipplan.files.push(response.page.list[0]);
            }


        },

        upload_on_change: function (file, fileList) {
            this.fileslist = fileList;
        }
	}
});

$(function () {
    $("#jqGrid").jqGrid({
        url: '../shipplan/list',
        datatype: "json",
        colModel: [
			                                                            { label: 'id', name: 'id', width: 50, key: true,hidden:true },
                                    			                                                            { label: '英文船名', name: 'enshipname', width: 80 }, 
                                    			                                                            { label: '中文船名', name: 'chshipname', width: 80 }, 
                                    			                                                            { label: '出口航次', name: 'expvoyage', width: 80 }, 
                                    			                                                            { label: '进口航次', name: 'impvoyage', width: 80 }, 
                                    			                                                            { label: '到港状态', name: 'arrivalstate', width: 80 }, 
                                    			                                                            { label: '预计到港日期', name: 'arrivaldate', width: 80 }, 
                                    			                                                            { label: '船舶呼号', name: 'shipid', width: 80 }, 
                                    			                                                            { label: 'IMO编码', name: 'imono', width: 80 }, 
                                    			                                                            { label: '码头代码', name: 'dockcode', width: 80 }, 
                                    			                                                            { label: '码头名称', name: 'dockname', width: 80 }, 
                                    			                                                            { label: '靠泊单位', name: 'dockunit', width: 80 }, 
                                    			                                                            { label: '航线', name: 'route', width: 80 }, 
                                    			                                                            { label: '预计到港时间', name: 'arrivaltime', width: 80 }, 
                                    			                                                            { label: '预计离港时间', name: 'leavetime', width: 80 }, 
                                    			                                                            { label: '船期', name: 'shipment', width: 80 }, 
                                    			                                                            { label: '备注', name: 'remark', width: 80 }
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