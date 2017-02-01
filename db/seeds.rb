# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
unless User.exists?(email: 'admin@example.com')
  User.create!(email: 'admin@example.com', password: 'password', admin: true)
end

150.times do
  User.create!(email: Faker::Internet.email, password: 'password')
end

project_names = [
  'Project Maker', 'Resume Scanner', 'String Reverser',
  'Real time messenger', 'Code wars puzzles', 'Codersations',
  'The Manhattan Project', 'Portfolio Builder', 'Deal Finder', 'Policy Maker',
  'Movie Rater', 'Pantry Analyzer', 'Wild Thing Creator'
]

sources = [
  'Rails', 'Ruby', 'Python', 'HTML', 'CSS', 'PHP', 'Love', 'Clojure',
  'Phoenix', 'Super Man', 'Apache Cordova'
]

User.all.each do |user|
  user.update!(bio: Faker::Lorem.paragraph, location: 'Toronto')
  user.projects.create!(title: project_names.sample,
                        description: Faker::Lorem.paragraph,
                        level: rand(1..5), tag_list: sources.sample)
end
