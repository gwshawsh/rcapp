//jqGrid的配置信息
$.jgrid.defaults.width = 1000;
$.jgrid.defaults.responsive = true;
$.jgrid.defaults.styleUI = 'Bootstrap';

//工具集合Tools
window.T = {};

// 获取请求参数
// 使用示例
// location.href = http://localhost:8080/index.html?id=123
// T.p('id') --> 123;
var url = function(name) {
	var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
	var r = window.location.search.substr(1).match(reg);
	if(r!=null)return  unescape(r[2]); return null;
};
T.p = url;

//全局配置
$.ajaxSetup({
	dataType: "json",
	contentType: "application/json",
	cache: false
});

//重写alert
window.alert = function(msg, callback){
	parent.layer.alert(msg, function(index){
		parent.layer.close(index);
		if(typeof(callback) === "function"){
			callback("ok");
		}
	});
}

//重写confirm式样框
window.confirm = function(msg, callback){
	parent.layer.confirm(msg, {btn: ['确定','取消']},
	function(){//确定事件
		if(typeof(callback) === "function"){
			callback("ok");
		}
	});
}


layui.use(['jquery','layer','element','laydate'],function(){
	window.jQuery = window.$ = layui.jquery;
	window.layer = layui.layer;
	window.laydate=layui.laydate;
	var element = layui.element();


});


function initGridHeight(){
	$("#jqGrid").setGridHeight($(window).height() - 150);

	$(window).resize(function(){
		$(window).unbind("onresize");
		$("#jqGrid").setGridHeight($(window).height() - 150);
		$(window).bind("onresize", this);
	});
}

function initGridHeightHalf(pgrid){
	$(pgrid).setGridHeight(($(window).height()- 200)/2);

	$(window).resize(function(){
		$(window).unbind("onresize");
		$(pgrid).setGridHeight(($(window).height()-200)/2);
		$(window).bind("onresize", this);
	});
}

//选择一条记录
function getSelectedRow() {
    var grid = $("#jqGrid");
    var rowKey = grid.getGridParam("selrow");
    if(!rowKey){
    	//alert("请选择一条记录");
    	return ;
    }
    
    var selectedIDs = grid.getGridParam("selarrrow");
    if(selectedIDs.length > 1){
    	//alert("只能选择一条记录");
    	return ;
    }
    
    return selectedIDs[0];
}


//选择一条记录
function getSelectedRowData(gridid) {
	var tmpid=gridid||"jqGrid";
	var grid = $("#"+tmpid);
	var rowKey = grid.getGridParam("selrow");
	if(!rowKey){
		//alert("请选择一条记录");
		return ;
	}

	var row = grid.getRowData(rowKey);

	return row;
}

//选择多条记录
function getSelectedRows() {
    var grid = $("#jqGrid");
    var rowKey = grid.getGridParam("selrow");
    if(!rowKey){
    	alert("请选择一条记录");
    	return ;
    }
    
    return grid.getGridParam("selarrrow");
}

//通用的单据状态显示
function formater_billstatus(value, options, row){
	if(value==0)
		return	'<span class="label label-info">新增</span>';
	else if (value==1){
		return '<span class="label label-danger">已提交</span>';
	}
    else if(value==2){
        return '<span class="label label-success">已签收</span>';
    }
	else if(value==3){
		return '<span class="label label-success">审核中</span>';
	}
    else if(value==4){
        return '<span class="label label-success">完成</span>';
    }
    else if(value==9){
        return '<span class="label label-success">作废</span>';
    }
}


//通用的参照单据类型显示
function formater_billtype(value, options, row){
	if(value==0)
		return	'<span class="label label-info">手工</span>';
	else if(value==1)
		return	'<span class="label label-info">空箱</span>';
	else if (value==2){
		return '<span class="label label-danger">重箱</span>';
	}
	else if(value==3){
		return '<span class="label label-success">门店</span>';
	}
	else if(value==4){
		return '<span class="label label-success">预约</span>';
	}
}


//通用的参照地点类型显示
function formater_placetype(value, options, row){
	if(value==0)
		return	'<span class="label label-info">仓储</span>';
	else if(value==1)
		return	'<span class="label label-info">工厂</span>';
	else if (value==2){
		return '<span class="label label-danger">堆场</span>';
	}
	else if(value==3){
		return '<span class="label label-success">港口</span>';
	}

}

//通用组织类型
function formater_orgtype(value, options, row){
	if(value==0){
		return  '<span class="label label-danger">目录</span>';
	}
	else if(value==1){
		return  '<span class="label label-danger">港口</span>';
	}
	else if(value==2){
		return  '<span class="label label-danger">仓库</span>';
	} else if(value==3){
		return  '<span class="label label-danger">堆场</span>';
	} else if(value==4){
		return  '<span class="label label-danger">船公司</span>';
	}
	else{
		return  '<span class="label label-danger">放箱公司</span>';
	}

}


//通用文件下载
function formater_files(value, options, row){
     return "<a href='"+row['fileurl']+"'>"+value+"</a>";

}




function show_tree(json) {
	if($("#menuLayer").length<=0){
        var div = document.createElement("div");
        div.setAttribute("id", "menuLayer");
        div.setAttribute("style", "display: none;padding:10px;");
        div.innerHTML = "<ul id=\"menuTree\" class=\"ztree\"></ul>";
        document.body.appendChild(div);

	}
    var setting = {
        data: {
            simpleData: {
                enable: true,
                idKey: json.idKey || "",
                pIdKey: "parentId",
                rootPId: -1
            },
            key: {
                url:"nourl"
            }
        }
    };

    $.get(json.url, function(r){
        var ztree = $.fn.zTree.init(jQuery("#menuLayer").children(".ztree"), setting, r[json.listName||"treeList"]);
		var node = ztree.getNodeByParam(json.idKey, json.currentId);
		 ztree.selectNode(node);
        layer.open({
            type: 1,
            offset: '50px',
            skin: 'layui-layer-molv',
            title: "选择",
            area: ['300px', '450px'],
            shade: 0,
            shadeClose: false,
            content: jQuery("#menuLayer"),
            btn: ['确定', '取消'],
            btn1: function (index) {
                var node = ztree.getSelectedNodes();
                json.select(node)
                layer.close(index);
            }
        });
    })
}

//创建通用的审批过程表
function createBillCommentsGrid() {
    $("#jqGridComments").jqGrid({
        url: '../billcomments/list',
        datatype: "local",
        colModel: [
            { label: 'id', name: 'id', width: 50, key: true,hidden:true },
            { label: '单据号', name: 'billno', width: 80 },
            { label: '参照单据类型', name: 'refbilltypeenumvaluename', width: 80 },                                     			                                                            { label: '序号', name: 'serialno', width: 80 },
            { label: '审批', name: 'auditstatusenumvaluename', width: 80 },                                     			                                                            { label: '备注', name: 'remark', width: 80 },
            { label: '审核人', name: 'makeuserusername', width: 80 },                                     			                                                            { label: '审核日期', name: 'makedate', width: 80 },
            { label: '更新时间', name: 'uptdate', width: 80 },
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
        pager: "#jqGridPagerComments",
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
}

function createBillAttachmentsGrid() {
    $("#jqGridFiles").jqGrid({
        url: '../attachments/list',
        datatype: "local",
        colModel: [
            { label: 'id', name: 'id', width: 50, key: true,hidden:true },
            { label: '文件名', name: 'filename', width: 80 ,formatter:formater_files},
            { label: '地址', name: 'fileurl', width: 80,hidden:true },
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
        pager: "#jqGridPagerFiles",
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

   initGridHeightHalf("#jqGridFiles");
}