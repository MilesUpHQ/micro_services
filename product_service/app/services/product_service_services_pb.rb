# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: product_service.proto for package 'ecommerce'

require 'grpc'
require 'product_service_pb'

module Ecommerce
  module ProductService
    # The ProductService definition.
    class Service

      include ::GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = 'ecommerce.ProductService'

      # Retrieves product information by ID
      rpc :GetProduct, ::Ecommerce::ProductRequest, ::Ecommerce::ProductResponse
    end

    Stub = Service.rpc_stub_class
  end
end
