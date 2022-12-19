import 'package:final_exam/view/addProduct.dart';
import 'package:final_exam/view/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main()
{
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(p0) => HomeScreen(),
        '/addproduct':(p0) => AddProduct(),
      },
    ),
  );
}