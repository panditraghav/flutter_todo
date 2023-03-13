import 'package:flutter/material.dart';

import '../widgets/add_todo_dialog.dart';
import '../widgets/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> todo = [];

  final TextEditingController _newTodoController = TextEditingController();

  void _todoCheckedOnChange(int index) {
    setState(() {
      todo[index][1] = !todo[index][1];
    });
  }

  void _onTodoAdd() {
    setState(() {
      todo.add([_newTodoController.text,false]);
    });
    _newTodoController.clear();
    Navigator.of(context).pop();
  }

  void _todoOnDelete(int index){
    setState((){
      todo.removeAt(index);
    });
  }

  void _addTodo() {
    showDialog(
        context: context,
        builder: (context) {
          return AddTodoDialog(
            controller: _newTodoController,
            onAdd: _onTodoAdd,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Todo",
          ),
        ),
      ),
      body: TodoList(
        listItems: todo,
        checkedOnChange: _todoCheckedOnChange,
        onDeleteItem: _todoOnDelete,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodo,
        child: const Icon(Icons.add),
      ),
    );
  }
}
