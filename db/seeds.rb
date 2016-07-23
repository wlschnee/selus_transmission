# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "Main Admin", email: "main@admin.com", password: 'asdf', admin: true)

10.times do
  user_name = Faker::Name.name
  user_email = Faker::Internet.email
  User.create(name: user_name, email: user_email, password: 'asdf')
end

20.times do
  Category.create(name: Faker::Company.buzzword, description: Faker::Company.catch_phrase)
end

main_admin = User.first
main_admin.admin = true
main_admin.save

User.all.each do |user|
  post_count = Random.rand(10)
  post_count.times do
    post_title = Faker::Hipster.words(4).join(" ")
    post_content = Faker::Hipster.paragraphs(3..5).join(" ")
    Post.create(title: post_title, content: post_content, category_id: Random.rand(20), user: user)
  end
end