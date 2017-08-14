var approvalDialog = {
	methods: {

	},
	props: {
		confirm: Function,
		show: {
			type: Boolean,
			required: true, // 必需且是bool类型的
			twoWay: true // 双向绑定 
		}
	},
	template: [

		'<div class="modal-mask" v-show="show" transition="modal" v-click="">',
		'<div class="modal-wrapper">',
		'	<div class="modal-container">',

		'	<div class="modal-header" style="padding-left: 8px;padding-right: 8px;">',
		'					<slot name="header">',
		'						<div class="mui-input-row mui-checkbox mui-left" style="display:inline-block;">',
		'							<input name="checkbox" value="Item 1" type="checkbox" style="left: 0;">',
		'							<label class="font-green" style="padding-left: 30px; padding-right: 0px;">同意申请</label>',
		'						</div>',
		'						<div class="mui-input-row mui-checkbox mui-left" style="display:inline-block; float: right;">',
		'							<label style="padding-left: 50px; padding-right: 0px;color: #888888;">驳回申请</label>',
		'							<input name="checkbox" value="Item 1" type="checkbox">',
		'						</div>',
		'					</slot>',
		'				</div>',

		'						<div class="modal-body">',
		'					<slot name="body">',
		'						<div class="mui-input-row" style="">',
		'							<textarea id="textarea" rows="5" placeholder="请输入审批意见"></textarea>',
		'						</div>',
		'					</slot>',
		'				</div>',

		'				<div class="modal-footer">',
		'					<slot name="footer">',
		'						<button class="mui-btn mui-btn-block mui-btn-green" v-on:click="confirm()"',
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
		list: [],
		approval: Function,

	},
	data: function() {
		return {
			showPro: false
		}
	},
	methods: {
		approve: function(item) {
			this.showPro = true;
			console.log(this.showPro);
		},
		closeDialog: function() {
			this.showPro = false;
		},
		setErrorImg: function(e) {
			errorImg(e, '../images/default_head.png');
		},
	},
	template: [
		'<div class="">',
		'<div class="mui-scroll">',
		'<ul class="mui-table-view">',
		'<li v-for="item in list" class="mui-table-view-cell mui-media" >',
		'<p class="mui-input-row" style="padding-left: 52px;">申请单号:&nbsp;&nbsp;&nbsp;{{item.billno}} <span class="font-green position-right" style="right:0px"> {{item.billstatus}}</span></p>',
		'<div class=\'mui-navigate-right\' >',
		'<img class="mui-media-object mui-pull-left" :src="item.src ? item.src:\'\'"  onerror="src=\'../images/default_head.png\'">',
		'<div class="mui-media-body">',

		'<div> {{item.name}}',
		'<span class="font-secondary"> {{item.dept}}</span>',
		'<span class="font-warning position-right"> {{item.total}}元</span></div>',
		'<p class="font-green">{{item.reason}}</p>',
		'<p>申请人:&nbsp;&nbsp;&nbsp;{{item.requser}}</p>',
		'<p class=\'mui-ellipsis\'>申请时间:{{item.reqdate}}</p>',
		'</div></div>',
		'<button class="mui-btn-green " v-on:click="approve" style="float: right;">审批</button>',
		'</li></ul>',

		'</div>',
		'<approval-dialog :show.sync="showPro" :confirm="closeDialog"></approval-dialog>',
		'</div>',

	].join('')
};

Vue.component('rc-list', listItem);