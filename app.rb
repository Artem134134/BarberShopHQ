#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

# database connection
set :database, {adapter: "sqlite3", database: "HQ.sqlite"}

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end

before do
  @barbers = Barber.all
end

get '/' do
	@barbers = Barber.order "created_at DESC"    # all or order "created_at DESC"
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

#name, phone, datestamp, barber, color 

c = Client.new
c.name = @username
c.phone = @phone
c.datestamp = @datetime
c.barber = @barber
c.color = @color
c.save

  erb "<h2>Спасибо, вы записались!</h2>"		
end