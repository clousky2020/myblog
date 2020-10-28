# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


labels = ["随笔", "技术知识", "测试"]
labels.each do |label|
  Label.create(name: label)
end
if Rails.env.development?
  (1..60).each do |num|
    a = Article.new
    a.title = "测试用，第#{num}篇"
    a.content = "这是测试用的自动生成内容，序号：#{num}"
    a.save
    a.labels << Label.first
  end
end

positions = ['设计师', '教师', '程序员', '操作工']
work_contents = ['设计', '讲课', '编写', '操作', '摸鱼']
phones = ['13569812191', '13706771234', '13703211124', '13706771567', '13707891111', '1370654999']

#创建企业账户
(1..3).each do |num|
  user = Recruitment::Company.new
  user.company_name = "企业用户#{num}"
  user.company_email = "company#{num}@qq.com"
  user.password = "123456"
  user.company_phone = phones.sample
  user.company_recruiter_name = "HR"
  user.recruiter_phone = phones.sample
  user.save
end
#创建个人用户
(1..2).each do |num|
  user = Recruitment::User.new
  user.name = "个人用户#{num}"
  user.email = "user#{num}@qq.com"
  user.password = "123456"
  user.save
end

users = Recruitment::Company.all
users.each do |user|
  (1..5).each do |_|
    name = positions.sample
    description = work_contents.sample
    salary_down_limit = rand(2000)
    salary_up_limit = rand(2000..10000)
    work_age = rand(10)
    gender = ['男', '女'].sample
    language_requirement = ['英语', '法语', "汉语", '德语'].sample
    recruitment_department = ['技术', '销售', "财务", '人事'].sample
    hiring_number = rand(10)
    min_age = rand(18..50)
    max_age = min_age + rand(20)

    user.recruitment_jobs.build(name: name, description: description, salary_down_limit: salary_down_limit,
                                work_age: work_age, salary_up_limit: salary_up_limit, show: true, gender: gender,
                                hiring_number: hiring_number, min_age: min_age, max_age: max_age,
                                language_requirement: language_requirement, recruitment_department: recruitment_department)
    user.save
  end
end