<template>
	<div class="W_home_banner">
		<div class="swiper-container swiper-container-fade swiper-container-horizontal" :style="{width: width,height:height}">
			<div class="swiper-wrapper home-page-swiper">
				<div class="swiper-slide swiper-slide-duplicate" :style="{opacity: Number(showIndex == index),'transition-duration':transition}" v-for="(banner,index) in imglist" :key="index">
					<a href="#">
						<img :src="banner.img" alt="">
					</a>
				</div>
			</div>
			<div class="swiper-pagination swiper-pagination-clickable swiper-pagination-bullets">
				<span class="swiper-pagination-bullet" v-for="n in imglist.length" :key="n" @click="clickTrun(n)" :class="{'swiper-pagination-bullet-active':showIndex == n-1}">
				</span>
			</div>
			<div class="swiper-button-next" @click="trunRight">
				<i class="icon-d-h-ctrl01-2">下一页</i>
				<i class="icon-d-h-ctrl01-22">下一页</i>
			</div>
			<div class="swiper-button-prev" @click="trunLeft">
				<i class="icon-d-h-ctrl01-1">上一页</i>
				<i class="icon-d-h-ctrl01-11">上一页</i>
			</div>
			<slot></slot>
		</div>
	</div>

</template>

<script>
	export default {
		name:'Banner',
		props:{
			imglist:{
				type: Array,
				required:true
			},
			width:{
				type:String,
				default:'100%'
			},
			isSide:{
				type: Boolean,
				default: false
			},
			interval:{
				type:Number,
				default: 3000
			},
			height:{
				type:String,
				required:true
			},
			transition:{
				type:String,
				default: '2s'
			}
		},
		data(){
			return {
				showIndex:0,
				timer:0
			}
		},
		methods:{
			setTimer(){
				return setInterval(()=>{
					this.showIndex ++ ;
					if(this.showIndex >= this.imglist.length){
						this.showIndex =0
					}
				},this.interval)
			},
			controlTimer(){
				if(this.timer){
					console.log(this.timer)
					clearInterval(this.timer)
				}
				this.timer = this.setTimer()
			},
			clickTrun(n){
				this.showIndex = n -1
				this.controlTimer()
			},
			trunLeft(){
				this.showIndex --
				if(this.showIndex < 0){
					this.showIndex = this.imglist.length -1
				}
				this.controlTimer()
			},
			trunRight(){
				this.showIndex ++
				if(this.showIndex >= this.imglist.length){
					this.showIndex = 0
				}
				this.controlTimer()
			}
		},
		created(){
			this.timer = this.setTimer()
		}
	}
</script>

<style>
	.W_home_banner{
		width: 100%;
		min-width:990px;
	}
	.swiper-container{
		margin: 0 auto;
		position: relative;
	}
	.swiper-wrapper{
		height: 100%;
		position: relative;
	}
	.swiper-slide{
		height: 100%;
		width: 100%;
		position: absolute;
		top: 0px;
		left: 0px;
		transition-property: all;
	}
	.swiper-slide img{
		position: absolute;
		left: 50%;
		transform: translateX(-50%);
	}
	.swiper-pagination{
		width: auto;
		position: absolute;
		height: 14px;
		bottom: 22px;
		z-index: 51px;
		left: 50%;
		height: 14px;
		margin-left: -300px;
	}
	.swiper-pagination-bullet{
		display: inline-block;
		vertical-align: middle;
		width: 6px;
		height: 6px;
		margin: 0 5px;
		border-radius: 50%;
		border: 2px solid #fff;
		text-indent: -9999px;
		opacity: 0.5;
		background: 0 0;
	}
	.swiper-pagination-bullet:hover{
		width: 8px;
		height: 8px;
		border: 3px solid #ccaa7a;
		opacity: 1;
		background: #fff;
		/*background-color: #ae0a0a;*/
	}
	.swiper-pagination-bullet-active{
		width: 8px;
		height: 8px;
		border: 3px solid #ccaa7a;
		opacity: 1;
		background: #fff;
	}
	.banner-btn{
		display: block;
		position: absolute;
		top: 50%;
		margin-top: -31px;
		width: 37px;
		height: 63px;
		text-indent: -9999px;
		/* background: url(~assets/img/banner.png) 0 9999px no-repeat; */
	}
	.btn-left{
		left: -68px;
		background-position: 0 -360px;
	}
	.btn-right{
		right: -68px;
		background-position: 0 -508px;
	}
	.swiper-button-next, .swiper-button-prev{
		width: 30px;
		height: 60px;
		position: absolute;
		top: 50%;
		transform: translateY(-50%);
		text-indent: -999em;
		background: 0 0;
		margin-top: 0;
		z-index: 10;
		cursor: pointer;
	}
	.W_home_banner .swiper-button-prev{
		width: 36px;
		left: 50%;
		margin-left: -398px;
	}
	.W_home_banner .swiper-button-next{
		width: 36px;
		right: 50%;
		margin-right: -600px;
	}
	.icon-d-h-ctrl01-1{
		display: block;
		background-image: url(../../assets/images/d.png);
		background-position: -234px -114px;
		background-size: 475px;
		width: 36px;
		height: 60px;
	}
	.icon-d-h-ctrl01-11{
		display: block;
		background-image: url(../../assets/images/d.png);
		background-position: -280px -114px;
		background-size: 475px;
		width: 36px;
		height: 60px;
	}
	.icon-d-h-ctrl01-2{
		display: block;
		background-image: url(../../assets/images/d.png);
		background-position: -142px -114px;
		background-size: 475px;
		width: 36px;
		height: 60px;
	}
	.icon-d-h-ctrl01-22{
		display: block;
		background-image: url(../../assets/images/d.png);
		background-position: -188px -114px;
		background-size: 475px;
		width: 36px;
		height: 60px;
	}
	.W_home_banner .swiper-button-next .icon-d-h-ctrl01-22, .W_home_banner .swiper-button-prev .icon-d-h-ctrl01-11{
		margin-top: -60px;
		display: none;
	}
	.W_home_banner .swiper-button-prev:hover .icon-d-h-ctrl01-11{
		display: block;
	}
	.W_home_banner .swiper-button-next:hover .icon-d-h-ctrl01-22{
		display: block;
	}
	
</style>