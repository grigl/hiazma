# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# seed user
User.create(email: "admin@example.com", password: "qwerty", password_confirmation: "qwerty")

# six empty about sections
6.times do
  About.create(title: '', description: '')
end

# contacts page skeleton
Contact.create(description: '')

# setting for feedbacks reciever email
Setting.create(name: 'feedback_email_to', value: 'griglmail@gmail.com')

