require 'rubygems'
require 'bundler/setup'
require './db_config'

Bundler.require(:default, :development)

require './models/users'

get '/' do
  "hello world"
end

post '/users' do
  @user = User.new(username: params[:username])
  if @user.save
    "success"
  else
    "failure"
  end
end

get '/users/:username' do
  if User.find_by_username(params[:username])
    "we have this user"
  end
end
