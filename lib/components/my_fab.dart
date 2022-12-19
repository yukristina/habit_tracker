import 'package:flutter/material.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({Key? key, this.onPressed}) : super(key: key);

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: onPressed, child: Icon(Icons.add));
  }
}
