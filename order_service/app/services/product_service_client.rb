module Services
  class ProductServiceClient
    def initialize
      @stub = Ecommerce::ProductService::Stub.new('product_service_host:port', :this_channel_is_insecure)
    end

    def get_product(id)
      @stub.get_product(Ecommerce::ProductRequest.new(id: id))
    rescue GRPC::BadStatus => e
      # Handle the exception appropriately
    end
  end
end
