// import 'dart:io';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sql_flite/add_student_widget.dart';

import 'mode/db_functions.dart';
import 'package:sql_flite/controller.dart';

class viewStudentWidget extends StatelessWidget {
  final int? edit;

   viewStudentWidget({this.edit});


  final _nameController = TextEditingController();

  final _ageController = TextEditingController();

  final _stdController = TextEditingController();

  final _addressController = TextEditingController();

// String imageTemporary="/data/user/0/com.example.sql_flite/cache/image_picker8166399740605715662.jpg";//photo from phone


 

  @override
  Widget build(BuildContext context) {
   
DataInsetion(edit); 
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Details"), // title of AppBar
        centerTitle: true, // align the title to the center of the AppBar

        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
              // setState(() {
              //   // widget.currentSelected = 0;
              // });
            },
            icon: Icon(Icons.arrow_back_ios_new)), // Leading icon with function
        leadingWidth: 50.0, // Width of leading icon
      ),
      body: Container(
        child: Center(
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
                        Column(
                          children: [
                            Container(
                              width: double.infinity,
                              // height: 200,

                              child: Container(
                                alignment: Alignment(0.0, 2.5),
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage:

                                     fetchControl.imageTemporary.value == ""?
                                    NetworkImage("https://cdn2.iconfinder.com/data/icons/avatars-99/62/avatar-371-456323-512.png"):
                                    Image.file(
                                            File(fetchControl.imageTemporary.toString()))
                                       .image,
                                ),
                              ),
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
                            enabled: false,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _ageController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Age',
                            enabled: false,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _stdController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Class',
                            enabled: false,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _addressController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Address',
                            enabled: false,
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Container(
                        //   // width: 97,

                        //   child: ElevatedButton.icon(
                        //     onPressed: () {
                        //       // onUpdateStudentButton(widget.edit);
                        //  Navigator.of(context).pop();

                        //       // showAlertDialogue(context);
                        //     },
                        //     icon: const Icon(Icons.arrow_back_ios_new),
                        //     label: const Text('GO BACK'),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> DataInsetion(studentid) async {
    //  int counter=0;
    print("555 $studentid");
    if (studentid == null || studentid == 0) {
     fetchControl.imageTemporary.value="";
     return;
    }
    final student = await control.FetchData(studentid);
    print("returned from fetching");
    print(student);

    _nameController.text = student.name;
    _ageController.text = student.age.toString();
    _stdController.text = student.standard;
    _addressController.text = student.address;
    // imageTemporary = await student.profile;
fetchControl.DataInsetion1(studentid);
    // print(imageTemporary);
    //  await counter++;
    // setState(() {
      
    // });

 
  }
}
