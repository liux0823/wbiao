<template>
	<div class="W_pt_top">
		<div class="pt_top_wrap clearfix">
			<div class="pt_top_left fl">
				<router-link to="">
					<span class="to_introduction">
						正品保障，免息分期
					</span>
				</router-link>
			</div>
			<div class="pt_top_right fr">
				<div class="pt_top_login clearfix fl" v-if="user_phone">
					<span v-if="user_phone">欢迎{{user_phone}}</span>
				</div>
				<div class="pt_top_login clearfix fl" v-else>
					<router-link to="/login">请登录</router-link>
					|
					<router-link to="/res" style="color:#ae0f17;">注册即送3500元大礼包</router-link>
				</div>
				<div class="pt_top_others fl">
					<span class="line">|</span>
					<router-link to="">
						<span class="cart_line">
							购物车
							<span class="cart_count h">
								(<i>{{0}}</i>)
							</span>
						</span>
					</router-link>
					<div class="a_hover fl">
						<router-link to="">
							客户服务
						</router-link>
					</div>
					<router-link to="">
						会员福利
					</router-link>
					<span class="line">|</span>
					<router-link to="">ENGLISH</router-link>
				</div>
			</div>
		</div>
	</div>
</template>
<script>
	export default {
		// data(){
		// 	return {
		// 		user_phone:''
		// 	}
		// },
		computed:{
			user_phone(){
				return this.$root.$children[0].user_phone
			}
		}
		// created(){
		// 	console.log(window.localStorage.getItem('phone'))
		// 	this.user_phone = window.localStorage.getItem('phone');
		// }
	}
</script>
<style>
@import '../assets/css/header.css'

</style>