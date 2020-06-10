class Fridge < ActiveRecord::Base
    has_many :items, as: :itemizable 
    belongs_to :user
end 