# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#require 'random_data'
# create Post
50.times do

  Post.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end
posts = Post.all

#create comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end
Post.find_or_create_by!(title: "A unique title", body: "A unique body")
puts "#{Post.count}"

Post.find_or_create_by!(title: "A unique title") do |comment|
  Comment.body = "the original title"
end

puts "Seed finished"
puts "#{Post.count} post created"
puts "#{Comment.count} comments created"
