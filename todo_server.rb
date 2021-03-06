require 'rubygems'
require 'bundler/setup'
require './lib/todo_service'

Bundler.require(:default)

  
class TodoServer
  class << self
    def start
      start_grpc_server
    end

    private

    def start_grpc_server
      @server = GRPC::RpcServer.new(pool_size: 5)
      @server.add_http2_port('0.0.0.0:50052', :this_port_is_insecure)
      @server.handle(TodosServices)
      @server.run_till_terminated
    end
  end
end

TodoServer.start