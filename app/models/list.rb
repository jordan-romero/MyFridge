class List < ActiveRecord::Base
    has_many :items, as: :itemizable, dependent: :destroy
    belongs_to :user
end 