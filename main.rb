
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/flash'
require 'pry'
require 'pg'

require_relative 'db_config'
require_relative 'models/user'
require_relative 'models/post'
require_relative 'models/enquiry'

helpers do
  def logged_in?
    current_user ? true : false
  end

  def current_user
    User.find_by(id: session[:user_id])
  end
end

enable :sessions

get '/buildbridges' do
  erb :index
end

get '/buildbridges/login' do
  erb :login
end

post '/session' do
  user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/buildbridges/user'
  else
    # flash[:error] = "Incorrect email and/or password combination"
    erb :index
  end
end

get '/buildbridges/user' do
  @user = User.find(session[:user_id])
  # @posts = Post.find_by(session[:user_id])
  # @enquiries = Enquiry.find_by(session[:user_id])
  erb :profile
end

delete '/session' do
  session[:user_id] = nil
  redirect '/buildbridges'
end

get '/buildbridges/new_user' do
  erb :create_account
end

post '/buildbridges/new_user' do
  user = User.new
  user.email = params[:email]
  user.password = params[:password]
  user.name = params[:name]
  user.address = params[:address]
  user.save
  redirect '/buildbridges/login'
end

get '/buildbridges/search' do
  # @posts = Post.where(location: params[:location], category: params[:category], organization: params[:organization])
  erb :search
end

get '/buildbridges/personality_search' do
  "under contruction"
end
