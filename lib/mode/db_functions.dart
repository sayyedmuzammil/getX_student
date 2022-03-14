import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'data_model.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);
late Database _db;

class Controller extends GetxController {
  List<StudentModel> studentListNotifier = <StudentModel>[].obs;

  List<Map<String, dynamic>> students = <Map<String, dynamic>>[].obs;
  List<Map<String, dynamic>> searchItems = <Map<String, dynamic>>[].obs;
 
Future<void> openDB() async {
  _db = await openDatabase('student.db', version: 1,
      onCreate: (Database db, int version) async {
    await db.execute(
        'CREATE TABLE student (id INTEGER PRIMARY KEY, name TEXT, age INTEGER, standard TEXT, address TEXT, profile TEXT)');
  });
}

Future<void> addStudent(StudentModel value) async {
  await _db.rawInsert(
      'INSERT INTO student( name, age, standard, address, profile) VALUES (?,?,?,?,?)',
      [value.name, value.age, value.standard, value.address, value.profile]);
  print("student added successfully");
}

Future<void> SearchStudent(searchedName) async {
  // studentListNotifier.value.clear();
 

  final searched_student = await _db
      .query('student', where: "name LIKE ?", whereArgs: ['%$searchedName%']);


  // if
  searched_student.forEach((map) {
    final Single_student = StudentModel.fromMap(map);
    // studentListNotifier.value.add(Single_student);
    // studentListNotifier.notifyListeners();
  });
}

Future<void> getAllStudents() async {
  // studentListNotifier.value.clear();
  final _values = await _db.rawQuery('SELECT * FROM student');
  print("this is all values in db $_values");
  if (_values.isNotEmpty) {
    _values.forEach((map) {
      final Single_student = StudentModel.fromMap(map);
      studentListNotifier.add(Single_student);
      // studentListNotifier.notifyListeners();
      students.clear(); 
     students.addAll(_values);
     update();
    });
  } else {
    print("error alert");
    var alert = "no values in db";
  }
  print("666 $students"); 
}

_displayDialog(BuildContext context) {}
Future<void> 
deleteStudent(int id) async {
  print(id);
  await _db.rawDelete('DELETE FROM student WHERE id=$id');

  getAllStudents();
}

Future<void> UpdateStudent(editedStudent) async {
  // studentListNotifier.value.clear();
  print('in displayStudent $editedStudent');
  int _id = editedStudent.id;
  String _name = editedStudent.name;
  int _age = editedStudent.age;
  String _std = editedStudent.standard;
  String _add = editedStudent.address;
  String _profile = editedStudent.profile;

  await _db.rawUpdate(
      'UPDATE student SET name= "$_name", age="$_age",standard="$_std", address="$_add", profile="$_profile" WHERE id="$_id"');
}

Future<dynamic> FetchData(id) async {
  final values = await _db.rawQuery('SELECT * FROM student WHERE id=$id');

  var Single_student;
  values.forEach((map) {
    Single_student = StudentModel.fromMap(map);
  });

  return Single_student;
}
}