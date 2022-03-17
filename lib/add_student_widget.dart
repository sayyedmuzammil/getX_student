// import 'dart:html';

// import 'package:album_saver/album_saver.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// import 'package:hive_db/screen_home.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sql_flite/controller.dart';
import 'package:sql_flite/screen_home.dart';
// import 'package:image_picker/image_picker.dart';
import 'mode/db_functions.dart';
import 'mode/data_model.dart';

final fetchControl = Get.put(FetchController());
final control = Get.put(Controller());

class AddStudentWidget extends StatelessWidget {
  final StudentModel? edit;

  AddStudentWidget({this.edit=null});

  final _nameController = TextEditingController();

  final _ageController = TextEditingController();

  final _stdController = TextEditingController();

  final _addressController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    print("7777 $edit ");
    if (edit != null) {
      _nameController.text = edit!.name!;
      _ageController.text = edit!.age.toString();
      _stdController.text = edit!.standard!;
      _addressController.text = edit!.address!;
      fetchControl.imageTemporary.value=edit!.profile;
    }


    return Container(
      margin: EdgeInsets.only(top: 10, left: 0),
      child: Container(

        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(
              20.0,
            ),
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // widget.edit==null || widget.edit==0?
                      Column(
                        children: [
                          Container(
                            alignment: Alignment(0.0, 2.5),
                          
                            child: Obx(() => 
                            
                            CircleAvatar(
                                radius: 50,
                                
                                backgroundImage:fetchControl.imageTemporary==''? (edit != null)
                                    ? Image.file(File(edit!.profile.toString()))
                                        .image
                                    : NetworkImage(
                                        "https://cdn2.iconfinder.com/data/icons/avatars-99/62/avatar-371-456323-512.png"):  
                                         Image.file(File(fetchControl.imageTemporary.toString()))
                                        .image),
                                      
                                        )
                            
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 30,

                                  // width: 110,
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      // onAddStudentButton();
                                      pickImage();

                                      // showAlertDialogue(context);
                                    },
                                    icon: const Icon(Icons.image),
                                    label: const Text(
                                      'Gallery',
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 30,
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    // onAddStudentButton();
                                    pickCamera();
                                    // print("this is url");
                                    // print(url);
                                    // showAlertDialogue(context);
                                  },
                                  icon: const Icon(Icons.camera),
                                  label: const Text('Camera'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Name',
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _ageController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Age',
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _stdController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Domain',
                          // enabled: false,
                        ),
                      ),

                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _addressController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Work Space',
                        ),
                      ),
                      const SizedBox(height: 10),

                      Container(
                        // margin:EdgeInsets.only(),

                        child: edit == null || edit == 0
                            ? Container(
                                // height: 97,

                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    onAddStudentButton(context);
                                  
                                  },
                                  icon: const Icon(Icons.add),
                                  label: const Text('Add Student'),
                                ),
                              )
                            : Container(
                                // width: 97,

                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    onUpdateStudentButton(
                                      context,
                                      id: edit!.id,
                                    );

                                    // showAlertDialogue(context);
                                  },
                                  icon: const Icon(Icons.update),
                                  label: const Text('UPDATE'),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onUpdateStudentButton(BuildContext context, {id}) async {
  print("update                       or             add ${fetchControl.imageTemporary}  \n id : $id");
  
    final _name = _nameController.text.trim();
    final _age = _ageController.text.trim();
    final _std = _stdController.text.trim();
    final String _address = _addressController.text.trim();

    // studentListNotifier.notifyListeners();

    if (_name.isEmpty ||
        _age.isEmpty ||
        _std.isEmpty ||
        _address.isEmpty || fetchControl.imageTemporary==''
      ) {
          // print("errooooooooooor");
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: Text("Some Error occured"),
              ));
      return;
    }
   print('$_name  and $_age or ${fetchControl.imageTemporary}');
    final _student = StudentModel(
        id: id,
        name: _name,
        age: int.parse(_age),
        standard: _std,
        address: _address,
        profile: fetchControl.imageTemporary.value);
        print("after name");
control.UpdateStudent(_student);
 fetchControl.imageTemporary.value='';
 
 
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => ScreenHome( /* currentSelected: fetchControl.indexChanged(0) ,data: null, */),
      ),
    );
  }

  Future<void> onAddStudentButton(BuildContext context) async {
    final _name = _nameController.text.trim();
    final _age =   _ageController.text.trim();
    final _std = _stdController.text.trim();
    final _address = _addressController.text.trim();
    // final _profile = ;

    if (_name.isEmpty ||
        _age.isEmpty ||
        _std.isEmpty ||
        _address.isEmpty || edit==null && fetchControl.imageTemporary==''
        ) {
     showDialog(context: context, builder: (ctx)=>  AlertDialog(title: Text("Some Error occured"),));
       return;
    }
    print('$_name  and $_age or ${fetchControl.imageTemporary}');
    final _student = StudentModel(
        name: _name,
        age: int.parse(_age) ,
        standard: _std,
        address: _address,
        profile: fetchControl.imageTemporary.value);
     control.addStudent(_student);
    fetchControl.imageTemporary.value='';

                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (ctx) => ScreenHome( /* currentSelected: fetchControl.indexChanged(0) ,data: null, */),
                                      ),
                                    );
  }

  Future<void> pickImage() async {
    try {
      final img = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (img == null) {
        return;
      }
      fetchControl.imageTemporary.value = await img.path;
      print(await fetchControl.imageTemporary);


    } on PlatformException catch (e) {
      print('Failed to pick image : $e');
    }
  }

  Future<dynamic> pickCamera() async {
    try {
      final img = await ImagePicker().pickImage(source: ImageSource.camera);
      if (img == null) {
        return;
      }
      fetchControl.imageTemporary.value = await img.path;
    
      return await fetchControl.imageTemporary.value;
    } on PlatformException catch (e) {
      print('Failed to pick image : $e');
    }
  }

}
