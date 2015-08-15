require './config/environment'
require './app/models/person'
# require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  post '/result' do
    @person = Person.new(params[:first_name], params[:last_name], params[:company_site])
    erb :result
  end

  post '/add' do
    @add_person = Person.new(params[:first_name], params[:last_name], params[:company_site], params[:email])
    @add_person.add_to_hash
    erb :add
  end

end