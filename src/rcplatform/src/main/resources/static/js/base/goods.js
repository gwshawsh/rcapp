
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
        goods: {
                                                                            classId:"",                                                                 name:"",                                                                 price:"",                                                                 gcount:"",                                                                 icon:"",                                                                 orderNum:""                                    }
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
            var mktime = moment().format("YYYY-MM-DD");
			vm.showList = false;
			vm.title = "新增";
			vm.goods = {
                                                                                                                                                    classId:"",                                                                                                                                                             name:"",                                                                                                                                                             price:"",                                                                                                                                                             gcount:"",                                                                                                                                                             icon:"",                                                                                                                                                             orderNum:""                                                                                    };
		},
		update: function (event) {
			var goodsId = getSelectedRow();
			if(goodsId == null){
				return ;
			}
			vm.showList = false;
            vm.title = "修改";

            vm.getInfo(goodsId)
		},
		saveOrUpdate: function (event) {
			var url = vm.goods.goodsId == null ? "../goods/save" : "../goods/update";
			$.ajax({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.goods),
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
			var goodsIds = getSelectedRows();
			if(goodsIds == null){
				return ;
			}

			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: "../goods/delete",
				    data: JSON.stringify(goodsIds),
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
		


        getInfo: function(goodsId){
            $.get("../goods/info/"+goodsId, function(r){
                vm.goods = r.goods;
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
        url: '../goods/list',
        datatype: "json",
        colModel: [
							                    { label: 'goodsId', name: 'goodsId', width: 50, key: true },
                							                    { label: '父菜单ID，一级菜单为0', name: 'classId', width: 80 }, 
											                    { label: '菜单名称', name: 'name', width: 80 }, 
											                    { label: '菜单URL', name: 'price', width: 80 }, 
											                    { label: '类型   0：目录   1：菜单   2：按钮', name: 'gcount', width: 80 }, 
											                    { label: '菜单图标', name: 'icon', width: 80 }, 
											                    { label: '排序', name: 'orderNum', width: 80 }
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