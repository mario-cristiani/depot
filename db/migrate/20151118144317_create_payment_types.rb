class CreatePaymentTypes < ActiveRecord::Migration
  def up
    create_table :payment_types do |t|
      t.string :name

      t.timestamps null: false
    end

    # Populate payent types
    PaymentType.create([{name: 'Check'}, {name: 'Credit Card'}, {name: 'Purchase Order'}])
  end

  def down
    drop_table :payment_types
  end

end
