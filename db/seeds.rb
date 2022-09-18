# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
unless Category.count > 0
  Category.create name: '仕事'
  Category.create name: '買い物'
  Category.create name: '生活'
  Category.create name: '掃除'
  Category.create name: 'トレーニング'
  Category.create name: '練習'
  Category.create name: '習い事'
  Category.create name: '学習'
end