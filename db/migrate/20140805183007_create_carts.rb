class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t| 
      t.integer :user_id
      t.integer :total 
      t.string :status 
    end 
  end
end
