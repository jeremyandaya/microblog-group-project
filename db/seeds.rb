require './models.rb'

# User.create({
# 	:name => "Brad",
# 	:email => "brad@gmail.com",
# 	:password => "123456",
# 	:post => "This is my last post!"
# 	})
# User.create({
# 	:name => "Zach",
# 	:email => "zachbuddy@yahoo.com",
# 	:password => "qwerty",
# 	:post => "Hello! My name is Zach!"
# 	})
# User.create({
# 	:name => "Kalamazoo",
# 	:email => "kalkal@msn.com",
# 	:password => "abcdef",
# 	:post => "Hello Active Record!"
# 	})


Post.create({
	:user_id => "1",
	:title => "The first title.",
	:body => "This is the body of my chirp!"
	})
Post.create({
	:user_id => "2",
	:title => "title 2",
	:body => "Let's do this!!!"
	})
Post.create({
	:user_id => "3",
	:title => "Announcement",
	:body => "Please read my announcement!"
	})