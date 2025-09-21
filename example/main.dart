import 'package:flutter/material.dart';
import 'package:raindrop_animated_splash_screen/raindrop_splash_screen/raindrop_splash_screen.dart';

void main() {
  runApp(const MyApp());
}

/// Root widget of the example app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides debug banner
      title: 'Raindrop Splash Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      // Start with the splash screen
      home: RaindropSplashScreen(
        // Screen to show after splash animation finishes
        nextScreen: const HomePage(),

        // Text shown below the raindrop animation
        title: "Raindrop Splash",

        // Color of raindrop + hole reveal effect
        color: Colors.blue,

        // Duration of splash animation
        duration: const Duration(seconds: 3),
      ),
    );
  }
}

/// Example of the screen you navigate to after the splash
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: const Center(
        child: Text(
          "Welcome to your app 🎉",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
