<template>
  <div id="app">
    <my-header></my-header>
    <div class="W_main">
      <router-view/>
    </div>
  </div>
</template>

<script>
  import MyHeader from './components/MyHeader.vue'
  export default {
    name:"Banner",
    components:{
      MyHeader
    },
    data(){
      return {
        user_phone:window.localStorage.getItem('phone')
      }
    },
    privade(){
      return {
        phone:this.user_phone
      }
    }
  }
</script>

<style>
/*整个页面的背景色*/
  @import "./assets/css/common.css";
  @import "./assets/css/sprite_d.css";
  @import "./assets/css/sprite.a.a.css";
  @import './assets/css/detail.css';

body{
  /*background-color: #f5f5f5;*/
  min-width:1000px;
}
/*一级容器定宽居中*/
/*body>.container{
  width:1000px;
  min-width:1000px;
  margin:0 auto;
}*/

#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  /*text-align: center;*/
  /*color: #2c3e50;*/
  min-width: 990px;
  width: 100%;
}

#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}
</style>
