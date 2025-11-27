import 'package:flutter/material.dart';
import 'ui/screens/screens/profile.dart'; 
import 'data/profile_data.dart'; 

void main() {
  runApp(
    
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile App',
      
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      
      home: ProfileApp(profile: ronanProfile), 
    );
  }
}