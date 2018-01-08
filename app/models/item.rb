class Item < ActiveRecord::Base
    belongs_to :category 
    has_many :line_items
    #has_many :order_items
    
    def self.available_items
        available = []
        Item.all.each do |item|
            if item.inventory > 0
                available << item 
            end 
        end 
        available 
    end 
end
