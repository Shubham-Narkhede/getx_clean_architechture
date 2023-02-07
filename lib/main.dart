import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architechture/initApp.dart';
import 'package:getx_clean_architechture/view/ScreenHome.dart';

import 'TDD/presentation/pages/ScreenUserDetails.dart';

Future<void> main() async {
  await initApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScreenUserDetails(),
    );
  }
}
