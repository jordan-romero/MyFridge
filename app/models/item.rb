class Item < ActiveRecord::Base 
    belongs_to :itemizable, polymorphic: true

    def from_fridge?
        self.itemizable.is_a?(Fridge)
    end

    def fridge
        self.itemizable if from_fridge?
    end

    def list
        self.itemizable if from_list?
    end

    def from_list?
        self.itemizable.is_a?(List)
    end

    def create_items(items)
        items.each do |items|
          if items[:name] != ""
            Item.create(
              name: params[:name])
          end
        end
    end 
end 