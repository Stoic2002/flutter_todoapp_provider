import 'package:flutter/material.dart';
import 'package:flutter_todoapp_provider/models/todo_model.dart';
import 'package:provider/provider.dart';
import '../providers/todo_provider.dart';

class AddTodoScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Todo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
              ),
              SizedBox(height: 24),
              ElevatedButton(
                child: Text('Add Todo'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final newTodo = Todo(
                      title: _titleController.text,
                      description: _descriptionController.text,
                    );
                    Provider.of<TodoProvider>(context, listen: false)
                        .addTodo(newTodo);
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
