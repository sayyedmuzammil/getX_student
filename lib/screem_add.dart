import 'package:flutter/material.dart';
import 'package:sql_flite/mode/data_model.dart';
import 'add_student_widget.dart';

class screen_add extends StatelessWidget {
  screen_add({this.data});
  StudentModel? data;

  @override
  Widget build(BuildContext context) {
    // print("000 in screen add out");
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
              AddStudentWidget(edit: data),
            ],
          ),
        ),
      ),
    );
  }
}
