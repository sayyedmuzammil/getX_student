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
  final int? edit;

  AddStudentWidget({this.edit = 0});

  final _nameController = TextEditingController();

  final _ageController = TextEditingController();

  final _stdController = TextEditingController();

  final _addressController = TextEditingController();

// final _imageController =TextEditingController();

// String fetchControl.student.imageTemporary="/data/user/0/com.example.sql_flite/cache/image_picker8166399740605715662.jpg";//photo from phone
  // String fetchControl.student.imageTemporary =""; //photo from emulator

  // @override
  // void () {
  //   DataInsetion(edit);
  //   //innitail value of text field
  //   // setState(() {});
  //   // super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    print("the id is ");
    print("${edit}, ${fetchControl.imageTemporary} ");
    if (edit != null) {
      DataInsetion(edit);
    }
    // setState(() {});

    print("body of this page.................");
    // print(form_edit);

    return Container(
      margin: EdgeInsets.only(top: 10, left: 0),
      child: Container(
        //  height:MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
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
                            child: Obx(() => CircleAvatar(
                                  radius: 50,
                                  backgroundImage: fetchControl
                                              .imageTemporary ==
                                          ""
                                      ? NetworkImage(
                                          "https://cdn2.iconfinder.com/data/icons/avatars-99/62/avatar-371-456323-512.png")
                                      : Image.file(File(fetchControl
                                              .imageTemporary
                                              .toString()))
                                          .image,
                                )),
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
                                    onAddorUpdateStudentButton(context);
                                    //  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=> ScreenHome(),),);
                                    // showAlertDialogue(context);
                                  },
                                  icon: const Icon(Icons.add),
                                  label: const Text('Add Student'),
                                ),
                              )
                            : Container(
                                // width: 97,

                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    onAddorUpdateStudentButton(
                                      context,
                                      id: edit,
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

  Future<void> onAddorUpdateStudentButton(BuildContext context, {id}) async {
    final _name = _nameController.text.trim();
    final _age = _ageController.text.trim();
    final _std = _stdController.text.trim();
    final String _address = _addressController.text.trim();

    studentListNotifier.notifyListeners();

    if (_name.isEmpty ||
        _age.isEmpty ||
        _std.isEmpty ||
        _address.isEmpty ||
        fetchControl.imageTemporary == "") {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: Text("Some Error occured"),
              ));
      return;
    }
    print('$_name  and $_age or ');
    final _student = StudentModel(
        id: id,
        name: _name,
        age: int.parse(_age),
        standard: _std,
        address: _address,
        profile: fetchControl.imageTemporary.toString());
    id != null ? control.UpdateStudent(_student) : control.addStudent(_student);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => ScreenHome(),
      ),
    );
  }

/*   Future<void> onUpdateStudentButton(id, BuildContext context) async {
    final _name = _nameController.text.trim();
    final _age =   _ageController.text.trim();
    final _std = _stdController.text.trim();
    final _address = _addressController.text.trim();
    // final _profile = ;

    if (_name.isEmpty ||
        _age.isEmpty ||
        _std.isEmpty ||
        _address.isEmpty ||
        fetchControl.student.imageTemporary == "" ) {
     showDialog(context: context, builder: (ctx)=>  AlertDialog(title: Text("Some Error occured"),));
       return;
    }
    print('$_name  and $_age or ');
    final _student = StudentModel(
        id: id,
        name: _name,
        age: int.parse(_age) ,
        standard: _std,
        address: _address,
        profile: fetchControl.student.imageTemporary);
    UpdateStudent(_student);
    
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (ctx) => ScreenHome(),
                                      ),
                                    );
  }
 */
  Future<void> DataInsetion(studentid) async {
    //  int counter=0;
    print("777 $studentid");
    if (studentid == null || studentid == 0) {
      //  fetchControl.student.imageTemporary="" ;
      return;
    }
    final student = await control.FetchData(studentid);
    print("returned from fetching");
    print(student);

    _nameController.text = student.name;
    _ageController.text = student.age.toString();
    _stdController.text = student.standard;
    _addressController.text = student.address;
    // fetchControl.student.imageTemporary = await student.profile;
    fetchControl.DataInsetion1(studentid);
    print("777 this is temporary image $fetchControl.student.imageTemporary");
    
  }

  Future<void> pickImage() async {
    try {
      final img = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (img == null) {
        return;
      }
      fetchControl.imageTemporary.value = await img.path;
      print(await fetchControl.imageTemporary);
      // setState(() {});
//       setState(){
// this.image = fetchControl.student.imageTemporary;
//       }

    } on PlatformException catch (e) {
      print('Failed to pick image : $e');
    }
  }

  Future<dynamic> pickCamera() async {
    try {
      final img = await ImagePicker().pickImage(source: ImageSource.camera);
      // AlbumSaver.saveToAlbum(filePath: '/data/user/0/com.example.sql_flite/cache/', albumName: "YourAlbumName");
      if (img == null) {
        return;
      }
      fetchControl.imageTemporary.value = await img.path;
      // setState(() {});
      print("this is my temporary");
      print(fetchControl.imageTemporary.value);
//       setState(){
// this.image = fetchControl.student.imageTemporary;
//       }
      return await fetchControl.imageTemporary.value;
    } on PlatformException catch (e) {
      print('Failed to pick image : $e');
    }
  }

//   void showAlertDialogue(BuildContext context){
//     print("inside alirt box");
// AlertDialog alert = AlertDialog(
//     title: Text("Simple Alert"),
//     content: Text("This is an alert message."),
//     actions: [

//     ],
//   );
//   }
}
