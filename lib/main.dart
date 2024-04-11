import 'package:flutter/material.dart';
import 'pages/dashboard_page.dart';
import 'pages/products_page.dart';
import 'pages/vendors_page.dart';
import 'pages/banks_page.dart';
import 'pages/sales_page.dart';
import 'pages/profile_page.dart';
import 'sidebar_layout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock App',
      theme: ThemeData(
        primaryColor: Color(0xFF171731),
        scaffoldBackgroundColor: Color(0xFF171731),
        appBarTheme: AppBarTheme(
          color: Color(0xFF171731),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      home: SidebarLayout(),
    );
  }
}
