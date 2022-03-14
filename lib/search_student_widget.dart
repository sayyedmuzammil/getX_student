import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'mode/db_functions.dart';

class SearchStudentWidget extends StatelessWidget {
  SearchStudentWidget({Key? key}) : super(key: key);

 final control = Get.put(Controller());
  final _searchController = TextEditingController();
// final _ageController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
     
      child: Padding(
        padding: const EdgeInsets.all(
          30.0,
        ),
        child: Column(
          children: [
            TextFormField(
              controller: _searchController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Name',
              ),
            ),
            const SizedBox(height: 10),
            
            // const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                onSearchStudentButton();
              },
              icon: const Icon(Icons.search),
              label: const Text('Search'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onSearchStudentButton() async {
    final _name = _searchController.text.trim();

    if (_name.isEmpty) {
      return;
    }
  
    // final _student=StudentModel(name: _name, );
    control.SearchStudent(_name);
  }
}
