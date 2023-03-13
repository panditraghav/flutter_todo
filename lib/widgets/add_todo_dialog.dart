import 'package:flutter/material.dart';

class AddTodoDialog extends StatelessWidget {
  const AddTodoDialog(
      {super.key, required this.controller, required this.onAdd});

  final TextEditingController controller;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: Theme.of(context).canvasColor,
      title: const Text("Add Todo"),
      contentPadding: const EdgeInsets.all(15),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(3),
        ),
      ),
      children: [
        TextField(
          controller: controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        Container(margin: const EdgeInsets.all(8)),
        ElevatedButton(
          onPressed: onAdd,
          child: Container(
            padding: const EdgeInsets.all(14),
            child: const Text("Add"),
          ),
        )
      ],
    );
  }
}
