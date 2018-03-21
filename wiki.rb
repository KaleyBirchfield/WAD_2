require 'sinatra'
require 'data_mapper'
DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/wiki.db")
class User
  include DataMapper::Resource
  property :id, Serial
  property :username, Text, :required => true
  property :password, Text, :required => true
  property :date_joined, DateTime
end

DataMapper.finalize.auto_upgrade!

$myinfo = ""
@info = ""

set :port, 9001

helpers do
  def protected!
    if authorized?
      return
    end
    redirect '/denied'
  end
  def authorized?
    if $credentials != nil
      @Userz = User.first(:username => $credentials[0])
      if @Userz
        return true
      else
        return false
      end
    else
      return false
    end
  end
end


get '/' do
  erb :home
end

get '/about' do

  erb :about
end

get '/create' do

  erb :create
end

get '/login' do
  erb :login
end

post '/login' do
  $credentials = [params[:username],params[:password]]
  @users = User.first(:username => $credentials[0])
  if @users
    if @users.password == $credentials[1]
      redirect '/'
    else
      $credentials = ['','']
      redirect '/wrongaccount'
    end
  else
    $credentials = ['','']
    redirect '/wrongaccount'
  end
end

get '/createaccount' do
  erb :createaccount
end

post '/createaccount' do
  u = User.first(:username => params[:username])
  if u != nil
    redirect '/usernametaken'
  end
  n = User.new
  n.username = params[:username]
  n.password = params[:password]
  n.date_joined = Time.now
  n.save
  redirect '/login'
end

get '/profile' do

  erb :profile
end

get '/usernametaken' do
  erb :usernametaken
end

get '/wrongaccount' do
  erb :wrongaccount
end

get '/user/:uzer' do
  @userz = User.first(:username => params[:uzer])
  if @userz != nil
    erb :profile
  else
    redirect '/noaccount'
  end
end

put '/user/:uzer' do
  n = User.first(:username => params[:uzer])
  n.save
  redirect '/'
end

get '/logout' do
  $credentials = ['','']
  redirect '/'
end

get '/notfound' do
  erb :notfound
end

get '/noaccount' do
  erb :noaccount
end

get '/admindenied' do
  erb :admindenied
end

get '/denied' do
  erb :denied
end

not_found do
  status 404
  redirect '/notfound'
end