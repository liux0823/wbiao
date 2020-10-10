<template>
	<div class="content_bottom">
		<div class="zoom-left fl">
			<span class="bx-prev">
				<img src="../../assets/images/icon-a-g-left01.png">
			</span>
		</div>
		<div class="bottom_nr fl">
			<div class="bx-wrapper">
				<div class="bx-viewport">
					<ul class="bxslider">
						<li v-for="(img,i) in imgs" :key="i">
							<div>
								<img :src="'http://127.0.0.1:8989' + img.s">
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="zoom-right fl">
			<span class="bx-next">
				<img src="../../assets/images/icon-a-g-right01.png">
			</span>
		</div>
	</div>

</template>

<script>
	export default {
		props:['imgs']
	}

</script>

<style>

</style>