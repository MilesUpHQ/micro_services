require 'product_service_services_pb'

class ProductService < Ecommerce::ProductService::Service
  def get_product(request, _unused_call)
    # Here you would typically retrieve product data from a database. For demonstration purposes, we'll return a mock product.
    product = find_product_by_id(request.id)

    if product
      Ecommerce::ProductResponse.new(
        id: product[:id],
        name: product[:name],
        description: product[:description],
        price: product[:price],
        stock: product[:stock]
      )
    else
      raise GRPC::BadStatus.new(GRPC::Core::StatusCodes::NOT_FOUND, 'Product not found')
    end
  end

  private

  # Mock method to mimic database retrieval
  def find_product_by_id(id)
  # Mocked product data
  return {
    id: '1',
    name: 'Ruby on Rails T-Shirt',
    description: 'Super soft and cozy T-Shirt with the Ruby on Rails logo.',
    price: 19.99, # Make sure the .proto expects a float for price, or convert it to cents if it expects an integer
    stock: 100
  } if id == '1'

  nil # Return nil if product is not found
end

end
