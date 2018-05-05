15.times do
  Topic.create!(
    name: RandomData.random_sentence,
    description: RandomData.random_paragraph
  )
end

topics = Topic.all

50.times do
  Post.create!(
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
puts "#{Topic.count} topic created"
puts "#{Post.count} post created"
puts "#{Question.count} question created"
puts "#{Advertisement.count} advertisements created"
puts "#{Comment.count} comments created"
