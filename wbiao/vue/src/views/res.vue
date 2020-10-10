<template>
<div class="reg">
	<div class="W_main_box">
	  <div class="W_main_box_content">
	    <h5>注册万表会员</h5>
	    <div class="content_box">
	      <div class="box">
	        <p>
	          <em class="icon-a-phone-icon"></em>
	          <input type="text" class="ti" placeholder="请输入手机号码" maxlength="11" v-model="phone" @blur="yanzhen">
	        </p>
	        <i>{{msg}}</i>
	      </div>
	      <div class="box">
	        <p>
	          <em class="icon-a-note-code"></em>
	          <input type="text" class="ti imgCaptchaWrap fl" placeholder="请输入图形验证码" v-model="code" @blur="isCode">
	          <v-code width="98px" height="38px" class="r_imgCaptcha fr" ref="code"></v-code>
	        </p>
	        <i>{{codemsg}}</i>
	      </div>
	      <div class="box">
	        <p>
	          <em class="icon-a-psd-icon"></em>
	          <input type="password" class="ti" placeholder="请设置密码" v-model="pwd" @blur="isPwd">
	          <span class="ico icon-d-eye-close ico icon-d-eye-open"></span>
	        </p>
	        <i>{{pmsg}}</i>
	      </div>
	      <span class="register" @click="res">立即注册</span>
				<p class="condition">点击“立即注册”，即表示您同意并愿意遵守万表网用户协议</p>
	    </div>
	  </div>
	</div>
</div>

</template>

<script>
//局部使用引入qs、
import VCode from '../components/VCode.vue'

export default {
  components:{
    VCode
  },
  data() {
    return {
      phone: "",
      pwd: "",
      code:"",
      msg:"",
      pmsg:"",
      codemsg:""
    };
  },
  methods:{
    res() {
      console.log('登录')
      if(!this.msg && !this.pmsg && !this.codemsg){
        let data = this.qs.stringify({ phone: this.phone, pwd: this.pwd });
        this.axios.post("/user/reg", data).then(result => {
          console.log(result.data);
          // this.result = result.data;
          if(result.data){
            this.$router.push('/login');
          }
        });
      }else{
        return
      }
    },
     yanzhen() {
      let reg = /^1[3-9]\d{9}$/;
      let data = this.qs.stringify({
        phone: this.phone
      });
      if (reg.test(this.phone)) {
        this.axios.post("/user/hasuser", data).then(res => {
          console.log(res.data);
          if (res.data !== 0) {
            this.msg = "手机号已经注册!"
          } else {
            this.msg = ""
          }
        });
      } else {
        this.msg = "手机号格式错误！!"
      }
    },
    isCode(){
			console.log(this.$refs.code)
			console.log(this.code)
      if(this.$refs.code.code == this.code.toLowerCase()){
        this.codemsg = ""
      }else{
        this.codemsg = "验证码错误"
      }
    },
    isPwd(){
      if(this.pwd.replace(/\s+/g,'')){
        this.pmsg = "";
      }else{
        this.pmsg = "密码不能为空";
      }
    }
  },
};
</script>

<style>
	@import '../assets/css/reg.css';
	.reg {
		width: 840px;
		margin: 100px auto;
	}
	.reg .W_main_box{
		padding: 50px 0;
	}
</style>


