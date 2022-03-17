import 'package:get/get.dart';




class FetchController extends GetxController{

    var currentSelected=0.obs;
    var imageTemporary = ''.obs;
  Future<void> indexChanged(index) async {
     currentSelected.value=index;  
  
  }
  
   
}
