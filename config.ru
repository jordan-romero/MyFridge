require_relative './config/env'


use Rack::MethodOverride
use ListsController     
use FridgesController
use UsersController
use SessionsController 
run ApplicationController
