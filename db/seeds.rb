require 'faker'

users = {}
5.times do
  user = User.find_or_initialize_by(  name:   Faker::Name.name,
                                      email:  Faker::Internet.email )
  password = rand(1000)
  users[user.email] = password
  user.password = password
  user.save
end

# puts "please copy user login data and press return to continue"
# sleep(10)

15.times { Tag.find_or_create_by(name: Faker::Hipster.word) }

25.times do
  Entry.create( title:      Faker::Hipster.words(3).join(" "),
                body:       Faker::Hipster.paragraph(8),
                author_id:  (rand(User.count - 1) + 1))
end

35.times do
  Tagging.find_or_create_by(  entry_id: (rand(Entry.count - 1) + 1),
                              tag_id:   (rand(Tag.count - 1) + 1) )
end 

100.times do
  Comment.create( author_id: (rand(User.count - 1) + 1),
                  entry_id:  (rand(Entry.count - 1) + 1),
                  body:      Faker::Hipster.paragraph(2) )
end

puts 'DUMMY USERS:'
users.each { | email, password | puts "email: #{email}\npassword:#{password}\n\n" }

 
