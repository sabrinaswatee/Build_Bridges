
require 'sinatra'
# require 'sinatra/reloader'
require 'sinatra/flash'
# require 'pry'
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
    flash[:error] = "Incorrect email and/or password combination"
    erb :index
  end
end

post '/buildbridges/add_enquiry' do
  enquiry = Enquiry.new
  enquiry.user_id = params[:user_id]
  enquiry.body = params[:body]
  enquiry.stamp = Time.now
  enquiry.save
  # redirect '/buildbridges/:id'
  @user = User.find(params[:user_id])
  @posts = Post.where(user_id: params[:user_id])
  erb :profile
end

delete '/buildbridges/enquiry/:id' do
  enquiry = Enquiry.find(params[:id])
  enquiry.destroy
  redirect '/buildbridges/user'
end

get '/buildbridges/user' do
  @user = User.find(session[:user_id])
  @posts = Post.where(user_id: session[:user_id])
  @enquiries = Enquiry.where(user_id: session[:user_id])
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
  if User.find_by(email: params[:email] = [])
    user = User.new
    user.email = params[:email]
    user.password = params[:password]
    user.name = params[:name]
    user.address = params[:address]
    user.save
    redirect '/buildbridges/login'
  else
    flash[:error] = "Email already exist"
    redirect'/buildbridges/new_user'
  end
end

post '/buildbridges/add_post' do
  post = Post.new
  post.user_id = session[:user_id]
  post.body = params[:body]
  post.location = params[:location]
  post.category = params[:category]
  post.stamp = Time.now
  post.save
  redirect '/buildbridges/user'
end


get '/buildbridges/search' do
  @user = User.find_by(name: params[:organization])
  if @user
    @posts = Post.where("location = ? OR category = ? OR user_id = ?", params[:location], params[:category], @user.id)
  else
    @posts = Post.where("location = ? OR category = ?", params[:location], params[:category])
  end
  erb :search
end

get '/buildbridges/personality_search' do
  erb :personality_search
end

get '/buildbridges/edit' do
  @user = User.find(session[:user_id])
  @posts = Post.where(user_id: session[:user_id])
  erb :edit
end

delete '/buildbridges/post/:id' do
  post = Post.find(params[:id])
  post.destroy
  redirect '/buildbridges/user'
end

get '/buildbridges/:id' do
  @user = User.find(params[:id])
  @posts = Post.where(user_id: params[:id])
  erb :profile
end

patch '/buildbridges/:id' do
  post = Post.find(params[:id])
  post.user_id = session[:user_id]
  post.body = params[:body]
  post.location = params[:location]
  post.category = params[:category]
  post.stamp = Time.now
  post.save
  redirect '/buildbridges/user'
end
