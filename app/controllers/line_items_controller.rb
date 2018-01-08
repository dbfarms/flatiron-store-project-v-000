class LineItemsController < ApplicationController

    def create 
        #item = Item.find(params[:item_id])
        #LineItem.create(:item_id => item.id)
        
        #binding.pry
        current_user.create_current_cart unless current_user.current_cart
        #binding.pry
        line_item = current_user.current_cart.add_item(params[:item_id])
        
        #binding.pry 
        
        #current_user.current_cart.items << Item.find(params[:item_id]) 
        #binding.pry
        #User.first = current_user 
        #@user = current_user 
        
        if line_item.save
          redirect_to cart_path(current_user.current_cart), {notice: 'Item added to cart!'}
        else
          redirect_to store_path, {notice: 'Unable to add item'}
        end

    end

end
