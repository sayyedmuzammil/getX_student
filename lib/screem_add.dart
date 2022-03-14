import 'package:flutter/material.dart';
import 'add_student_widget.dart';

class screen_add extends StatelessWidget {
  screen_add({this.id = 0});
  int? id;

  @override
  Widget build(BuildContext context) {
    // getAllStudents();
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Container(
          child: Column(
            children: [
              AddStudentWidget(edit: id),
            ],
          ),
        ),
      ),
    );
  }
}
