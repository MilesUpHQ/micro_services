#!/usr/bin/env ruby
require_relative '../config/environment'
require 'grpc'
require_relative '../app/services/product_service'

class Server
  def self.run
    s = GRPC::RpcServer.new
    s.add_http2_port('0.0.0.0:50051', :this_port_is_insecure) # Default port for ProductService
    s.handle(ProductService)
    puts '... running insecurely on 0.0.0.0:50051'
    s.run_till_terminated_or_interrupted([1, 'int', 'SIGQUIT'])
  end
end

Server.run
