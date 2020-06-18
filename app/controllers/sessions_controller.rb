class SessionsController < ApplicationController

    get '/login' do 
        erb :"sessions/login"
    end 

    get '/signup' do 
        erb :"sessions/signup"
    end 

    post '/signup' do 
        @user = User.new(name: sanitize(params[:name]), username: sanitize(params[:username]), password: sanitize(params[:password]), email: sanitize(params[:email]))
        if @user.save
            session[:user_id] = @user.id
            redirect '/dashboard'
        else
            erb :'/sessions/signup'
        end
    end 

    post '/login' do 
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/dashboard'
        else 
            @error = "Invalid Credentials. Please try again."
            erb :"sessions/login"
        end 
    end 

    get '/logout' do
        if logged_in?
          session.destroy
          redirect to '/login'
        else
         redirect to '/'
        end
     end
end 