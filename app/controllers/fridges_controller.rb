require './config/env'

class FridgesController < ApplicationController

    get '/fridge' do
        authenticate
        @user = current_user
        if current_user.fridge == nil
            Fridge.create(user: current_user)
        end 
       
        @fridge = current_user.fridge
        @item = @fridge.items.find_by(id: params[:id])
        erb :'fridge/index'
      end


    get '/fridge_items/new' do
        authenticate
        erb :'fridge_items/new'
    end

    get '/fridge_items/:id' do
        authenticate
        @fridge = current_user.fridge
        @item = @fridge.items.find_by(id: params[:id])
        # authorize(@fridge)
        erb :'fridge_items/show'
      end

    post '/fridge' do
        authenticate
            @fridge = current_user.fridge
            @fridge_items = @fridge.items 
            @fridge_items << Item.create(name: params[:name], expy_date: params[:expy_date])
            redirect '/fridge'
    end


    get '/fridge_items/:id/edit' do
        authenticate
        @fridge = current_user.fridge
        @item = Item.find_by(id: params[:id])
        erb :'fridge_items/edit'
    end
    

     patch '/fridge_items/:id' do 
        authenticate
            @fridge = current_user.fridge
            @item = Item.find_by(id: params[:id])
            @item.update(name: params[:name], expy_date: params[:expy_date]) 
         redirect '/fridge'
     end 
     
     
     
     
    delete '/fridge_items/:id' do 
        authenticate
        @fridge = current_user.fridge
        @item = Item.find_by(id: params[:id])
        @item.destroy
        redirect "/fridge"
    end 


end
