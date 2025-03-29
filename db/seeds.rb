# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

# Ensure users exist
user1 = User.find_or_create_by!(email: "kristina@example.com") do |user|
  user.name = "Kristina Docheva"
  user.bio = "Ruby developer passionate about APIs and UI."
  user.role = "admin"
  user.active = true
end

user2 = User.find_or_create_by!(email: "jordan@example.com") do |user|
  user.name = "Jordan Smith"
  user.bio = "Frontend engineer and coffee lover."
  user.role = "editor"
  user.active = true
end

# Ensure posts exist
Post.find_or_create_by!(title: "Welcome to the Blog", user: user1) do |post|
  post.content = "This is the very first post."
  post.published = true
end

Post.find_or_create_by!(title: "Rails + JSONAPI", user: user1) do |post|
  post.content = "Using jsonapi-serializer makes life easier."
  post.published = true
end

Post.find_or_create_by!(title: "Unpublished Draft", user: user2) do |post|
  post.content = "This post is not yet live."
  post.published = false
end
