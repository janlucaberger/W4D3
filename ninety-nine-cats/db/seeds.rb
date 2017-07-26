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
