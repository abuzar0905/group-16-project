import 'package:flutter/material.dart';
import 'package:flutter_application_1/sign_in_page.dart'; 
 
// Main app class 
void main() { 
  runApp(MyApp()); 
} 
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override 
  Widget build(BuildContext context) { 
    return MaterialApp( 
      title: 'Planner App', 
      theme: ThemeData( 
        primarySwatch: Colors.orange, 
      ), 
      home: SignInPage(), 
    ); 
  } 
} 
 