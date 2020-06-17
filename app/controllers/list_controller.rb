class ListController < ApplicationController 

    get '/list' do 
      authenticate
      @user = current_user
      @list = current_user.list.id 
      erb :'list/index'
    end 
 
    get '/list/new' do 
        authenticate
        @user = current_user
        erb :'/list/new'
      end 

    get '/list/:id' do
        authenticate
        @list = current_user.list.id
        # authorize(@fridge)
        erb :'list/index'
    end


    post '/list' do
      
        authenticate
        if current_user.list == nil 
            List.create(user: current_user)
        end  
        @list = current_user.list
 
          redirect '/list'
        
    end  
     

    get '/list/:id/edit' do
      authenticate
      @list = current_user.list
      @list.items.find_by(name: params[:name])
      erb :'/list/edit'
   end


  delete '/list/:id' do 
    @list_item = current_user.list.items.find_by(name: params[:name])
    redirect "list/index"
  end 

end 
 