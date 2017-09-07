var approvalDialog = {
	data: function() {
		return {
			passed: false,
			comments: '',
		}
	},
	methods: {

		click: function() {			
			var comments = this.comments;
			this.commit(this.passed, comments);
		}
	},
	computed: {
		passr: function() {
			return !this.passed;
		},
	},
	props: {
		item: "",
		commit: Function,
		show: {
			type: Boolean,
			required: true, // 必需且是bool类型的 
			twoWay: true, // 双向绑定 			
		}
	},
	template: [

		'<div class="modal-mask" v-show="show" transition="modal" v-click="">',
		'<div class="modal-wrapper">',
		'	<div class="modal-container">',

		'	<div class="modal-header" style="padding-left: 8px;padding-right: 8px;">',
		'					<slot name="header">',
		'						<div class="mui-input-row mui-radio mui-left" style="display:inline-block;">',
		'							<input   v-model="passed" value=0 name="checkbox"  type="radio" style="left: 0;" >',
		'							<label   class="font-green" style="padding-left: 30px; padding-right: 0px;">同意申请</label>',
		'						</div>',
		'						<div class="mui-input-row mui-radio mui-left" style="display:inline-block; float: right;">',
		'							<label style="padding-left: 50px; padding-right: 0px;color: #888888;">驳回申请</label>',
		'							<input  v-model="passed" value=1 name="checkbox"  type="radio" >',
		'						</div>',
		'					</slot>',
		'				</div>',

		'						<div class="modal-body">',
		'					<slot name="body">',
		'						<div class="mui-input-row" style="">',
		'							<textarea v-model="comments" id="textarea" rows="5" placeholder="请输入审批意见"></textarea>',
		'						</div>',
		'					</slot>',
		'				</div>',

		'				<div class="modal-footer">',
		'					<slot name="footer">',
		'						<button class="mui-btn mui-btn-block mui-btn-green" v-on:click="click()"',
		' style="width: 80%;padding:10px ;margin: auto;">确    定</button>',

		'					</slot>',
		'				</div>',
		'			</div>',
		'		</div>',
		'	</div>',

	].join('')
};
Vue.component('approval-dialog', approvalDialog);

var listItem = {

	props: {
		billtype: String,
		pulldown: Function,
		pullup: Function,
		url: String,
		list: [],
		formed: {
			default: false,
		},
		needaudit:{//是否需要审批，历史查询等不需要审批
			default: false,
		},

	},
	data: function() {
		return {
			searchtext: '',
			showPro: false,
			currentitem: '',
			limit: 100,

		}
	},

	watch: {
		searchtext: _.debounce(function() {
			this.refresh();
		}, 1000),
		url: function() {
			if(this.url) {
				this.refresh();
			}

		}

	},

	created: function() {
		var that = this;
		if(mui('#pullrefresh')) {
			
			mui.init({
					pullRefresh: {
						container: '#pullrefresh',
					down: {
						style:'circle',
						callback: that.pulldownRefresh
					},
					up: {
						auto:false,
						contentrefresh: '正在加载...',
						callback: that.pullupAppend
					}
						
					
					},

					beforeback: function() {
						console.log(that.showPro);
						if(that.showPro){
							that.showPro = false;
							return false;
						}
						
						return true;
					}
				}

			);
		}
		if(this.url) {
			this.refresh();
		}

	},

	methods: {
		getparam: function(append) {
			return {
				page: append ? this.getpage() : 1,
				limit: this.limit,
				billno: this.searchtext,
				billtype: this.billtype,
			};
		},
		refresh: function() {
			var that = this;
			query(this.url, this.getparam(),
				function(d) {
					that.list = d.page.list;
				}, this.formed, true)
		},
		stoppull: function(complete) {
			mui('#pullrefresh').pullRefresh().endPullupToRefresh(complete);
			mui('#pullrefresh').pullRefresh().endPulldown();
		},
		pulldownRefresh: function() {
			if(this.pulldown) {
				this.pulldown();
			} else {
				var that = this;

				query(this.url, this.getparam(), function(d) {
					that.list = d.page.list;
					that.stoppull();
				}, this.formed, true)
			}

		},
		pullupAppend: function() {
			if(this.pullup) {
				this.pullup();
			} else {
				var that = this;
				query(this.url, this.getparam(true), function(d) {

					that.list = that.list.concat(d.page.list);
					that.stoppull(d.page.list.length == 0);

				}, this.formed, true)
			}

		},
		getpage: function() {
			var length = this.list.length;
			var limit = this.limit;
			if(length % limit == 0) {
				return length / limit + 1;
			} else {
				return Math.ceil(this.list.length / this.limit) + 1;
			}
		},

		approval: function(item) {
			this.currentitem = item;
			this.showPro = true;

		},
		//提交审核请求
		commit: function(pass, comments) {
			this.showPro = false;
			var item = this.currentitem;
			item.billcommentsEntity = {auditstatus:pass?0:1,remark:comments};
			query(getauditurl(item.type), item, function(data) {
				
				location.reload();
				mui.toast("审核成功");
			});
			
		},
		setErrorImg: function(e) {
			errorImg(e, '../images/default_head.png');
		},

		showdetail: function(item) {// 显示详情
			navigate(getbilldetailurl(item.type), item,this.needaudit);
		},
	},
	template: [

		'<div class="" >',
		'<div class="mui-input-row mui-search">',
		'<input type="search" class="mui-input-clear" placeholder="请输入单据号"   v-model="searchtext"></div>',
		'<div class="mui-scroll">',
		'<ul class="mui-table-view">',
		'<li v-for="item in list" class="mui-table-view-cell" @click = "showdetail(item)">',
		'<template v-if="item.type ==\'leave\'">',
		'<leave-item  :item="item" :approval ="approval" ></bill-item>',
		'</template>',
		'<template v-else>',
		'<bill-item  :item="item" :approval ="approval" :needaudit = "needaudit"></bill-item>',
		'</template>',

		'</li>',

		'</ul>',

		'</div>',
		'<approval-dialog :show.sync="showPro" :commit="commit"></approval-dialog>',
		'</div>',

	].join('')
};

Vue.component('rc-list', listItem);

///订单相关的item
Vue.component('bill-item', {

	props: {
		item: "",
		approval: Function,
		needaudit:true,

	},
	methods:{
		auditbtn:function(){
			return this.needaudit && (this.item.billstatus<=STATUS_AUDITING);
		},
	},
	template: [
		'<li class=" mui-media" >',
		'<p class="mui-input-row" style="padding-left: 52px;">申请单号:&nbsp;&nbsp;&nbsp;{{item.billno}} <span class="font-green position-right" style="right:0px"> {{item.billstatusenumvaluename}}</span></p>',
		'<div class=\'mui-navigate-right\' >',
		'<img class="mui-media-object mui-pull-left" :src="getbillicon(item.type)">',
		'<div class="mui-media-body">',

		'<div> {{getbillname(item.type)}}',
		'<span class="font-secondary"> {{item.dept}}</span>',
		'<span class="font-warning position-right" v-if="item.total"> {{item.total}}元</span></div>',
		'<p class="font-green">{{item.reason}}</p>',
		'<p>申请人:&nbsp;&nbsp;&nbsp;{{item.makeuserfullname}}</p>',
		'<p class=\'mui-ellipsis\'>申请时间:{{item.makedate}}</p>',
		'</div></div>',
		'<button v-if="auditbtn()" class="mui-btn-green " @click.stop="approval(item)" style="float: right;">审批</button>',
		'</li>',
	].join('')
});

///请假相关的item
Vue.component('leave-item', {

	props: {
		item: "",
		approval: Function,

	},
	template: [

		'<li class="mui-media" >',
		'<a class=\'mui-navigate-right\' href="javascript:;" >',
		'<img  class="mui-media-object mui-pull-left" :src="getbillicon(item.type)">',
		'<div class="mui-media-body">',
		'{{item.useridfullname}}',
		'<span class="font-secondary"> {{item.dept}}</span>',
		'<span class="font-secondary position-right"> {{item.billstatusenumvaluename}}</span>',
		'<p class="font-green">{{item.leavetypeenumvaluename}}</p>',
		'<p class=\'mui-ellipsis\'>申请时间:{{item.createtime}}</p>',
		'</div></a></li>'
	].join('')
});

///合同相关的item
Vue.component('contract-item', {

	props: {
		item: "",
		approval: Function,
		needaudit:true,

	},
	methods:{
		auditbtn:function(){
			return this.needaudit && (this.item.billstatus<=STATUS_AUDITING);
		},
	},
	template: [

		'<li class=" mui-media" >',
		'<p class="mui-input-row" style="padding-left: 52px;">申请单号:&nbsp;&nbsp;&nbsp;{{item.billno}} <span class="font-green position-right" style="right:0px"> {{item.billstatusenumvaluename}}</span></p>',
		'<div class=\'mui-navigate-right\' >',
		'<img class="mui-media-object mui-pull-left" :src="getbillicon(item.type)">',
		'<div class="mui-media-body">',

		'<div> {{getbillname(item.type)}}',
		'<span class="font-secondary"> {{item.dept}}</span>',
		'<span class="font-warning position-right"> {{item.total}}元</span></div>',
		'<p class="font-green">{{item.reason}}</p>',
		'<p>申请人:&nbsp;&nbsp;&nbsp;{{item.makeuserfullname}}</p>',
		'<p class=\'mui-ellipsis\'>申请时间:{{item.reqdate}}</p>',
		'</div></div>',
		'<button v-if="auditbtn()" class="mui-btn-green " @click.stop="approval(item)" style="float: right;">审批</button>',
		'</li>',
	].join('')
});