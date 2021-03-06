# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#ユーザーの初期データの格納
User.create!(
  name: ENV['User_Name'],
  email: ENV['User_Email'],
  password: ENV['User_Password']
  )

#管理者の初期データ格納
Admin.create!(
  email: ENV['Admin_Email'],
  password: ENV['Admin_Password']
  )

Genre.create!(
  name:'RPG'
  )

Genre.create!(
  name:'シューティング'
  )

Genre.create!(
  name:'ボード'
  )

Genre.create!(
  name:'オープンワールド'
  )

Genre.create!(
  name:'スポーツ'
  )

Genre.create!(
  name:'音楽'
  )

Genre.create!(
  name:'レース'
  )

Genre.create!(
  name:'パズル'
  )

Genre.create!(
  name:'アドベンチャー'
  )

Genre.create!(
  name:'アクション'
  )

Genre.create!(
  name:'シュミレーション'
  )