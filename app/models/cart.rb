class Cart < ActiveRecord::Base
    has_many :line_items, dependent: :destroy 
    has_many :items, through: :line_items
    belongs_to :user 

    def total 
        cart_total = 0
        self.line_items.each do |line_item|
            #binding.pry
            cart_total += line_item.item.price * line_item.quantity  
        end 
        return cart_total 
    end 

    def add_item(item_id)
        #item = Item.find(item_id)
        
        #new_line_item = item.line_items.new 
        
        line_item = self.line_items.find_by(item_id: item_id)
        
        if line_item 
            line_item.quantity += 1    
        else 
            line_item=self.line_items.build(item_id: item_id)
        end 
        
        line_item 
        #if self.line_items.include?(item.line_items.new)
        #    binding.pry
        #    self.line_items.quantity += 1
        #end 
        #else
            #self.line_items << new_line_item
            #binding.pry
        #    new_line_item = item.line_items.new 
        #end                 
         
    end 

end
