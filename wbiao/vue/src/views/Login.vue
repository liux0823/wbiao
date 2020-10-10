<template>
	<div class="login">
		<div class="W_login_mark">
			<div> </div>
		  <p class="login_tab">
		    <span class="on">会员登录</span>
		  </p>
		  <div class="user_login">
		    <div class="member_login phone">
		      <p class="mobile">
		        <input type="text" placeholder="手机号码" maxlength="11" class="phone_num" v-model="phone">
		        <i></i>
		      </p>
		      <p class="captcha_wrap">
		        <input type="text" placeholder="请输入图形验证码" v-model="code" class="fl" @blur="isCode">
		        <span class="img-wrap fl">
		          <v-code ref="code"></v-code>
		        </span>
		        <i>{{codemsg}}</i>
		      </p>
		      <p class="mobile">
		        <input type="password" placeholder="密码" class="phone_num" v-model="pwd">
		        <i>{{errmsg}}</i>
		      </p>
		      <button class="login" @click="login">立即登录</button>
		      <p>
		        <router-link to="/res">
		          <span class="fl">免费注册</span>
		        </router-link>
		      </p>
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
      errmsg:"",
      code:"",
      codemsg:""
    }
  },
  methods:{
    login() {
      if(!this.errmsg){
        let data = this.qs.stringify({ phone: this.phone, pwd: this.pwd });
        this.axios.post("/user/login", data).then(result => {
          console.log(result.data);
          // this.result = result.data;
          if(result.data){
            this.$root.user_phone = this.phone
            window.localStorage.setItem('phone',this.phone)
            console.log(this.$root)
            this.$router.push('/');
          }else{
            this.errmsg = "用户名或密码错误！"
          }
        });
      }
    },
    isCode(){
      if(this.$refs.code.code == this.code.toLowerCase()){
        this.codemsg = ""
      }else{
        this.codemsg = "验证码错误"
      }
    },
  }

}
</script>

<style  scoped>
	.login{
		background-image: url(../assets/images/loginb.jpg);
		height: 580px;
		margin: 100px auto;
		position: relative;
	}
	.W_main .login .W_login_mark{
		position: absolute;
		top: 50%;
		left: 60%;
		transform: translateY(-50%);
	}

</style>