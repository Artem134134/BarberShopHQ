#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

# database connection
set :database, {adapter: "sqlite3", database: "HQ.sqlite"}

class Client < ActiveRecord::Base
  validates :name, presence: true, length:{ minimum: 3}
  validates :phone, presence: true, length:{ minimum: 5}
  validates :datestamp, presence: true
 
  validates :color, presence: true
end

class Barber < ActiveRecord::Base
  validates :name, presence: true, length:{ minimum: 3}
end

before do
  @barbers = Barber.all
  @clients =  Client.all
end

get '/' do
	@barbers = Barber.order "created_at DESC"    # all or order "created_at DESC"
	erb :index
end

get '/visit' do
  @c = Client.new
  erb :visit
end

post '/visit' do 

  # name, phone, datestamp, barber, color from params
  @c = Client.new params[:client]
 
  if @c.save 
      erb "<h2>Спасибо, вы записались!</h2>"		
  else
    @error = @c.errors.full_messages.first
    erb :visit
  end
end

get '/barber/:id' do
  @barber = Barber.find (params[:id])
  erb :barber 
end
