//引入mysql模块
const mysql=require('mysql');
//创建连接池对象
const pool=mysql.createPool({
  host:'127.0.0.1',
  port:'3306',
  user:'root', 
  password:'',
  database:'wbiao',
  connectionLimit:'20'  //设置连接池的大小
});

module.exports=pool;