import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoListItem extends StatelessWidget {
  final String todoName;
  final bool isCompleted;
  final Function(bool?) onChanged;
  final Function(BuildContext)? onDelete;

  const TodoListItem(
      {super.key,
      required this.todoName,
      required this.isCompleted,
      required this.onChanged,
      required this.onDelete});

  TextStyle? _getTextStyle() {
    if (isCompleted) {
      return const TextStyle(
        fontSize: 18,
        decoration: TextDecoration.lineThrough,
      );
    }
    return const TextStyle(
      fontSize: 18,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
      child: Slidable(
        endActionPane: ActionPane(
          children: [
            SlidableAction(
              onPressed: onDelete,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(5),
            ),
          ],
          motion: BehindMotion(),
        ),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.teal[100],
          ),
          child: Row(
            children: [
              Checkbox(
                value: isCompleted,
                onChanged: onChanged,
              ),
              Text(todoName, style: _getTextStyle()),
            ],
          ),
        ),
      ),
    );
  }
}
