<template>
	<div class="home">
		<banner :imglist="banners" height="460px"></banner>
		<div class="s_goods_list">
			<ul class="clearfix">
				<biao-item v-for="(item,i) in lists" :item="item" :key="i"></biao-item>
			</ul>
		</div>
	</div>

</template>

<script>
	import Banner from './Banner.vue'
	import biaoItem from '../../components/biaoItem.vue'
	export default {
		name:"Home",
		components:{
			Banner,
			biaoItem
		},
		data(){
			return {
				banners:[],
				lists:[]
			}
		},
		created(){
			this.axios.get('/banner').then(res=>{
				// console.log(res.data)
				this.banners = res.data.banners
			});
			this.axios.get('/pro/list').then(res=>{
				res.data.list.forEach(item=>{
					item.other_imgs = JSON.parse(item.other_imgs);
					item.style = JSON.parse(item.style);
				})
				// console.log(res.data.list)
				this.lists = res.data.list
			})
		}
	}

</script>

<style>
	.home{
		background-color: #fff;
	}
	.s_goods_list{
		width: 970px;
	}
	.s_goods_list ul{
		margin-right: -8.6px;
	}
	.s_goods_list ul li{
		position: relative;
		width: 236px;
		height: 450px;
		display: block;
		overflow: hidden;
		float: left;margin: 10px 8.6px 10px 0;
	}
	 .s_goods_list ul li:hover{
	 	box-shadow:1px 1px 8px 1px rgba(0,0,0,.2)
	 }

</style>