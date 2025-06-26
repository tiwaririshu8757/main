import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Edu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text("Voter Education",style: TextStyle(color: Colors.white),),
      centerTitle: true,backgroundColor: Color(0xff00008b),
      iconTheme: IconThemeData(color: Colors.white),),
    body: Column(children: [
      SizedBox(height: 70,),
      Center(child: Text("This Page is For New Voters.",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),)),
      SizedBox(height: 30,),
      Center(child: Text("Steps For Voting.",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 19,color: Colors.black),)),
      SizedBox(height: 25,),
      Text("1. Firstly Go to Dasboard Screen.",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.blue),),
      SizedBox(height: 15,),
      Text("2. Now Click on Vote(Here you will find your details of voting).",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.blue),),
      SizedBox(height: 15,),
      Text("3. Tap Vote Button(Now you will see a Dialog box with voting\n Button,just click on it).",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.blue),),
      SizedBox(height: 15,),
      Text("4. Now select the Candidate and click on Submit Button.",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.blue),),
      SizedBox(height: 15,),
      Text("5. After that You can Read your vote using Read Button.",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.blue),),
      SizedBox(height: 15,),
    ],),
    

  );
  }
}