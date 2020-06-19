class UsersController < ApplicationController 

    get '/dashboard' do 
        authenticate
        erb :'users/dashboard'
    end 

    get '/account/edit' do 
        authenticate
        erb :'users/edit_account'
    end 

    patch '/account' do 
        authenticate
        @user = current_user
        if !@user.authenticate(params[:password])
            @user.errors.add(:password, "was incorrect")
            erb :'users/edit_account'
        else
            
            if params[:new_password].empty? 
                @user.update(username: sanitize(params[:username]))
                if @user.errors.any? 
                    erb :'users/edit_account'
               else
                   redirect '/dashboard'
                end
             
            else
                @user.update(username: sanitize(params[:username]), password: sanitize(params[:new_password]), password_confirmation: sanitize(params[:new_password_confirmation]))
                if @user.errors.any? 
                    erb :'users/edit_account'
                else
                    redirect '/dashboard'
                end
        
            end
        end 
    end 



end 