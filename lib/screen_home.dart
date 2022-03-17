import 'package:flutter/material.dart';
import 'package:sql_flite/add_student_widget.dart';
import 'package:sql_flite/mode/data_model.dart';
import 'Screen_main.dart';
import 'screem_add.dart';
import 'screen_search.dart';
import 'package:get/get.dart';


class ScreenHome extends StatelessWidget {
  ScreenHome({this.currentSelected =0 , this.data});
  StudentModel? data=null;
  

  final currentSelected;

  @override
  Widget build(BuildContext context) {
    print("in start ${data}, $currentSelected ");
    final _pages = [
      screen_main(),
      screen_search(data: data),
      screen_add(data: data),
    ];
    return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text("Bro-Totype"), // title of AppBar
            centerTitle: true, // align the title to the center of the AppBar
    
            leading: IconButton( 
                onPressed: () {
              //     print("55511 ${fetchControl.imageTemporary}"); 
              data=null;
              fetchControl.imageTemporary.value='';
              //      print("55522 ${fetchControl.imageTemporary}");  
                  fetchControl.indexChanged(0);    
                  
                },
                icon: Icon(Icons.home)), // Leading icon with function
            leadingWidth: 50.0, // Width of leading icon
          ),
          body: Obx(() => Scaffold(
                 resizeToAvoidBottomInset: false, 
            body: _pages[fetchControl.currentSelected.value],
                    bottomNavigationBar:  BottomNavigationBar(
                          selectedLabelStyle: TextStyle(),
                          currentIndex: fetchControl.currentSelected.value,
                      onTap: (newIndex) {
                         
                        data=null;
                        fetchControl.imageTemporary.value='';
                        
                        fetchControl
                            .indexChanged( newIndex);
                      },
                      items: const [
                        BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.person_search), label: 'Search'),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.manage_accounts), label: 'Student'),
                      ],
                    )),
          
          ),
 
    );
  }
}
