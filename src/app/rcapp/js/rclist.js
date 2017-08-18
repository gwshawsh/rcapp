var approvalDialog = {
	data:function(){
		return {
			passed:0,
			comments:'',
		}
	},
	methods:{
		
	
		click:function(){
			var audittype = this.passed ? 0:1;
			var comments = this.comments;
			this.commit(audittype,comments);
		}
	},
	computed:{
		passr:function(){
			return !this.passed;
		},
	},
	props: {
		item:"", 
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
		list: [],
		approval: Function,

	},
	data: function() {
		return {
			showPro: false,
			currentitem:'',
		}
	},
	methods: {
		approve: function(item) {
			this.currentitem = item;
			this.showPro = true;			
			
		},
		commit: function(audittype,comments) {
			this.showPro = false;
			var param = {
				billno:this.currentitem.billno,
				billtype:this.currentitem.type,
				comments:comments,
				audittype:audittype,
				
			};
			query(baseurl+"todolist/audittodo",param,function(data){
				location.reload();
			});
		},
		setErrorImg: function(e) {
			errorImg(e, '../images/default_head.png');
		},
		
		showdetail:function(item){
			navigate('approval_deal.html',item);			
		},
	}, 
	template: [
		'<div class="">',
		'<div class="mui-scroll">',
		'<ul class="mui-table-view">',
		'<li v-for="item in list" class="mui-table-view-cell mui-media" @click = "showdetail(item)">',
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
		'<button v-if="item.billstatus!=4" class="mui-btn-green " @click.stop="approve(item)" style="float: right;">审批</button>',
		'</li></ul>',

		'</div>',
		'<approval-dialog :show.sync="showPro" :commit="commit"></approval-dialog>',
		'</div>',

	].join('')
};

Vue.component('rc-list', listItem);