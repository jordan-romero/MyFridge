class FridgeController < ApplicationController 

    get '/fridge' do
        authenticate
        erb :'user/dashboard'
    end 

    get '/fridge/new' do
        authenticate 
        erb :'fridge/new'
    end

    get '/fridge/:id/show' do 
        authenticate
        erb :'fridge/show'
    end

    post '/fridge' do 
        authenticate
        if @fridge = current_user.fridge
            @fridge.items << Item.create(name: params[:name], expy_date: params[:expy_date])
            redirect 'fridge/:id/show'
        else
            puts "Oops! Something went wrong!"
            redirect '/fridge/new'
        end 
    end 
        
     

        
end 
