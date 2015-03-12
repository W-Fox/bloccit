require 'faker'

# Create Posts
50.times do 
  Post.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
    )
end
posts = Post.all

# Create comments
100.times do 
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
    )
end

unique_post = {title: 'This is unique title', body: 'This is unique body'}
Post.where(unique_post).first_or_create

unique_comment = {post: Post.first, body: 'This is a unique comment'}
Comment.where(unique_comment).first_or_create

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
