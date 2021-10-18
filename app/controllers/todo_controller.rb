class TodoController
    def self.create_todo(request)
        todo = TodoPackage::TodoItemCreate.new(title: request.title, description: request.description)
        TodoPackage::TodoResponse.new(id: 1, title: todo.title, description: todo.description)
    end

    def self.read_todos(request)
    end
end