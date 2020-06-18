class ApplicationController < Sinatra::Base
    configure do
        set :public_folder, Proc.new {File.join(root, "public")}
        set :views, -> {File.join(root, "../views")}
        enable :sessions
        set :session_secret, ENV['SESSION_SECRET']
      end
    


    get '/' do 

        erb :index

    end 


    helpers do 

    def current_user
        @user ||= User.find_by(id: session[:user_id])
    end 

    def logged_in? 
        !!current_user
    end 
        
    def authenticate
        redirect 'login' if !logged_in? 
    end 

    def authorize(lof)
        authenticate
        lof.user = current_user
        redirect "/dashboard" if lof.user != current_user
        end 
    end 

    def sanitize(params)
        Sanitize.fragment(params)
    end

    def render_navbar
        if logged_in? 
            erb :logged_in_navbar
        else 
            erb :logged_out_navbar
        end 
    end 
end 