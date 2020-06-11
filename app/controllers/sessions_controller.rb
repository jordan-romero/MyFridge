class SessionsController < ApplicationController

    get '/login' do 
        erb :"sessions/login"
    end 

    get '/signup' do 
        erb :"sessions/signup"
    end 

    post '/signup' do 
        @user = User.new(name: params[:name], username: params[:username], password: params[:password], email: params[:email])
        if @user.save
            session[:user_id] = @user.id
            redirect '/fridge'
        else
            erb :'/sessions/signup'
        end
    end 

    post '/login' do 
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/fridge'
        else 
            @error = "Invalid Credentials. Please try again."
            erb :"sessions/login"
        end 
    end 
end 