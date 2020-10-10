const express = require('express');
const r = express.Router();
const pool = require('../pool.js');

r.get('/banner',(req,res)=>{
	pool.query('select cid,img,title,href from wbiao_carousel',(err,result)=>{
		if (err) throw err;
		res.json({banners:result})
	})
})

module.exports = r;