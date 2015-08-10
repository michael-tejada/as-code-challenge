require './config/environment'
require './app/models/email'
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
    @client = Email.new(params[:name], params[:company])
    erb :result
  end

end