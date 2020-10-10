module.exports={
    //懒加载
    chainWebpack:config=>{
        config.plugins.delete("prefetch")
    },
    //跨域
        devServer: {
            proxy: {
                // detail: https://cli.vuejs.org/config/#devserver-proxy
                '/api': {
                    // target: `http://服务器端接口地址统一前缀部分`,
                    target:`http://127.0.0.1:8989/`,
                    changeOrigin: true,
                    pathRewrite: {
                        '^/api': '' //将程序中的/api，替换为空字符串，再和target中的基础路径拼接起来作为发送到服务器的最终请求地址。
                    }
                }
            }
        }
}