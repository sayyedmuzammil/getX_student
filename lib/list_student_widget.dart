// import 'dart:io';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sql_flite/view_widget.dart';
// import 'package:hive_db/view_widget.dart';
import 'mode/db_functions.dart';
import 'mode/data_model.dart';
import 'screen_home.dart';

class ListStudentWidget extends StatelessWidget {
  final int? currentPage;
   ListStudentWidget({Key? key, this.currentPage = 0}) : super(key: key);


   final control = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    print("555 here"); 
    
 
         
        return Obx(() => ListView.separated(
          itemBuilder: (ctx, index) {
            final data = StudentModel.fromMap(control.students[index]);
            print("5555 $data"); 
            return ListTile(
              title: Text('${data.name}'),
              subtitle: Text(data.age.toString()),

              // leading: data.profile!=null?
              leading: CircleAvatar(
                backgroundImage: Image.file(File(data.profile as String)).image,
              ),
              // CircleAvatar(backgroundImage: AssetImage('assets/images/avatar.jpg'),),

              trailing: currentPage == 0
                  ? Container(
                      //  margin: EdgeInsets.only(),
                      width: 97,
                      child: Row(children: [
                        IconButton(
                          onPressed: () {
                            if (data.id != null) {
                          
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => ScreenHome(
                                            currentSelected: 2,
                                            id: data.id,
                                          )));

                              //  AddStudentWidget(edit: data.id);
                              // setState(() {
                              //   // AddStudentWidget(edit: data.id,);
                              // });
                            } else {
                              print('id is ${data.id}');
                              print("cant edit");
                            }
                          },
                          icon: Icon(
                            Icons.edit,
                            color: Colors.green,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            if (data.id != null) {
                              print(data.id);
                              control.deleteStudent(data.id!);
                              // setState(() {});
                            } else {
                              print('id is ${data.id}');
                              print("cant delete");
                            }
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ]),
                    )
                  : Container(
                      child: IconButton(
                        onPressed: () {
                          if (data.id != null) {
                          
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => viewStudentWidget(
                                          edit: data.id,
                                        )));
                            // deleteStudent(data.id!);
                            // setState(() {});
                          } else {
                            print('id is ${data.id}');
                            print("cant expand");
                          }
                        },
                        icon: Icon(
                          Icons.read_more_outlined,
                          size: 32.0,
                          color: Colors.blue,
                        ),
                      ),
                    ),
            );
          },
          separatorBuilder: (ctx, index) {
            return const Divider();
          },
          itemCount: control.students.length,
        ), 
        );
    
  }
}
