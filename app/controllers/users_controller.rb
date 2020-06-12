class UsersController < ApplicationController 

    get '/dashboard' do 
        authenticate
        erb :'user/dashboard'
    end 
   
    get 'fridge/items/new' do
        authenticate
        erb :'fridge/new'
    end


end 