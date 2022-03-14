import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'list_student_widget.dart';
import 'mode/db_functions.dart';

class screen_main extends StatelessWidget {
   screen_main({Key? key}) : super(key: key);

  
   final control = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    control.getAllStudents();
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            // AddStudentWidget(),

             Expanded(child: ListStudentWidget()),
          ],
        ),
      ),
    );
  }
}
