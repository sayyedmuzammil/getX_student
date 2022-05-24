import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sql_flite/Screen_main.dart';
import 'mode/db_functions.dart';
import 'screen_home.dart';

Future<void> main() async {
   final control = Get.put(Controller());
  WidgetsFlutterBinding.ensureInitialized();
  await control.openDB();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: screen_main(),
    );
  }
}
