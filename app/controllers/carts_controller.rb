class CartsController < ApplicationController

    def show 
        @user = User.find(params[:id])
    end 
    
    def checkout
        @user = User.find(params[:id])
        
        @user.current_cart.line_items.each do |item|
            stock = Item.find(item.id)
            stock.inventory = stock.inventory - item.quantity
            stock.save
        end
        @user.current_cart = nil
        LineItem.destroy_all
        @user.save
        
        redirect_to cart_path #(@current_cart)
    end 

end
