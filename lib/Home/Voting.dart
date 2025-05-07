import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voting/Home/Candidate.dart';
import 'package:voting/Home/Votingg.dart';
import 'package:voting/Home/Votting.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Voting extends StatelessWidget{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;

    return Scaffold(
      appBar: AppBar(title: Text(" E-Voting",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold,color: Colors.white),),backgroundColor: Color(0xff00008b),iconTheme: IconThemeData(color: Colors.white),centerTitle: true,),
      backgroundColor: Color(0xffFFFFFF),
      body: Column(mainAxisAlignment: MainAxisAlignment.start,
        children: [
        SizedBox(height: 60,),
        Container(
          color: Color(0xff00008b),height: 310, width: 500,
    child: FutureBuilder<DocumentSnapshot>(
    future: _firestore.collection('users').doc(user?.uid).get(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      }
      if (!snapshot.hasData || !snapshot.data!.exists) {
        return Center(child: Text('User data not found.'));
      }

      var userData = snapshot.data!.data() as Map<String,
          dynamic>;

      return Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(userData['fullname'] ?? "No Name", style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Color(0xffFFFFFF)),),
          SizedBox(height: 10,),
          Text("ID:${userData['voterId'] ?? 'N/A'}",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xffFFFFFF)),),
          Text("Aadhar No.:${userData['aadhar'] ?? 'N/A'}",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xffFFFFFF)),),
          Text("Mob.:${userData['mobile'] ?? 'N/A'}",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xffFFFFFF)),),
          Text("E-mail:${userData['email'] ?? 'N/A'}",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xffFFFFFF)),),

        ],);
    }
    ),
        ),


        SizedBox(height: 10,),
        TextButton(onPressed: (){
          return _openbutton(context);
        }, child: Text("Vote",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        style: ElevatedButton.styleFrom(backgroundColor: Color(0xff00008b),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),),
    ],),
    );
  }
}
_openbutton(BuildContext context){
  return showModalBottomSheet(context: context, builder:(BuildContext context){
    return Container(
      width:250,
      height: 300,
      child: Column(children: [
        IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Votting()));
        }, icon: Icon(Icons.how_to_vote_outlined,color: Color(0xff8B0000),size: 80,),),
        Text("Vote",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w800,color: Colors.lightBlue),),
        SizedBox(height: 25,),
        IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Candidate()));
        }, icon: Icon(Icons.person,color: Color(0xff8B0000),size: 80,),),
        Text("Candidate",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w800,color: Colors.lightBlue),),


        ],
    ),);
  }
  );

}