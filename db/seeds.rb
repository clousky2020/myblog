# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

label = "测试用标签"
Label.create(name: label)

(1..60).each do |num|
  a = Article.new
  a.title = "测试用，第#{num}篇"
  a.content = "这是测试用的自动生成内容，序号：#{num}"
  a.save
  a.labels << Label.first

end