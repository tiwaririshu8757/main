import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voting/Home/Hom.dart';

class Result extends StatelessWidget {
  final String selectedCandidate;
  final String selectedImage;

  Result({required this.selectedCandidate, required this.selectedImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Results",
          style: TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff00008b),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.lightBlue.shade50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selected Candidate: $selectedCandidate',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Image.asset(selectedImage, height: 180, fit: BoxFit.cover),
            SizedBox(height: 50,),
            Text(" ThankYou For Voting.",style: TextStyle(fontSize: 29,fontWeight: FontWeight.bold,color: Colors.blue),),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
            }, child: Text("Back to Home",style: TextStyle(fontSize: 30,color: Color(0xff000000)),),style: ElevatedButton.styleFrom(backgroundColor: Colors.red),)
          ],
        ),
      ),
    );
  }
}
