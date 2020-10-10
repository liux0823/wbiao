const express=require('express');
//引入body-parser模块
const bodyParser=require('body-parser');
//引入用户路由器
//const ur=require('./router/user.js');
//const ajax=require('./router/ajax.js');
const pro=require('./router/pro.js');
const user=require('./router/user.js');
const home=require('./router/home.js');
//创建web服务器
const app=express();
//设置端口
app.listen(8989);
//托管静态资源到public目录
app.use( '/public',express.static('./public') );
// app.use( express.static('./pro') );
//在路由器之前，应用body-parser中间件，将post请求的数据解析为对象
app.use( bodyParser.urlencoded({
  extended:false
}) );
//将用户路由器挂载到web服务器，添加前缀/user
// /user/reg
//app.use('/user',ur);
//app.use('/ajax',ajax);
app.use('/',home);
app.use('/pro',pro);
app.use('/user',user);

console.log('http://127.0.0.1:8989');

