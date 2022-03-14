import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:sql_flite/add_student_widget.dart';
import 'package:sql_flite/mode/db_functions.dart';

class FetchController extends GetxController{
    var imageTemporary="".obs;
     Future<void> DataInsetion1(studentid) async {
    //  int counter=0;

    if (studentid == null || studentid == 0) {
    imageTemporary.value="" ;
     return;
    }
    final student = await control.FetchData(studentid);
    imageTemporary.value = await student.profile;
  //  update(); 
   }
}
