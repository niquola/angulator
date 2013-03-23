# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
1000.times do
  Client.new.tap do |u|
    u.name = Faker::Name.name
    u.email= Faker::Internet.email
    u.summary= Faker::Lorem.paragraph
  end.save
end

Roadmap.create(name: 'Angulator', description: "Objectives\n* Step 1\nMilestones\n* Step 1")
