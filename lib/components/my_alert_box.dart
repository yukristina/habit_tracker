import 'package:flutter/material.dart';

class MyAlertBox extends StatelessWidget {
  const MyAlertBox(
      {Key? key,
      this.controller,
      required this.onSave,
      required this.onCancel,
      required this.hintText})
      : super(key: key);

  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[900],
      content: TextField(
        controller: controller,
        style: TextStyle(color: Colors.grey[600]),
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.white),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white))),
      ),
      actions: [
        MaterialButton(
          onPressed: onSave,
          child: Text(
            'SAVE',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.black,
        ),
        MaterialButton(
          onPressed: onCancel,
          child: Text(
            'CANCEL',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.black,
        ),
      ],
    );
  }
}
