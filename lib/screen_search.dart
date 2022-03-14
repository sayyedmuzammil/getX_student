import 'package:flutter/material.dart';
import 'list_student_widget.dart';
import 'search_student_widget.dart';

class screen_search extends StatelessWidget {
  screen_search({this.id = 0});
  int? id;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            // Padding(padding: )
            SearchStudentWidget(),
             Expanded(
                child: ListStudentWidget(
              currentPage: 1,
            )),
          ],
        ),
      ),
    );
  }
}
