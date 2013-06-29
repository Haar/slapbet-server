require 'rubygems'
require 'bundler/setup'

Bundler.require(:default, :development)

require './db_config'
Dir["./models/*"].each {|file| require file }

get '/' do
  "hello world"
end

### Begin user ###

#index users
get '/users' do
  users = User.all
  users.to_json
end

#create user
post '/users' do
  user = User.new(username: params[:username])
  if user.save
    "success"
  else
    "failure"
  end
end

#show user
get '/users/:username' do
  user =  User.find_by_username(params[:username])
  unless user.nil?
    user.to_json
  end
end

#update user
put '/users/:id' do
  user = User.find_by_id(params[:id])
  user.username = params[:username]
  if user.save
    "success"
  else
    "failure"
  end
end

#delete user
delete '/users/:username' do
  User.find_by_username(params[:username]).destroy
end

### End User ###

### Begin Friends ###

#create friendship
post '/friends/:id' do
  Friendship.create_for_users(params[:id], friend_id: params[:friend_id])
end

#delete friendship
delete '/user/:id/friends' do
  friendship = User::Friendship.find_by_user_id(params[:friend_id])
  if friendship.nil?
    friendship = User::Friendship.find_by_friend_id(params[:friend_id])
    unless friendship.nil?
      friendship.destroy
    end
  else
    friendship.destroy
  end
end

#show friends of user
get '/user/:id/friends' do
  user = User.find_by_id(params[:id])
  unless user.friendships.nil? || user.friendships_of.nil?
    friends = user.friends.to_a
    (friends.concat user.friend_of).to_json
  end
end

### End Friends ###
