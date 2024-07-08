import 'package:flutter/foundation.dart';
import 'package:flutter_todoapp_provider/models/todo_model.dart';
import '../services/database_helper.dart';

class TodoProvider with ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  Future<void> fetchTodos() async {
    _todos = await DatabaseHelper.instance.getTodos();
    notifyListeners();
  }

  Future<void> addTodo(Todo todo) async {
    final id = await DatabaseHelper.instance.insertTodo(todo);
    todo.id = id;
    _todos.add(todo);
    notifyListeners();
  }

  Future<void> toggleTodoStatus(Todo todo) async {
    todo.isCompleted = !todo.isCompleted;
    await DatabaseHelper.instance.updateTodo(todo);
    notifyListeners();
  }

  Future<void> updateTodo(Todo todo) async {
    await DatabaseHelper.instance.updateTodo(todo);
    final index = _todos.indexWhere((t) => t.id == todo.id);
    if (index != -1) {
      _todos[index] = todo;
      notifyListeners();
    }
  }

  Future<void> deleteTodo(int id) async {
    await DatabaseHelper.instance.deleteTodo(id);
    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }
}
