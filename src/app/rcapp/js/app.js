const baseurl = "http://192.168.253.1:8888/";
	const STATUS_NEW=0;//新增
    const STATUS_SUBMIT=1;//已提交
    const STATUS_CLAIM=2;//已签收
    const STATUS_AUDITING =3;//审核中
    const STATUS_COMPLETE=4;//已完成
    const STATUS_REJECT = 5;//驳回
    const STATUS_REAPPLY=6;//重新申请
    const STATUS_CANCLE=9;//作废
    
    const YES=0;//通过
    const NO=1;//通过
   


function navigate(murl, value,value1,value2) {
	if(!murl) {
		mui.back();
		return;
	}
	console.log("navigate to : "+murl);console.log("value: "+value);console.log("value1: "+value1);
	mui.openWindow({
		url: murl,
		id: murl,
		preload: false,
		show: {
			aniShow: 'pop-in'
		},
		styles: {
			popGesture: 'hide'
		},
		waiting: {
			autoShow: true
		},
		extras: { 
			value: value,
			value1: value1,
			value2: value2,
		},
	});

}

function getbillname(type) {
	switch(type) {
		case 'ask':
			return "请购单";
		case 'order':
			return "订购单";
		case 'pay':
			return "付款单";
		case 'contract':
			return "合同";
		case 'leave':
			return "请假";
		default:
			return "";
	}
}

function getbillicon(type) {
	switch(type) {
		case 'ask':
			return "../images/qing.png";
		case 'order':
			return "../images/ding.png";
		case 'pay':
			return "../images/fu.png";
		case 'contract':
			return "../images/he.png";
		default:
			return "../images/default_head.png";
	}
}

function getbilldetailurl(type) {
	switch(type) {
		case 'ask':
			return "approval_deal.html";
		case 'order':
			return "approval_deal.html";
		case 'pay':
			return "approval_deal.html";
		case 'contract':
			return "approval_deal.html";
		case 'leave':
			return "leave_deal.html";
		default:
			return "approval_deal.html";
	}
}

function getauditurl(type) {
	var url ='';
	switch(type) {
		case 'ask':
			;break;
			
		case 'order':
			url = "ordermain";break;
		case 'pay':
			url = "paymentmain";break;
		case 'contract':
			url = "contractmain";break;
		case 'leave':
			url = "leaveworkmain";break;
		default:
			break;
	}
	return url+'/audit';
}

//重新修改申请
function toReapply(item){
	switch(item.type){
		case 'leave':
		navigate("leave_apply.html",item);
		break;
		default:
		mui.alert(getbillname(item.type)+"暂不支持移动端修改")
		break;;
	}
}


Date.prototype.format = function(fmt) { //author: meizz   
	var o = {
		"M+": this.getMonth() + 1, //月份   
		"d+": this.getDate(), //日   
		"h+": this.getHours(), //小时   
		"m+": this.getMinutes(), //分   
		"s+": this.getSeconds(), //秒   
		"q+": Math.floor((this.getMonth() + 3) / 3), //季度   
		"S": this.getMilliseconds() //毫秒   
	};
	if(/(y+)/.test(fmt))
		fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	for(var k in o)
		if(new RegExp("(" + k + ")").test(fmt))
			fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	return fmt;
}
var header = {
	props: {
		title: '',
		btn: '',
		to: '',
		value: '',

	},
	template: [

		'<header class="mui-bar mui-bar-nav">',
		'<span class="mui-icon mui-icon-back mui-action-back"></span>',
		'<h1  class="mui-title">{{title}}</h1>',
		'<button class=" mui-pull-right mui-btn-link" @click="navigate(to,value)" >{{btn}}</button>',
		'</header>'

	].join('')
};

Vue.component('rc-header', header);

Vue.component('rc-audit', {

	props: {
		item: '',
		complete: Function,
		
	},
	methods: {
		isreject:function(){//申请被驳回
			return this.item.billstatus==STATUS_REJECT;
		},
		url:function(){
			return getauditurl(this.item.type);
		},
		approval: function(auditstatus, comments,billstatus) {
			var that = this;
			if(billstatus){
				that.item.billstatus=billstatus;
			}
			that.item.billcommentsEntity = {auditstatus:auditstatus,remark:comments};
			query(that.url(), that.item, function(data) {
				that.complete();
			});
		},
		reject: function() {
			if(this.isreject()){//申请被驳回后撤回申请
				this.approval(NO, "撤销申请",STATUS_CANCLE);
				return;
			}
			
			var that = this;
			var btnArray = ['确定', '取消'];
			mui.prompt('请输入驳回意见', '请输入....', '', btnArray, function(e) {
				if(e.index == 0){
					that.approval(NO, e.value);
				}
				
			})
		},
		pass: function() {
			if(this.isreject()){
				toReapply(this.item);
				return;
			}
			
			
			var that = this;
			var btnArray = ['确定', '取消'];
			mui.prompt('确认审批通过', '请输入审批意见....', '', btnArray, function(e) {
				if(e.index == 0){
					that.approval(YES, e.value);
				}
			})
		},
		lefttext:function(){
			return this.isreject() ?"取消申请" :"驳回申请";
			
		},
		righttext:function(){
			return this.isreject() ?"修改申请" :"审批通过";
			
		},
		
	},
	template: [

		'<div style=" position:fixed;bottom:0; width: 100%;z-index: 2;" ><button id="pass" class="mui-btn mui-btn-block mui-btn-warning btn-bottom" @click="reject" style="width: 50%;">{{lefttext()}}</button>',
		'<button class="mui-btn mui-btn-block mui-btn-green btn-bottom" v-on:click="pass" style="width: 50%;right: 0;">{{righttext()}}</button></div>',

	].join('')
});

Vue.component('rc-comments', {
	data: function() {
		return {
			list: [], 
			
		}
	},
	props: {
		billno: String,	
	},
	watch: {		
		billno: function() {
			if(this.billno) {
				this.getcomments();
			}
		}

	},
	methods: {
		getcomments:function(){
			var that = this;
			query("todolist/listcomments",{billno:this.billno},
						function(d){
							that.list = d.data;
							
						},true);
		},
		
	},
	template: [
		
		'<ul class="mui-table-view " style="padding-top: 0; padding-bottom: 0;">',
					'<li v-for="item in list" class="mui-table-view-cell mui-media">',
					'	<a href="javascript:;">',
					'		<img class="mui-media-object mui-pull-left" src="item.src" onerror="src=\'../images/default_head.png\'">',
					'		<div class="mui-media-body">',
					'			<div style="display: inline-block;">',
					'			{{item.makeuserusername}}',
					'			<p class=\'mui-ellipsis\'>{{item.makedate}}</p>',
					'			<p >{{item.remark}}</p>', 
					'			</div>',
					'			<span class="vertical-center font-green position-right" style="right: 30px; display: inline-block;">{{item.auditstatusenumvaluename}}</span>',
					'		</div></a></li></ul>',
							
						

					

				
	].join('')
});

function getUsercode() {
	return localStorage.getItem('username') || "";
}

function getuserid() {
	return localStorage.getItem('userid') || "";
}

function getuserfullname() {
	return localStorage.getItem('userfullname') || "";
}

function getdeptid() {
	return localStorage.getItem('deptid') || "";
}

function getdeptname() {
	return localStorage.getItem('deptname') || "";
}

function query(url, datain, result, isform, nomask) {

	console.log(url + "  Formed:" + isform);
	console.log(JSON.stringify(datain));
	var mask = mui.createMask();
	return mui.ajax(baseurl + url, {
		data: isform ? datain : JSON.stringify(datain),
		contentType: isform ? "application/x-www-form-urlencoded" : "application/json",
		dataType: 'json', //服务器返回json格式数据
		type: 'post', //HTTP请求类型
		timeout: 10000, //超时时间设置为10秒；
		beforeSend: function() {
			if(!nomask) {
				plus.nativeUI.showWaiting();
				mask.show(); //显示遮罩层
			}

		},
		complete: function() {
			if(!nomask) {
				plus.nativeUI.closeWaiting();
				mask.close(); //关闭遮罩层
			}
		},
		success: function(dataout, textStatus, xhr) {
			console.log(JSON.stringify(dataout));
			if(dataout.code == 0) {
				result(dataout);
			} else {
				mui.alert(dataout.msg)
			}
		},
		error: function(xhr, type, errorThrown) {
			mui.alert('服务器连接超时，请稍后再试');

			mask.close();

		}
	})
}

(function($, owner) {
	/**
	 * 用户登录
	 **/
	owner.login = function(loginInfo, callback) {
		callback = callback || $.noop;
		loginInfo = loginInfo || {};
		loginInfo.account = loginInfo.account || '';
		loginInfo.password = loginInfo.password || '';
		if(loginInfo.account.length < 5) {
			return callback('账号最短为 5 个字符');
		}
		if(loginInfo.password.length < 6) {
			return callback('密码最短为 6 个字符');
		}

		var users = JSON.parse(localStorage.getItem('$users') || '[]');
		var authed = users.some(function(user) {
			return loginInfo.account == user.account && loginInfo.password == user.password;
		});
		if(authed) {
			return owner.createState(loginInfo.account, callback);
		} else {
			return callback('用户名或密码错误');
		}
	};

	owner.createState = function(name, callback) {
		var state = owner.getState();
		state.account = name;
		state.token = "token123456789";
		owner.setState(state);
		return callback();
	};

	/**
	 * 新用户注册
	 **/
	owner.reg = function(regInfo, callback) {
		callback = callback || $.noop;
		regInfo = regInfo || {};
		regInfo.account = regInfo.account || '';
		regInfo.password = regInfo.password || '';
		if(regInfo.account.length < 5) {
			return callback('用户名最短需要 5 个字符');
		}
		if(regInfo.password.length < 6) {
			return callback('密码最短需要 6 个字符');
		}
		if(!checkEmail(regInfo.email)) {
			return callback('邮箱地址不合法');
		}
		var users = JSON.parse(localStorage.getItem('$users') || '[]');
		users.push(regInfo);
		localStorage.setItem('$users', JSON.stringify(users));
		return callback();
	};

	/**
	 * 获取当前状态
	 **/
	owner.getState = function() {
		var stateText = localStorage.getItem('$state') || "{}";
		return JSON.parse(stateText);
	};

	/**
	 * 设置当前状态
	 **/
	owner.setState = function(state) {
		state = state || {};
		localStorage.setItem('$state', JSON.stringify(state));
		//var settings = owner.getSettings();
		//settings.gestures = '';
		//owner.setSettings(settings);
	};

	var checkEmail = function(email) {
		email = email || '';
		return(email.length > 3 && email.indexOf('@') > -1);
	};

	/**
	 * 找回密码
	 **/
	owner.forgetPassword = function(email, callback) {
		callback = callback || $.noop;
		if(!checkEmail(email)) {
			return callback('邮箱地址不合法');
		}
		return callback(null, '新的随机密码已经发送到您的邮箱，请查收邮件。');
	};

	/**
	 * 获取应用本地配置
	 **/
	owner.setSettings = function(settings) {
		settings = settings || {};
		localStorage.setItem('$settings', JSON.stringify(settings));
	}

	/**
	 * 设置应用本地配置
	 **/
	owner.getSettings = function() {
		var settingsText = localStorage.getItem('$settings') || "{}";
		return JSON.parse(settingsText);
	}
	/**
	 * 获取本地是否安装客户端
	 **/
	owner.isInstalled = function(id) {
		if(id === 'qihoo' && mui.os.plus) {
			return true;
		}
		if(mui.os.android) {
			var main = plus.android.runtimeMainActivity();
			var packageManager = main.getPackageManager();
			var PackageManager = plus.android.importClass(packageManager)
			var packageName = {
				"qq": "com.tencent.mobileqq",
				"weixin": "com.tencent.mm",
				"sinaweibo": "com.sina.weibo"
			}
			try {
				return packageManager.getPackageInfo(packageName[id], PackageManager.GET_ACTIVITIES);
			} catch(e) {}
		} else {
			switch(id) {
				case "qq":
					var TencentOAuth = plus.ios.import("TencentOAuth");
					return TencentOAuth.iphoneQQInstalled();
				case "weixin":
					var WXApi = plus.ios.import("WXApi");
					return WXApi.isWXAppInstalled()
				case "sinaweibo":
					var SinaAPI = plus.ios.import("WeiboSDK");
					return SinaAPI.isWeiboAppInstalled()
				default:
					break;
			}
		}
	}
}(mui, window.app = {}));