require 'active_record'
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'

require './models.rb'

set :bind, "0.0.0.0"
set :sessions, true

get "/" do
	# params[:users] = User.all
	@users = User.all
	erb :index
end

get "/signup" do
	erb :signup
end

get "/login" do
	erb :login
end

get "/logout" do
	session.clear
	redirect to("/logout_successful")
end

get "/profile" do
	# @user = User.find(session[:user_id])
	@user = User.find(1)
	erb :profile
end

get "/main" do
	# @user = User.find(session[:user_id])
	@usersAll = User.all
	@user = User.find(session[:user_id])
	# @user = User.find(1)

	@postsAll = Post.all

	erb :main
end

get "/login_error" do
	"Either this username does not exist or password does not match the user's password."
end

get "/logout_successful" do
	"You have successfully logged out."
end

post "/user_login_attempt" do
	# constraints for success
	# 1. username needs to exist in the database
	# 2. password needs to match the username's password

	matching_users = User.all.where({
		:name => params[:username],
		:password => params[:password]
	})

	if matching_users.first
		# first way we can pass information to a redirect, by using a query string
		# redirect to("/profile" + "?" + matching_users.first.name)

		# second way we can pass information to a redirect, by using a session
		session[:user_id] = matching_users.first.id
		# redirect to("/profile")
		redirect to("/main")
	else
		redirect to("/login_error")
	end
end

post "/user_create" do
	if params[:username].empty? ||
		params[:email].empty? ||
		params[:password].empty?
		redirect to("/user_create_error")
	else
		User.create({
			:name => params[:username],
			:email => params[:email],
			:password => params[:password]
			})

		redirect to("/user_create_success")
	# "#{params}"
	end
end

get "/user_create_success" do
	@users = User.all
	erb :user_create_success
end

get "/user_create_error" do
	"You were missing a username or email or password. Could not create an account."
end

