
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voting/Login/Login.dart';

class Splash extends StatefulWidget{
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff00008b),
      body:Center(child: Container(height: 150,width: 130,
        child: Hero(tag: 'background', child: Image.asset("assets/images/vote2.jpg",fit: BoxFit.cover,),))),
      
    );

  }
}