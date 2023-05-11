import 'package:api/view/home_widget.dart';
import 'package:flutter/material.dart';

class ApiApp extends StatelessWidget {
  const ApiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.lime),
      debugShowCheckedModeBanner: false,
      home: const HomeWidget(),
    );
  }
}
