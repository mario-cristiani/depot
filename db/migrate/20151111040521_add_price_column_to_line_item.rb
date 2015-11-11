class AddPriceColumnToLineItem < ActiveRecord::Migration
  def change
     add_column :line_items, :product_price, :decimal
  end
end
