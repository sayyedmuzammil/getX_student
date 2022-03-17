import 'package:get/get.dart';

import 'package:sql_flite/add_student_widget.dart';
import 'package:sql_flite/mode/data_model.dart';



class FetchController extends GetxController{

    var currentSelected=0.obs;
    var imageTemporary = ''.obs;
  Future<void> indexChanged(index) async {
     currentSelected.value=index;  
  
  }
  
   
}
