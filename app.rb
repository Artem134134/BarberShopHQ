#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

# set :database, "sqlite3:barbershop.db"
set :database, { adapter: 'sqlite3', database: 'barbershop.db' }

class Client < ActiveRecord::Base 
end

class Barber < ActiveRecord::Base
end

before do
	@barbers = Barber.all
end

get '/' do
#	@barbers = Barber.order "created_at DESC"
	erb :index
end

get '/visit' do
	erb :visit
end


post '/visit' do 

@username = params[:username]
@phone    =  params[:phone]
@datetime = params[:datetime]
@barmen  = params[:barmen]
@color    = params[:color]

  erb "<h2>Спасибо, вы записались!</h2>"	
end	