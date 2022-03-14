import 'package:flutter/material.dart';

import 'Screen_main.dart';
import 'screem_add.dart';
import 'screen_search.dart';

class ScreenHome extends StatefulWidget {
  ScreenHome({this.currentSelected = 0, this.id});
  int? id;
  int currentSelected;

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  Widget build(BuildContext context) {
    final _pages = [
      screen_main(),
      screen_search(id: widget.id),
      screen_add(id: widget.id),
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Bro-Totype"), // title of AppBar
        centerTitle: true, // align the title to the center of the AppBar

        leading: IconButton(
            onPressed: () {
              setState(() {
                widget.currentSelected = 0;
              });
            },
            icon: Icon(Icons.home)), // Leading icon with function
        leadingWidth: 50.0, // Width of leading icon
      ),
      body: _pages[widget.currentSelected],
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(),
        currentIndex: widget.currentSelected,
        onTap: (newIndex) {
          setState(() {
            widget.currentSelected = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.manage_accounts), label: 'Student'),
        ],
      ),
    );
  }
}
