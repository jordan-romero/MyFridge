class UsersController < ApplicationController 

    get '/fridge' do 
        authenticate
        @user = current_user
        erb :'users/fridge'
    end 

end 