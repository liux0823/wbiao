<template>
	<li>
		<router-link :to="`/product?id=${item.id}`">
			<span class="s_goods_img">
				<img :src="'http://127.0.0.1:8989' + item.other_imgs[0].s" alt="">
			</span>
		</router-link>
		<div class="promotionTag">
			<img src="https://image8.wbiao.co/shop/5c815dc2a78f46b49db06ea6dce147ec.png?x-oss-process=image/resize,m_pad,w_50,h_50,color_ffffff">
		</div>
		<div class="goods_txt">
			<p class="tPrc">
				<em class="month_tag" v-if="item.stage == 12">月付</em>
				<em class="month_tag" v-else>非月付</em>
				<span class="fenqi_price" v-if="item.stage == 12">￥{{(item.wb_price/item.stage).toFixed(2)}}</span>
				<span class="fenqi_price" v-else>￥{{item.wb_price/12}}</span>
				<span class="s_price">
					￥{{item.price}}
				</span>
			</p>
			<router-link to="">
				<span class="s_goods_name elps2">{{item.name}}</span>
			</router-link>
			<div class="goods_sale">
				<em class="s_sale_num">销量{{item.sale_n}}</em>
			</div>
			<p class="sale_tags">
				<span v-if="item.stage_free">免息分期</span>
			</p>
		</div>
	</li>

</template>

<script>
	export default {
		props:['item']
	}

</script>

<style>
	.s_goods_list ul li .s_goods_img{
		display: block;
		overflow: hidden;
		width: 220px;
		height: 275px;
		margin: 10px auto 5px auto;
		position: relative;
		text-align: center;
	}
	.s_goods_list ul li .s_goods_img>img{
		width: auto;
		height: 275px;
		position: absolute;
		left: 50%;
		margin-left: -137.5px;
		background-color: #fff
	}
	.s_goods_list ul li .promotionTag{
		width: 50px;
		height: 50px;
		position: absolute;
		left: 28px;
		top: 10px;
	}
	.s_goods_list .goods_txt{
		margin: 0 16px;
		padding-bottom: 20px;
		line-height: 18px;
	}
	.s_goods_list .goods_txt .tPrc{
		overflow: hidden;
		margin-bottom: 10px;
	}
	.s_goods_list .goods_txt .tPrc .month_tag{
		position: relative;
		top: -2px;
		display: inline-block;
		padding: 0 2px;
		background: linear-gradient(270deg,#ff8080 0,#e65c5c 100%);
		border-radius: 2px;
		color: #fff;
	}
	.s_goods_list .goods_txt .fenqi_price{
		margin-right: 10px;
		color: #e65c5c;
		font-size: 16px;
		font-family: DIN-Bold;
	}
	.s_goods_list .goods_txt .s_price, .s_goods_list .goods_txt .s_price em{
		position: relative;
		color: #666;
		font-size: 16px;
		font-family: DIN-Bold;
		font-weight: 400;
	}
	.s_goods_list .goods_txt .s_price::before{
		content: '';
		position: absolute;
		top: 4px;
		left: -7px;
		width: 1px;
		height: 12px;
		background: #ddd;
	}
	.s_goods_list .goods_txt .s_goods_name{
		height: 36px;
		line-height: 18px;
		margin-bottom: 8px;
		color: #666;
		overflow: hidden;
	}
	.s_goods_list .goods_txt .goods_sale{
		margin-bottom: 4px;
		color: #999;
	}
	.s_goods_list .goods_txt .sale_tips{
		color: #cc5252;
		margin-bottom: 8px;
	}
	.s_goods_list .goods_txt .sale_tags span{
		display: inline-block;
		line-height: 16px;
		background-color: #cc5252;
		border: 1px solid #cc5252;
		color: #fff;
		padding: 0 7px;
		border-radius: 2px;
	}
	.s_goods_list .goods_txt .sale_tags span:first-child{
		background: 0 0;
		border: 1px solid #cc9952;
		color: #cc9952;

	}

</style>