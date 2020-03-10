# xy-operation-app
# 1、安装依赖并启动服务 #

## 1.1 前端 ##
	
	$ cd admin_site
	$ npm install
    $ ng serve

## 1.2 后端 ##

    $ cd api_server
    $ mix deps.get
    $ mix ecto.migrate
    $ mix run priv/repo/seeds.exs
    $ mix phx.server

# 2、访问 #

浏览器访问 http://localhost:4200 默认用户名admin，密码admin123
