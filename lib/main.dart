import 'package:flutter/material.dart';
import 'package:voting/Drawer/Eci.dart';
import 'package:voting/Drawer/voteredu.dart';
import 'package:voting/Home/Hom.dart';
import 'package:voting/Home/Votting.dart';
import 'package:voting/Login/Login.dart';
import 'package:voting/SignUp/signup.dart';
import 'package:voting/Splash/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home:Home(),//AuthWrapper(),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(), // Listen for auth state changes
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User? user = snapshot.data;
          // If user is logged in, navigate to Home; otherwise, navigate to Login
          return user == null ? Login() : Home();
        }
        // Show loading indicator while waiting for auth state
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}