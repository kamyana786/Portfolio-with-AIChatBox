import 'package:flutter/material.dart';
import 'package:portfolio/projects.dart';
import 'package:portfolio/splashscreen.dart';
import 'package:portfolio/about.dart';
import 'package:portfolio/home.dart';
import 'package:portfolio/contact.dart';
import 'package:portfolio/ai_chat.dart'; // Import the new AI Chat file

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: "Soho",
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xff252525),
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      ),
    ),
    home: SplashScreen(), // Start with SplashScreen
    debugShowCheckedModeBanner: false,
    routes: {
      'home': (context) => MyHome(),
      'about': (context) => MyAbout(),
      'projects': (context) => MyProjects(),
      'contact': (context) => MyContact(),
      'chat_screen': (context) => ChatScreen(), // Add the new AI Chat route
    },
  ));
}
