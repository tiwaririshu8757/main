import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voting/Home/Hom.dart';
import 'package:voting/Home/REsult.dart';
import 'package:voting/Home/Votingg.dart';

class Votting extends StatelessWidget {
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Select Candidate", style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      backgroundColor: Color(0xff00008b),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    body: Column(
      children: [
        SizedBox(height: 30),
        Votingg(),
        SizedBox(height: 10),
        Container(
          width: 330,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Votting()));
              ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text('Voting Sucessful !!!\n Now you can Read Your vote. '),backgroundColor: Colors.lightGreen),);
            },
            child: Text("Submit",style: TextStyle(color: Colors.white),),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff00008b),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: 330,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Result(selectedCandidate: Votingg.selectedName, selectedImage: Votingg.selectedImage,),
                ),

              );
            },
            child: Text("Read",style: TextStyle(color: Colors.white),),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff00008b),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            ),
          ),
        ),
      ],
    ),
  );
}
}