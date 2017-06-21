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
		
        //创建实体类
        baseOpBank: {
                                                                                        bobJobcode:"",                                                                 bobName:"",                                                                 bobAccountno:"",                                                                 bobBoctid:"",                                                                 bobAddress:"",                                                                 bobTel:"",                                                                 bobFax:"",                                                                 bobMan:"",                                                                 bobDel:"",                                                                 bobAddpid:"",                                                                 bobAdddate:"",                                                                 bobNote:""                            
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
			vm.baseOpBank = {
            //参照的虚拟字段也必须先声明好,不然饿了么ui组件不能双向绑定
                                                                                                                                                                bobJobcode:"",                                                                                                                                                             bobName:"",                                                                                                                                                             bobAccountno:"",                                                                                                                                                             bobBoctid:"",                                                                                                                                                             bobAddress:"",                                                                                                                                                             bobTel:"",                                                                                                                                                             bobFax:"",                                                                                                                                                             bobMan:"",                                                                                                                                                             bobDel:"",                                                                                                                                                             bobAddpid:"",                                                                                                                                                             bobAdddate:"",                                                                                                                                                             bobNote:""                                                                        
            };
		},
		update: function (event) {
			var bobTid = getSelectedRow();
			if(bobTid == null){
				return ;
			}
			vm.showList = false;
            vm.title = "修改";

            vm.getInfo(bobTid)
		},
		saveOrUpdate: function (event) {
			var url = vm.baseOpBank.bobTid == null ? "../baseopbank/save" : "../baseopbank/update";
			$.ajax({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.baseOpBank),
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
			var bobTids = getSelectedRows();
			if(bobTids == null){
				return ;
			}

			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: "../baseopbank/delete",
				    data: JSON.stringify(bobTids),
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


        getInfo: function(bobTid){
            $.get("../baseopbank/info/"+bobTid, function(r){
                vm.baseOpBank = r.baseOpBank;
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
        url: '../baseopbank/list',
        datatype: "json",
        colModel: [
							                    { label: 'bobTid', name: 'bobTid', width: 50, key: true },
                							                    { label: '编码', name: 'bobJobcode', width: 80 }, 
											                    { label: '名称', name: 'bobName', width: 80 }, 
											                    { label: '帐号', name: 'bobAccountno', width: 80 }, 
											                    { label: '币别', name: 'bobBoctid', width: 80 }, 
											                    { label: '地址', name: 'bobAddress', width: 80 }, 
											                    { label: '电话', name: 'bobTel', width: 80 }, 
											                    { label: '传真', name: 'bobFax', width: 80 }, 
											                    { label: '联系人', name: 'bobMan', width: 80 }, 
											                    { label: '假删', name: 'bobDel', width: 80 }, 
											                    { label: '创建人员', name: 'bobAddpid', width: 80 }, 
											                    { label: '创建日期', name: 'bobAdddate', width: 80 }, 
											                    { label: '备注', name: 'bobNote', width: 80 }
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