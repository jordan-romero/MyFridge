class User < ActiveRecord::Base 
    validates :username, uniqueness: true
    validates :password, length: {in: 6..20}, unless: ->(u){ u.password.blank? } 
    has_secure_password

    has_one :fridge, dependent: :destroy
    has_one :list, dependent: :destroy
    has_many :fridge_items, through: :fridge, source: :items
    has_many :list_items, through: :list, source: :items 

end 