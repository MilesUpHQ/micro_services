require 'order_service_services_pb'
require_relative 'product_service_client'

class OrderService < Ecommerce::OrderService::Service
  def create_order(request, _unused_call)
    # Validate each product by calling ProductService
    request.products.each do |product_info|
      ProductServiceClient.get_product(product_info.id)
    end

    # Mock creating an order and return a response
    Ecommerce::OrderResponse.new(id: SecureRandom.uuid)
  end
end

