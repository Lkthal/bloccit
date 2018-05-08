5.times do
  User.create!(
    name: RandomData.random_name,
    email: RandomData.random_email,
    password: RandomData.random_sentence
  )
end

users = User.all

15.times do
  Topic.create!(
    name: RandomData.random_sentence,
    description: RandomData.random_paragraph
  )
end

topics = Topic.all

50.times do
  Post.create!(
    user: users.sample,
    topic: topics.sample,
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

20.times do
	SponsoredPost.create!(
    topic: topics.sample,
		title: RandomData.random_sentence,
		body: RandomData.random_paragraph,
		price: rand(1..100)
	)
end

sponsored_posts = SponsoredPost.all


50.times do
	Question.create!(
		title: RandomData.random_sentence,
		body: RandomData.random_paragraph,
    resolved: false
	)
end

user= User.first
user.update_attributes!(
  email: 'thal@bloc.io',
  password: 'helloworld'
)

topic = Topic.find_or_create_by!(name: "somthing", description: "unique description")
post = Post.find_or_create_by!( title: "A unique title", body: "A unique body that is too short", topic: topic, user: user)
#puts "#{Post.count}"

Comment.find_or_create_by(body: "unique body", post: post)


puts "Seed finished"
puts "#{User.count} user created"
puts "#{Topic.count} topic created"
puts "#{Post.count} post created"
puts "#{SponsoredPost.count} post created"
puts "#{Question.count} question created"
puts "#{Advertisement.count} advertisements created"
puts "#{Comment.count} comments created"
