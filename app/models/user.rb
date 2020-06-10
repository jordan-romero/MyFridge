class User < ActiveRecord::Base 
    has_one :fridge
    has_one :list
    has_many :fridge_items, through: :fridge, source: :items
    has_many :list_items, through: :list, source: :items 
    has_secure_password
end 