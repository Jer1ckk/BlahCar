import 'package:blahblah/ui/screens/ride_preferences.dart';
import 'package:blahblah/ui/theme/theme.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: blaTheme,
      debugShowCheckedModeBanner: false,
      
      home: RidePreferences(),
    );
  }
}
