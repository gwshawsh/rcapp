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
                                                                            parentId:"",                                                                 code:"",                                                                 name:"",                                                                 feetype:"",                                                                 paytype:"",                                                                 lineid:"",                                                                 boxtype:"",                                                                 price:"",                                                                 cost:"",                                                                 remark:"",                                                                 status:"",                                                                 nodetype:"",                                                                 uptdate:""                            
        },
		showList: true,
        showQuery:false,
        showDetailList:true,
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
	    showQueryPanel:function(){
	        vm.showQuery=!vm.showQuery;
        },
		query: function () {
			vm.reload();
		},
		add: function(){
            var mktime = moment().format("YYYY-MM-DD");
			vm.showList = false;
			vm.showDetailList=false;
			vm.title = "新增";
			vm.feeinfo = {
                //参照的虚拟字段也必须先声明好,不然饿了么ui组件不能双向绑定
                                                            feetypeenumvaluename:"",
                                                                                paytypeenumvaluename:"",
                                                                                lineidname:"",
                                                                                boxtypeboxsize:"",
                                                                                nodetypeenumvaluename:"",
                                                                                                                                                                parentId:"",                                                                                                                                     code:"",                                                                                                                                     name:"",                                                                                                                                     feetype:"",                                                                                                                                     paytype:"",                                                                                                                                     lineid:"",                                                                                                                                     boxtype:"",                                                                                                                                     price:"",                                                                                                                                     cost:"",                                                                                                                                     remark:"",                                                                                                                                     status:"",                                                                                                                                     nodetype:"",                                                                                                                                     uptdate:""                                                            
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
        
        //查询单据明细
        queryDetail:function(){
                    },

        getInfo: function(id){
            $.get("../feeinfo/info/"+id, function(r){
                vm.feeinfo = r.feeinfo;
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

            if(!vm.feeinfo.files){
                vm.feeinfo.files=[];
            }
            if(response.page.list&&response.page.list.length>0){
                vm.feeinfo.files.push(response.page.list[0]);
            }


        },

        upload_on_change: function (file, fileList) {
            this.fileslist = fileList;
        }
	}
});

$(function () {
    $("#jqGrid").jqGrid({
        url: '../feeinfo/list',
        datatype: "json",
        colModel: [
			                                                            { label: 'id', name: 'id', width: 50, key: true,hidden:true },
                                    			                                                            { label: '上级费用', name: 'parentId', width: 80 }, 
                                    			                                                            { label: '编码', name: 'code', width: 80 }, 
                                    			                                                            { label: '名称', name: 'name', width: 80 }, 
                                    			                                                            { label: '类型', name: 'feetypeenumvaluename', width: 80 },                                     			                                                            { label: '收付款', name: 'paytypeenumvaluename', width: 80 },                                     			                                                            { label: '线路', name: 'lineidname', width: 80 },                                     			                                                            { label: '箱型', name: 'boxtypeboxsize', width: 80 },                                     			                                                            { label: '标准单价', name: 'price', width: 80 }, 
                                    			                                                            { label: '标准成本', name: 'cost', width: 80 }, 
                                    			                                                            { label: '备注', name: 'remark', width: 80 }, 
                                    			                                                            { label: '状态', name: 'status', width: 80 }, 
                                    			                                                            { label: '节点类型', name: 'nodetypeenumvaluename', width: 80 },                                     			                                                            { label: '更新时间', name: 'uptdate', width: 80 }
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
        onSelectRow:function(){
            vm.queryDetail();
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
        	
    
    initGridHeight();
});