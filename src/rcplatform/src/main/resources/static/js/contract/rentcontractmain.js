//生成弹出树形空间参照
                   var ztreeorgid;
                                                                                
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
                                                                            billno:"",                                                                 orgid:"",                                                                 linkman:"",                                                                 mobile:"",                                                                 paytype:"",                                                                 paycircle:"",                                                                 boctid:"",                                                                 rate:"",                                                                 taxrate:"",                                                                 rentprice:"",                                                                 rentmonth:"",                                                                 renttotal:"",                                                                 bgndate:"",                                                                 enddate:"",                                                                 remark:"",                                                                 billstatus:"",                                                                 makeuser:"",                                                                 makedate:"",                                                                 accuser:"",                                                                 accdate:"",                                                                 uptdate:""                            
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
					                								                					ref_paytype:[],

                								                                    ref_enum1010:[],
                								                					ref_boctype:[],

                								                                    ref_enum1003:[],
                					
        //创建实体类
        rentcontractmain: {
                                                orgidname:"",
                                                                paytypename:"",
                                                                paycircleenumvaluename:"",
                                                                boctidboctypename:"",
                                                                billstatusenumvaluename:"",
                                                                                                        billno:"",                                                                 orgid:"",                                                                 linkman:"",                                                                 mobile:"",                                                                 paytype:"",                                                                 paycircle:"",                                                                 boctid:"",                                                                 rate:"",                                                                 taxrate:"",                                                                 rentprice:"",                                                                 rentmonth:"",                                                                 renttotal:"",                                                                 bgndate:"",                                                                 enddate:"",                                                                 remark:"",                                                                 billstatus:"",                                                                 makeuser:"",                                                                 makedate:"",                                                                 accuser:"",                                                                 accdate:"",                                                                 uptdate:""                            
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
			vm.rentcontractmain = {
                //参照的虚拟字段也必须先声明好,不然饿了么ui组件不能双向绑定
                                                            orgidname:"",
                                                                                paytypename:"",
                                                                                paycircleenumvaluename:"",
                                                                                boctidboctypename:"",
                                                                                billstatusenumvaluename:"",
                                                                                                                                                                billno:"*",                                                                                                                                     orgid:"",                                                                                                                                     linkman:"",                                                                                                                                     mobile:"",                                                                                                                                     paytype:"",                                                                                                                                     paycircle:"",                                                                                                                                     boctid:"",                                                                                                                                     rate:"",                                                                                                                                     taxrate:"",                                                                                                                                     rentprice:"",                                                                                                                                     rentmonth:"",                                                                                                                                     renttotal:"",                                                                                                                                     bgndate:"",                                                                                                                                     enddate:"",                                                                                                                                     remark:"",                                                                                                                                     billstatus:"",                                                                                                                                     makeuser:gUserName,                                                                                                                                     makedate:mktime,                                                                                                                                     accuser:"",                                                                                                                                     accdate:"",                                                                                                                                     uptdate:""                                                            
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
			var url = vm.rentcontractmain.id == null ? "../rentcontractmain/save" : "../rentcontractmain/update";
			$.ajax({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.rentcontractmain),
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
				    url: "../rentcontractmain/delete",
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
										                getRefpaytype: function () {
                    $.get("../paytype/list?page=1&limit=1000", function (r) {
                        vm.ref_paytype = r.page.list;
                    });
                },

            					                getRef1010: function () {
                    $.get("../enumtable/listone?enumid=1010&page=1&limit=1000", function (r) {
                        vm.ref_enum1010 = r.page.list;
                    });
                },
            					                getRefboctype: function () {
                    $.get("../boctype/list?page=1&limit=1000", function (r) {
                        vm.ref_boctype = r.page.list;
                    });
                },

            					                getRef1003: function () {
                    $.get("../enumtable/listone?enumid=1003&page=1&limit=1000", function (r) {
                        vm.ref_enum1003 = r.page.list;
                    });
                },
            		
        //生成弹出树形空间参照

        getRefTreeorganizationorgid: function(menuId){
            //加载菜单树
            $.get("../organization/select", function(r){
                ztreeorgid = $.fn.zTree.init($("#refTreeorganization"), setting, r.treeList);
                var node = ztreeorgid.getNodeByParam("id", vm.rentcontractmain.orgid);
                ztreeorgid.selectNode(node);
                vm.rentcontractmain.orgidname = node.name;

            })
        },

        openRefTreeorganizationorgid: function(){
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
                    var node = ztreeorgid.getSelectedNodes();
                    //选择上级菜单
                    vm.rentcontractmain.orgid = node[0].id;
                    vm.rentcontractmain.orgidname = node[0].name;

                    layer.close(index);
                }
            });
        },
                audit:function(event){
            var ids = getSelectedRows();
            if(ids == null){
                return ;
            }

            confirm('确定要审核选中的记录？', function(){
                $.ajax({
                    type: "POST",
                    url: "../rentcontractmain/audit",
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

        unaudit:function(){
            var ids = getSelectedRows();
            if(ids == null){
                return ;
            }

            confirm('确定要反审核选中的记录？', function(){
                $.ajax({
                    type: "POST",
                    url: "../rentcontractmain/unaudit",
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
        
        getInfo: function(id){
            $.get("../rentcontractmain/info/"+id, function(r){
                vm.rentcontractmain = r.rentcontractmain;
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
        url: '../rentcontractmain/list',
        datatype: "json",
        colModel: [
							                    { label: 'id', name: 'id', width: 50, key: true,hidden:true },
                							                    { label: '单据号', name: 'billno', width: 80 }, 
											                    { label: '客户', name: 'orgidname', width: 80 },                 							                    { label: '客户联系人', name: 'linkman', width: 80 }, 
											                    { label: '客户联系电话', name: 'mobile', width: 80 }, 
											                    { label: '付款方式', name: 'paytypename', width: 80 },                 							                    { label: '结算周期', name: 'paycircleenumvaluename', width: 80 },                 							                    { label: '币别', name: 'boctidboctypename', width: 80 },                 							                    { label: '汇率', name: 'rate', width: 80 }, 
											                    { label: '税率', name: 'taxrate', width: 80 }, 
											                    { label: '月租金', name: 'rentprice', width: 80 }, 
											                    { label: '租期(月)', name: 'rentmonth', width: 80 }, 
											                    { label: '总金额', name: 'renttotal', width: 80 }, 
											                    { label: '生效日期', name: 'bgndate', width: 80 }, 
											                    { label: '失效日期', name: 'enddate', width: 80 }, 
											                    { label: '备注', name: 'remark', width: 80 }, 
											                    { label: '单据状态', name: 'billstatus', width: 80 ,formatter:formater_billstatus}, 
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
			            vm.getRefTreeorganizationorgid();
					            vm.getRefpaytype();
        			            vm.getRef1010();
        			            vm.getRefboctype();
        			            vm.getRef1003();
        	



    initGridHeight();
});