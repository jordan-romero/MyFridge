class ListController < ApplicationController 

    get '/list' do 
      authenticate
        @user = current_user
        if current_user.list == nil
             List.create(user: current_user)
        end 
       
        @list = current_user.list
        @item = @list.items.find_by(id: params[:id])
        erb :'list/index'
    end 
 
    get '/list_items/new' do 
        authenticate
        erb :'list_items/new'
      end 

    get '/list_items/:id' do
        authenticate
        @list = current_user.list
        @item = @list.items.find_by(id: params[:id])
        # authorize(@list)
        erb :'list_items/show'
    end


    post '/list' do
      authenticate
      @list = current_user.list
      params[:items].each do |ih| 
       if ih[:name] != ""
          Item.create(name: ih[:name], itemizable: @list)   
       end
      end 
      redirect '/list'
        
    end  
     

    get '/list_items/:id/edit' do
      authenticate
      @list = current_user.list
      @item = @list.items.find_by(id: params[:id])
      erb :'list_items/edit'
   end

   patch '/list_items/:id' do 
    authenticate
      @list = current_user.list
      @item = Item.find_by(id: params[:id])
      @item.update(name: params[:name]) 
      redirect '/list'
  end 


  delete '/list_items/:id' do 
    authenticate
    @list = current_user.fridge
    @item = Item.find_by(id: params[:id])
    @item.destroy
    redirect "/list"
end 

end 
 