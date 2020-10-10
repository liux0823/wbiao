import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import MyHeader from "./components/MyHeader"
import axios from "axios"
import qs from 'qs'
//import  '@/assets/iconfont/iconfont.css'
Vue.component("my-header",MyHeader)
// axios.defaults.baseURL ="http://xzserver.applinzi.com";
// axios.defaults.baseURL = "http://localhost:5050";
//如果在客户端使用http代理跨域，daseURL不要写真实的服务器地址，而应该写http代替提供的接口地址的别名
 axios.defaults.baseURL = "/api";
Vue.prototype.axios = axios;
Vue.prototype.qs = qs;
Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
