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
20.times do
	Advertisement.create!(
		title: RandomData.random_sentence,
		copy: RandomData.random_paragraph,
		price: rand(1..100)
	)
end

50.times do
	Question.create!(
		title: RandomData.random_sentence,
		body: RandomData.random_paragraph,
    resolved: false
	)
end

post = Post.find_or_create_by!(title: "A unique title", body: "A unique body")
puts "#{Post.count}"

Comment.find_or_create_by(body: "unique body", post: post)


puts "Seed finished"
puts "#{Post.count} post created"
puts "#{Question.count} question created"
puts "#{Advertisement.count} advertisements created"
puts "#{Comment.count} comments created"
