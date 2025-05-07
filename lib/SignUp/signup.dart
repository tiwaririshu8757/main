import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:voting/Login/Login.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final fullname = TextEditingController();
  final voterId = TextEditingController(); // Treating as Voter ID
  final password = TextEditingController();
  final mobile = TextEditingController();
  final aadhar = TextEditingController();
  final email = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void dispose() {
    fullname.dispose();
    voterId.dispose();
    password.dispose();
    mobile.dispose();
    aadhar.dispose();
    email.dispose();
    super.dispose();
  }

  Future<void> signUp(BuildContext context) async {
    if (fullname.text.isEmpty ||
        voterId.text.isEmpty ||
        password.text.isEmpty ||
        mobile.text.isEmpty ||
        aadhar.text.isEmpty ||
        password.text.isEmpty||
        email.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }


    // Mobile number validation
    if (mobile.text.length != 10 || !RegExp(r'^[0-9]+$').hasMatch(mobile.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Mobile number must be exactly 10 digits')),
      );
      return;
    }

    // Aadhar number validation
    if (aadhar.text.length != 12 || !RegExp(r'^[0-9]+$').hasMatch(aadhar.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Aadhar number must be exactly 12digits')),
      );
      return;
    }

    // Password length validation
    if (password.text.length < 9) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password must be at least 9 characters long')),
      );
      return;
    }

    try {
      // Register user in Firebase Authentication
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );

      // Store additional user data in Firestore (collection name fixed to 'users')
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'fullname': fullname.text.trim(),
        'voterId': voterId.text.trim(),
        'mobile': mobile.text.trim(),
        'aadhar': aadhar.text.trim(),
        'email': email.text.trim(),
        'password':password.text.trim(),
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Signup successful!')),
      );
    } on FirebaseAuthException catch (e) {
      String message;
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else if (e.code == 'invalid-email') {
        message = 'The email address is not valid.';
      } else {
        message = 'Signup failed. Please try again.';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An unexpected error occurred.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Sign Up"),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 28),
              const Text("Full Name"),
              TextField(
                controller: fullname,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  hintText: "Enter Your Full Name",
                  prefixIcon: Icon(Icons.person),
                  prefixIconColor: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              const Text("Voter ID"),
              TextField(
                controller: voterId,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  hintText: "Enter Your Voter ID",
                  prefixIcon: Icon(Icons.perm_identity),
                ),
              ),
              const SizedBox(height: 10),
              const Text("Email"),
              TextField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  hintText: "Enter Your Email",
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 10),
              const Text("Mobile No."),
              TextField(
                controller: mobile,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  hintText: "Enter Your Mobile No.",
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
              const SizedBox(height: 10),
              const Text("Aadhar Card"),
              TextField(
                controller: aadhar,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  hintText: "Enter Your Aadhar Card No.",
                  prefixIcon: Icon(Icons.credit_card),
                ),
              ),
              const SizedBox(height: 10),
              const Text("Password"),
              TextField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  hintText: "Enter Your Password",
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => signUp(context),
                child: Text("Sign Up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
