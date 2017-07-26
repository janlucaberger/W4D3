# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

sex = ["M", "F"]

Cat.destroy_all
cats = []
10.times do
  cats << Cat.create!(birth_date:  Faker::Date.birthday(1, 10), color: Cat.colors.sample, name: Faker::Cat.name, sex: sex.sample , description: "The best cat")
end

CatRentalRequest.destroy_all

CatRentalRequest.create!(cat_id: cats.first.id, start_date: Date.new(2017,7,14), end_date: Date.new(2017,7,21))
CatRentalRequest.create!(cat_id: cats.first.id, start_date: Date.new(2017,7,22), end_date: Date.new(2017,7,29))
CatRentalRequest.create!(cat_id: cats.first.id, start_date: Date.new(2017,6,12), end_date: Date.new(2017,8,1))
CatRentalRequest.create!(cat_id: cats.first.id, start_date: Date.new(2017,7,16), end_date: Date.new(2017,7,18))
CatRentalRequest.create!(cat_id: cats.first.id, start_date: Date.new(2017,7,16), end_date: Date.new(2017,7,23))
CatRentalRequest.create!(cat_id: cats.first.id, start_date: Date.new(2017,7,10), end_date: Date.new(2017,7,18))
