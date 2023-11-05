# test_grpc_client.rb
# require_relative 'path_to_your_services/product_service_services_pb'
$LOAD_PATH.unshift('/opt/sandbox/rails-projects/micro_services/product_service/app/services')

require 'grpc'
require 'product_service_services_pb'

def main
  stub = Ecommerce::ProductService::Stub.new('localhost:50051', :this_channel_is_insecure)
  request = Ecommerce::ProductRequest.new(id: '1')
  begin
    response = stub.get_product(request)
    puts "Product: #{response.name}"
  rescue GRPC::BadStatus => e
    puts e.to_s
  end
end

main if __FILE__ == $PROGRAM_NAME
