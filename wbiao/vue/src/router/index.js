//路由
import Vue from 'vue'
import VueRouter from 'vue-router'
// import Index from '../views/Index.vue'
// import Details from '../views/Details.vue'
import Login from '../views/Login.vue'
import Reg from '../views/res.vue'
import Home from '../views/home/Home.vue'
import productDetail from '../views/pro/productDetail.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'home',
    component: Home
  },
  {
    path: '/login',
    name: 'Login',
    component: Login
  },
  {
    path: '/res',
    name: 'Reg',
    component: Reg
  },
  {
    path:'/product',
    component:productDetail
  }
  // {
  //   path:'/details/:lid',
  //   name:'Details',
  //   component:Details,
  //   props:true
  // }
  // { //这里是懒加载，暂时不要问，明天讲
  //   path: '/details/:lid',
  //   // route level code-splitting
  //   // this generates a separate chunk (about.[hash].js) for this route
  //   // which is lazy-loaded when the route is visited.
  //   component:() => import(/* webpackChunkName: "about" */ '../views/Details.vue'),
  //   props:true
  // }
]

const router = new VueRouter({
  base: process.env.BASE_URL,
  routes
})

export default router
