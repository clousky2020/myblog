# README

使用rails6搭建的个人博客，也是我学习rails的练习作，欢迎各位rails新手下载学习，共同进步。


开发环境依赖：
- Ruby(>= 2.5.7)
- Postgresql(>= 9.x)

## 配置：

- bundle install
- 更新对应的application.yml & database.yml
- rails s

后台登录 http://localhsot:3000/admin

## 发布应用
采用了 Capistrano 作为自动化发布工具, 使用 nginx, puma 为相关容器.


技术栈
- Ruby on Rails 6.0.3
- Ruby 2.5.7
- Capistrano3
- Postgresql