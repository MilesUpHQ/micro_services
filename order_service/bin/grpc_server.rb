#!/usr/bin/env ruby
require_relative '../config/environment'
require 'grpc'
require_relative '../app/services/order_service'

class Server
  def self.run
    s = GRPC::RpcServer.new
    s.add_http2_port('0.0.0.0:50052', :this_port_is_insecure) # Notice the different port
    s.handle(OrderService.new)
    puts '... running insecurely on 0.0.0.0:50052'
    s.run_till_terminated
  end
end

Server.run

