//引入express
const express=require('express');
//引入连接池对象
const pool=require('../pool.js');
//创建路由器
const r=express.Router();

// 登录模块
r.post("/login",(req,res)=>{
	var phone=req.body.phone	
	var pwd=req.body.pwd

	var sql="select id from wbiao_user where phone=? and pwd=?";
	pool.query(sql,[phone,pwd],(err,result)=>{
		if(err) throw err;
		if(result.length>0){
			res.send("1");
		}else{
			res.send("0");
		}
	});
});

// 用户注册模块
r.post('/reg',(req,res)=>{
	let obj = req.body;
	console.log(req);
	if (!obj.phone) {
		res.send({code:'400',msg:'电话不能为空'});
	}
	var sql = "INSERT INTO wbiao_user SET ?"
	pool.query(sql,[obj],(err,result)=>{
		if (err) { throw err; }
		if(result.affectedRows > 0){
			res.json({code:'200',msg:'ok'})
		}else{
			res.json({code:'400',msg:'error'})
		}
	})
});

// 查找用户是否存在
r.post('/hasuser', (req, res) => {
	var obj = req.body.phone;
	var sql = 'select id from wbiao_user where phone=?'
	pool.query(sql, [obj], (err, reslut) => {
		if (err) throw err;
		if (reslut.length > 0) {
			res.send('1')
		} else {
			res.send('0')
		}
	})
});

// 	//1用户注册的路由（ /reg）
// 	r.get('/reg',(req,res)=>{
// 		//1.1获取请求的数据
// 		let obj=req.query;
// 		console.log(obj);
// 		//1.2判断数据是否为空
// 		if (!obj.pwd){
// 			res.send({code:'402',msg:'pwd required'});
// 			//阻止往后执行
// 			return;
// 		}
	
// 		if (!obj.phone){
// 			res.send({code:'404',msg:'phone required'});
// 			//阻止往后执行
// 			return;
// 		}
// 		//1.3执行SQL命令
// 		pool.query('INSERT INTO user SET ?',[obj],(err,result)=>{
// 			if(err)throw err;
// 			console.log(result);
// 			res.send({code:'200',msg:'reg suc'});
// 		});
// 	});
// 	r.get('/login',(req,res)=>{
//   //2.1获取post请求的数据
//   let obj=req.query;
//   console.log(obj);
//   //2.2验证是否为空
//   if(!obj.phone){	
// 	r.get('/reg',(req,res)=>{
// 		//1.1获取请求的数据
// 		let obj=req.query;
// 		console.log(obj);
// 		//1.2判断数据是否为空
// 		if (!obj.pwd){
// 			res.send({code:'402',msg:'pwd required'});
// 			//阻止往后执行
// 			return;
// 		}
	
// 		if (!obj.phone){
// 			res.send({code:'404',msg:'phone required'});
// 			//阻止往后执行
// 			return;
// 		}
// 		//1.3执行SQL命令
// 		pool.query('INSERT INTO user SET ?',[obj],(err,result)=>{
// 			if(err)throw err;
// 			console.log(result);
// 			res.send({code:'200',msg:'reg suc'});
// 		});
// 	});
// 	r.get('/login',(req,res)=>{
//   //2.1获取post请求的数据
//   let obj=req.query;
//   console.log(obj);
//   //2.2验证是否为空
//   if(!obj.phone){
//     res.send({code:401,msg:'phone required'});
// 	return;
//   }
//   if(!obj.pwd){
//     res.send({code:402,msg:'pwd required'});
// 	return;
//   }
//   //2.3执行SQL命令
//   pool.query('SELECT * FROM user WHERE phone=? AND pwd=?',[obj.phone,obj.pwd],(err,result)=>{
//     if(err) throw err;
// 	console.log(result);
// 	//结果为数组，如果数组长度为0说明登录失败，否则登录成功
//     if(result.length===0){
// 	  res.send({code:301,msg:'login err'});
// 	}else{
// 	  res.send({code:200,msg:'login suc'});
// 	}
//   }); 
// });
// r.get('/select',(req,res)=>{
// 	let obj=req.query;
// 	if (!obj.cid){
// 		res.send('id不能为空');
// 		return;
// 	}
// 	pool.query('SELECT *FROM wbiao_index_carousel WHERE cid = ?',[obj.cid],(err,result)=>{
// 		if (err)throw err;
// 		console.log(result);
// 		console.log(result.length);
// 	});
// });
// 	//导出路由器对象
// module.exports=r;
//     res.send({code:401,msg:'phone required'});
// 	return;
//   }
//   if(!obj.pwd){
//     res.send({code:402,msg:'pwd required'});
// 	return;
//   }
//   //2.3执行SQL命令
//   pool.query('SELECT * FROM user WHERE phone=? AND pwd=?',[obj.phone,obj.pwd],(err,result)=>{
//     if(err) throw err;
// 	console.log(result);
// 	//结果为数组，如果数组长度为0说明登录失败，否则登录成功
//     if(result.length===0){
// 	  res.send({code:301,msg:'login err'});
// 	}else{
// 	  res.send({code:200,msg:'login suc'});
// 	}
//   }); 
// });
// r.get('/select',(req,res)=>{
// 	let obj=req.query;
// 	if (!obj.cid){
// 		res.send('id不能为空');
// 		return;
// 	}
// 	pool.query('SELECT * FROM wbiao_index_carousel WHERE cid = ?',[obj.cid],(err,result)=>{
// 		if (err)throw err;
// 		console.log(result);
// 		console.log(result.length);
// 	});
// });
	//导出路由器对象
module.exports=r;