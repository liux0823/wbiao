const express=require('express');
//引入连接池模块
const pool=require('../pool.js');
//console.log(pool);
//创建路由器对象
const r=express.Router();
//----------开始写项目-----------

// 获取分类数据
r.get('/category',(req,res)=>{
	pool.query(sql,(err,result)=>{
		if (err) { throw err; }
		res.json({category:result});
	})
});

// 商品列表
r.get('/list',(req,res)=>{
	var sql = 'select * from product';
	pool.query(sql,(err,result)=>{
		if (err) { throw err; }
		res.json({list:result})
	})
});

// 商品详情

r.get('/',(req,res)=>{
	var pid = req.query.id;
	console.log(pid);
	// var sql = 'select *,(select * from spec_value where id in (select value_id from good_spec where p_id = ?)) as specs from product where id = ?';
	var sql = 'select * from product where id = ?'
	pool.query(sql,[pid],(err,result)=>{
		if (err) { throw err; }
		var sql1 = 'select spec.id, name,msgs from spec inner join (select group_concat(value) as msgs,s_id from spec_value where id in (select value_id from good_spec where p_id = ?) group by s_id) as specvalue on spec.id=specvalue.s_id';
		var specs;
		var category;
		var brand;
		// 查找规格
		function seekSpec(){
			return new Promise((resolve,reject)=>{
				pool.query(sql1,[pid],(err1,result1)=>{
					if (err1) { throw err1; }
					// console.log(result1)
					specs = result1.map(item=>{
						return JSON.parse(JSON.stringify(item))
					})
					resolve()
				})
			})
		}
		// 查找种类
		function seekCate(){
			return new Promise( (resolve,reject)=>{
				pool.query('select * from category where id = ?',[result.c_id],(err1,result1)=>{
					if (err) { throw err1;}
					category = JSON.parse(JSON.stringify(result1))
					resolve()
				})
			})
		}
		// 查找品牌
		function seekBrand(){
			return new Promise( (resolve,reject) =>{
				pool.query('select * from brand where bid = ?',[result.brand_id],(err1,result1)=>{
					if (err) { throw err1;}
					brand = JSON.parse(JSON.stringify(result1))
					resolve()
				})
			})
		}
		async function seeks(){
			await Promise.all([seekSpec(),seekCate(),seekBrand()]);
			result.specs = specs;
			result.category = category;
			result.brand = brand;
			res.json(result);
		}
		result = JSON.parse(JSON.stringify(result[0]))
		seeks()
	})
})
//导出路由器对象
module.exports=r