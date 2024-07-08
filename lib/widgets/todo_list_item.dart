import 'package:flutter/material.dart';
import 'package:flutter_todoapp_provider/models/todo_model.dart';
import 'package:flutter_todoapp_provider/screens/edit_todo_screen.dart';
import 'package:provider/provider.dart';
import '../providers/todo_provider.dart';

class TodoListItem extends StatelessWidget {
  final Todo todo;

  const TodoListItem({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(todo.id.toString()),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Icon(Icons.delete, color: Colors.white),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<TodoProvider>(context, listen: false).deleteTodo(todo.id!);
      },
      child: Card(
        elevation: 2,
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EditTodoScreen(
                        todo: todo,
                      )),
            );
          },
          child: ListTile(
            title: Text(
              todo.title,
              style: TextStyle(
                decoration: todo.isCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            subtitle: Text(todo.description),
            trailing: Checkbox(
              value: todo.isCompleted,
              onChanged: (bool? value) {
                Provider.of<TodoProvider>(context, listen: false)
                    .toggleTodoStatus(todo);
              },
            ),
          ),
        ),
      ),
    );
  }
}
