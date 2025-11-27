import 'package:flutter/material.dart';
import 'ui/screens/welcome_screen.dart'; 
import 'ui/screens/temperature_screen.dart';

class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() {
    return _TemperatureAppState();
  }
}

class _TemperatureAppState extends State<TemperatureApp> {
  
  var _isWelcomeScreen = true;

  
  void _switchScreen() {
    setState(() {
      _isWelcomeScreen = false;
    });
  }

 
  Widget _buildFunctionalWelcomeScreen() {
    
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Icon(
            Icons.thermostat_outlined,
            size: 120,
            color: Colors.white,
          ),
        ),
        const Text(
          "Welcome !",
          style: TextStyle(
            color: Colors.white,
            fontSize: 50,
          ),
        ),
        const SizedBox(height: 15),
        OutlinedButton(
         
          onPressed: _switchScreen, 
          style: OutlinedButton.styleFrom(
              side: const BorderSide(width: 1.0, color: Colors.white)),
          child: const Text('Start to convert',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              )),
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    
    final Widget activeScreen = _isWelcomeScreen 
        
        ? _buildFunctionalWelcomeScreen() 
        
        : TemperatureScreen(); 

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff16C062), Color(0xff00BCDC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureApp());
}