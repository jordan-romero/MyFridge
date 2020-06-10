class ApplicationController < Sinatra::Base
    set :views, -> {File.join(root, "../views")}


    get '/' do 

        "hello world!"
        
    end 
end 