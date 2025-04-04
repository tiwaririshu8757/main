

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:voting/Home/Hom.dart';
import 'package:voting/Login/Login.dart';

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


