require './config/env'

class FridgeController < ApplicationController

    get '/fridge' do
        authenticate
        @user = current_user
        @fridge = current_user.fridge.id
        erb :'/fridge/index'
      end


    get '/fridge/new' do
        authenticate
        erb :'fridge/new'
    end

    get '/fridge/:id' do
        @fridge = current_user.fridge.id
        authorize(@fridge)
        erb :'fridge/index'
      end

    post '/fridge' do
        authenticate
        if current_user.fridge == nil
            Fridge.create(user: current_user)
        elsif
            @fridge = current_user.fridge
            @fridge.items << Item.create(name: params[:name], expy_date: params[:expy_date])
            redirect 'fridge/:id'

        else
            puts "Oops! Something went wrong!"
            redirect '/fridge/new'
        end
    end 


    get 'fridge/edit' do
        @item = Item.find_by(name: params[:name])
        erb :'fridge/edit'
    end

         

end
