var baseurl = "http://192.168.253.1:8888/";
var usercode="";
function navigate(murl,extra) {
	if(!murl){
		mui.back();
		return;
	}
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
		extras:{
			value:extra,
		},
	});
	
}
function getbillname(type){
	switch(type){
				case 'ask':return"请购单";
				case 'order':return"订购单";
				case 'pay':return"付款单";
				case 'contract':return"合同";
				default:return"";
			}
}
function getbillicon(type){
	switch(type){
				case 'ask':return"../images/qing.png";
				case 'order':return"../images/ding.png";
				case 'pay':return"../images/fu.png";
				case 'contract':return"../images/he.png";
				default:return"../images/default_head.png";
			}
}

Date.prototype.format = function(fmt)   
{ //author: meizz   
  var o = {   
    "M+" : this.getMonth()+1,                 //月份   
    "d+" : this.getDate(),                    //日   
    "h+" : this.getHours(),                   //小时   
    "m+" : this.getMinutes(),                 //分   
    "s+" : this.getSeconds(),                 //秒   
    "q+" : Math.floor((this.getMonth()+3)/3), //季度   
    "S"  : this.getMilliseconds()             //毫秒   
  };   
  if(/(y+)/.test(fmt))   
    fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));   
  for(var k in o)   
    if(new RegExp("("+ k +")").test(fmt))   
  fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));   
  return fmt;   
} 
var header = {  
	props: {
		title: '',
		btn: '',
		to: '',
		value:'',

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

function getUsercode(){
	return localStorage.getItem('usercode') || "";
}


function query(url, datain, result,isform,nomask) {
	
	console.log(url);
	console.log(JSON.stringify(datain));
	var mask = mui.createMask(); 
	return mui.ajax(baseurl+url, {
		data: isform ? datain:JSON.stringify(datain), 
		contentType: isform ?"application/x-www-form-urlencoded" : "application/json",
		dataType: 'json', //服务器返回json格式数据
		type: 'post', //HTTP请求类型
		timeout: 10000, //超时时间设置为10秒；
		beforeSend: function() { 
			if(!nomask){
				plus.nativeUI.showWaiting();
				mask.show(); //显示遮罩层
			}
			 
		},
		complete: function() {
			if(!nomask){
			plus.nativeUI.closeWaiting();
			mask.close(); //关闭遮罩层
			}
		},
		success: function(dataout, textStatus, xhr){
			console.log(JSON.stringify(dataout));
			if(dataout.code == 0){
				result(dataout);
			}else{
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