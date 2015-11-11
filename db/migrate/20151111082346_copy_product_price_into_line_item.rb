class CopyProductPriceIntoLineItem < ActiveRecord::Migration
  def self.up
    change_column :line_items, :product_price, :decimal, :precision => 8, :scale => 2

    LineItem.all.each do |line|
      line.update_attributes :product_price => line.product.price
    end
  end

  def self.down
    change_column :line_items, :product_price, :decimal
  end
end
