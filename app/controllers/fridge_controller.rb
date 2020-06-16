require './config/env'

class FridgeController < ApplicationController
    
    set :method_override, true

    get '/fridge' do
        authenticate
        @user = current_user
        @fridge = current_user.fridge
        erb :'/fridge/index'
      end


    get '/fridge/new' do
        authenticate
        erb :'fridge/new'
    end

    get '/fridge/show' do
        @fridge = current_user.fridge
        @fridge.items.find_by(params[:name])
        # authorize(@fridge)
        erb :'fridge/show'
      end

    post '/fridge' do
        authenticate
        if current_user.fridge == nil
            Fridge.create(user: current_user)
        elsif
            @fridge = current_user.fridge
            @fridge.items << Item.create(name: params[:name], expy_date: params[:expy_date])
            redirect '/fridge'

        else
            puts "Oops! Something went wrong!"
            redirect '/fridge/new'
        end
    end

    get '/fridge/edit' do
        authenticate
        @fridge = current_user.fridge
        @fridge.items.find_by(name: params[:name], expy_date: params[:expy_date])
        erb :'fridge/edit'
    end

    # patch '/fridge/' do 
    #     authenticate
    #     @fridge.items.find_or_create_by(name: params[:name], expy_date: params[:expy_date])

    #     if @fridge.items.update(name: params[:name], expy_date: params[:expy_date])
    
    #     redirect '/fridge/:name'

    #     else

    #         erb :'fridge/<%=@fridge.item.name%>/edit'
    #     end 
     
    # end 
    delete '/fridge/:name' do 
        @fridge_item = current_user.fridge.items.find_by(name: params[:name], expy_date: params[:expy_date])
        @fridge_item.destroy
        redirect "fridge/index"
    end 


end
