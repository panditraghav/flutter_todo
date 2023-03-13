import 'package:flutter/material.dart';
import 'package:flutter_todo/widgets/todo_item.dart';

class TodoList extends StatelessWidget {
  const TodoList(
      {super.key,
      required this.listItems,
      required this.checkedOnChange,
      required this.onDeleteItem});

  final List<dynamic> listItems;
  final Function(int index) checkedOnChange;
  final Function(int index) onDeleteItem;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ListView.builder(
            itemCount: listItems.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return TodoListItem(
                todoName: listItems[index][0],
                isCompleted: listItems[index][1],
                onChanged: (newVal) => checkedOnChange(index),
                onDelete: (ctx) => onDeleteItem(index),
              );
            },
          ),
        ],
      ),
    );
  }
}
