<template>
	<div class="W_detail">
		<div class="detail_upper">
			<div class="detail_upper_left fl">
				<div class="content">
					<div class="content_zoom">
						<product-img :img_s="other_imgs[img_index].s" :img_b="other_imgs[img_index].b" :times="2"></product-img>
						<div class="tag icon-a-g-enlarge01"></div>
						<div class="promotionTag">
							<img src="https://image8.wbiao.co/shop/2bc2e89c6b7d4b879e86e86be7ff6f01.png?x-oss-process=image/resize,m_pad,w_80,h_80,color_ffffff">
						</div>
						<div class="videoButton icon-d-vieo" @click="isPlay" :class="{h:!isH}"></div>
						<div class="videoClose icon-d-vieo-close" :class="{h:isH}" @click="isPause"></div>
						<div class="video videoContent" :class="{h:isH}">
							<div class="play">
								<div class="ckplayerchqtcjmdcoijnenswn">
									<video width="500px" height="500px" :src="biao.movie" controls ref="video"></video>
								</div>
							</div>
						</div>
					</div>
					<product-img-list :imgs="other_imgs"></product-img-list>
					<div class="content_collection">
						<span class="js_share">收藏</span>
						<span class="content_collection_a">分享</span>
					</div>
				</div>
			</div>
			<div class="detail_upper_right fr">
				<div class="upper_title">{{biao.name}}</div>
				<div class="upper_xuyan">
					{{biao.subtitle}}
					<span class="js_more CUSTOMER-SERVICE">优惠咨询>></span>
				</div>
				<div class="upper_model clearfix">
					<div class="fl upper_model_a">
						<span>型号：</span>
						<span>{{biao.modeln}}</span>
					</div>
					<div class="fl upper_model_b">
						<span>编号：</span>
						<span>{{biao.num}}</span>
					</div>
					<div class="fl upper_model_c">
						<span>品牌：</span>
						<span>{{biao.brand[0].brand}}</span>
					</div>
					<div class="fl upper_model_d">
						<span>销量：</span>
						<span>{{biao.sale_n}}</span>
					</div>
				</div>
				<div class="upper_price ">
					<div class="upper_stages  clearfix">
						<div class="upper_stages_left fl">分期</div>
						<div class="upper_stages_right fl">
							<span class="upper_stages_a CUSTOMER-SERVICE">
								<em>￥</em>
								<i class="js_stages">{{(biao.wb_price/biao.stage).toFixed(2)}}</i>
								x{{biao.stage}}期
							</span>
							<span class="upper_stages_b poundage">
								<i class="icon-a-doubt"></i>免手续费
							</span>
						</div>
					</div>
					<div class="upper_price_jiage clearfix">
						<div class="upper_price_jiage_left fl">万表价</div>
						<div class="upper_price_jiage_right fl">
							<span class="upper_price_jiage_a">￥</span>
							<span class="upper_price_jiage_b js_price">{{biao.wb_price}}</span>
							<span class="upper_price_jiage_c">
								<em>市场价</em>
								<i>￥{{biao.price}}</i>
							</span>
						</div>
					</div>
					<div class="upper_give clearfix">
						<div class="upper_give_left fl">配送</div>
						<div class="upper_give_right fl">
							<i>({{biao.distribution}})</i>
							17:30前支付，预计1-3个工作日内发货，支持货到付款 
						</div>
					</div>
					<div class="promise clearfix">
						<div class="left fl">承诺</div>
						<ul class="right fl">
							<li class="fl" v-for="(p,k) in promise" :key="k">
								<i></i>
								<span>{{k}}</span>
								<div class="popup">{{p}}</div>
							</li>
						</ul>
					</div>
				</div>
				<div class="upper_style clearfix">
					<div class="upper_style_left fl">款式：</div>
					<div class="upper_style_right fl">
						<router-link :to="`/product?id=${b.pid}`" v-for="(b,i) in biao.style" :key="i">
							<span class="fl a">
								<span class="upper_style_right_img fl">
									<!-- <img src="" alt=""> -->
								</span>
								<span class="upper_style_right_text fl">{{b.title}}</span>
							</span>
						</router-link>
					</div>
				</div>
			</div>
		</div>
	</div>

</template>

<script>
	import productImg from './productImg.vue'
	import productImgList from './productImgList.vue'
	export default {
		components:{
			productImg,
			productImgList
		},
		data(){
			return {
				biao:{},
				img_index:0,
				isH:true,
				promise:{
					'正品保障':'全站自营直采，高于瑞士国家标准的进出仓全检机制，万表9年零假货投诉。',
					'正规发票':'提供国家税务局认可的正规发票，具有售后维权法律效力。',
					'假一赔三':'万表自营新表9年累计交易超50万枚腕表，正品无假货，如有售假三倍赔偿。',
					'7天退换':'无理由退换：撕开贴膜及特卖、预售等特殊商品不支持；质量退换：非人为机芯故障或商品制造缺陷。',
					'全球联保':'800+家售后服务点，完善的售后保障，可享受品牌全球联保服务。',
					'实体店体验':'多家线下体验中心，互联网+新零售。',
					'闪电发货':'每天17：30前下单，可当天发货。',
					'货到付款':'收到货验货后再支付，可刷卡、现金、转账。',
				},
				other_imgs:[{}]
			}
		},
		methods:{
			isPlay(){
				this.isH = false;
				this.$refs.video.play();
			},
			isPause(){
				this.isH = true;
				this.$refs.video.pause();
			}
		},
		created(){
			console.log( this.$route.query.id)
			this.axios.get('/pro',{
				params:{
					id: this.$route.query.id
				}
			}).then(res=>{
				res.data.style = JSON.parse(res.data.style);
				this.other_imgs = JSON.parse(res.data.other_imgs);
				this.biao = res.data
				console.log(res.data);
			})
		}
	}

</script>

<style>
/*@import '../../assets/css/detail.css';*/

</style>