require 'test_helper'

class CartTest < ActiveSupport::TestCase
  fixtures :carts, :line_items, :products

  test "adding unique products to cart should create separate line items" do
    cart = Cart.new
    b1 = products(:ruby)
    b2 = products(:rails)

    cart.add_product(b1.id, b1.price).save!
    cart.add_product(b2.id, b2.price).save!

    assert_equal 2, cart.line_items.size
    assert_equal b1.price + b2.price, cart.total_price
  end

  test "adding a duplicate products to cart should not create separate line items " do
    cart = Cart.new

    b1 = products(:ruby)
    b2 = products(:rails)

    cart.add_product(b1.id, b1.price).save!
    cart.add_product(b2.id, b2.price).save!
    cart.add_product(b1.id, b1.price).save!
    cart.add_product(b2.id, b2.price).save!

    assert_equal 2, cart.line_items.size
    assert_equal (b1.price + b2.price)*2, cart.total_price
  end

end