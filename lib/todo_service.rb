require 'rubygems'
require 'bundler/setup'

Bundler.require(:default)

require './lib/protos/todo_services_pb'
require './app'


class TodosServices < TodoPackage::TodoServices::Service
    
    def create_todo(request, _unused_call)
        puts request
        TodoController.create_todo(request)
    end

    def read_todos(request, _unused_call)
        TodoController.read_todos(request)
    end
end