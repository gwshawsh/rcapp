var vm = {
		data: function() {
			return {
				text: '',

			}
		},
		props: {
			search: Function,
		},
		
		watch:{
			text:_.debounce(function() {				
				this.search(this.text);
			}, 500)
		},

	
	template: [

		'<div class="mui-input-row mui-search">',
		'<input type="search" class="mui-input-clear" placeholder="请输入单据号"   v-model="text"></div>'

	].join('')
};
Vue.component('rc-search', vm);