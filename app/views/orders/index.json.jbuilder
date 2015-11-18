json.array!(@orders) do |order|
  json.extract! order, :id, :name, :address, :email, :payment_type_id
  json.url order_url(order, format: :json)
end
