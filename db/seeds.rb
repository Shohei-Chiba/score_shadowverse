# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


names =  ["エルフ", "ロイヤル", "ウィッチ" ,"ドラゴン", "ネクロマンサー", "ヴァンパイア", "ビショップ", "ネメシス"]

100.times do
  Result.create!(:name => names.sample(1).to_s, :user_id => 1, :pre_win => 1, :post_win => 0, :lose => 0)
  Result.create!(:name => names.sample(1).to_s, :user_id => 1, :pre_win => 0, :post_win => 1, :lose => 0)
  Result.create!(:name => names.sample(1).to_s, :user_id => 1, :pre_win => 0, :post_win => 0, :lose => 1)
end