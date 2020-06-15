class User < ActiveRecord::Base 
    has_one :fridge
    has_one :list
    has_many :fridge_items, through: :fridge, source: :items
    has_many :list_items, through: :list, source: :items 
    has_secure_password
    validates :username, uniqueness: true

    def slug
        self.username.downcase.tr("","-")
      end 
    
      def self.find_by_slug(slug)
        self.all.find do |instance|
          instance.slug == slug
        end 
     
      
    end
end 