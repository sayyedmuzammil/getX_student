import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sql_flite/add_student_widget.dart';
import 'package:sql_flite/mode/data_model.dart';

class viewStudentWidget extends StatelessWidget {
  final StudentModel? edit;

   viewStudentWidget({this.edit});


  final _nameController = TextEditingController();

  final _ageController = TextEditingController();

  final _stdController = TextEditingController();

  final _addressController = TextEditingController();

// String imageTemporary="/data/user/0/com.example.sql_flite/cache/image_picker8166399740605715662.jpg";//photo from phone


 

  @override
  Widget build(BuildContext context) {
  
  if (edit != null) {
      _nameController.text = edit!.name!;
      _ageController.text = edit!.age.toString();
      _stdController.text = edit!.standard!;
      _addressController.text = edit!.address!;
      fetchControl.imageTemporary.value=edit!.profile;
    }
 
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

}
