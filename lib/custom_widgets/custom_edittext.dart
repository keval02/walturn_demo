import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomEditText extends StatelessWidget {
  final TextEditingController editingController;
  final Function onTextChange;
   final String? label;

  const CustomEditText({Key? key, required this.editingController, required this.onTextChange, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: "",
                    )))));
  }
}
