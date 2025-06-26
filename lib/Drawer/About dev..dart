import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text("About us",style: TextStyle(color: Colors.white),),
        centerTitle: true,backgroundColor: Color(0xff00008b),
        iconTheme: IconThemeData(color: Colors.white),),
      body: Column(mainAxisAlignment: MainAxisAlignment.start,
        children: [
        SizedBox(height: 70,),
        Row(children: [
          Text("Welcome to",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.black)),
          Text("VOTIBOND",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.lightGreen),)
        ],),
        SizedBox(height: 10,),
        Text("I am Rishu Kumar, the developer behind this app. I'm passionate about\n Creating tools that makes life easier and more enjoyable. with a focus\n on simplicity and User experience,I've designed  VOTIBOND to help you."),

      ],),
    );
  }
}
