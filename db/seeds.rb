# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#ユーザーの初期データの格納
User.create!(
  name:'ゲーム太郎',
  email:'taro@game.com',
  password:'123456'
  )
  

Genre.create!(
  name:'RPG'
  )