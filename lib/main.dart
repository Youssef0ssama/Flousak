import 'package:flousak/pages/getstarted.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyChn69j9zpumnt3A5gXS27AlzwAoIwlzzM",
        appId: "1:660516518523:android:a30bffb610e2686981c0de",
        messagingSenderId: "660516518523",
        projectId: "flousak-41666"),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FLOUSAK',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: getstarted(),
    );
  }
}
