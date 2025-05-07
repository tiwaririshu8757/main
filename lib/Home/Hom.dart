import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:voting/Ai/ai.dart';
import 'package:voting/Drawer/Eci.dart';
import 'package:voting/Drawer/Result.dart';
import 'package:voting/Home/Constiquency.dart';
import 'package:voting/Home/Voting.dart';
import 'package:voting/Home/REsult.dart';
import 'package:voting/Home/Votingg.dart';
import 'package:voting/Login/Login.dart';
import 'package:horizontal_list_view/horizontal_list_view.dart';

class Home extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;

    return Scaffold(
        appBar: AppBar(
          title: Text("Home", style: TextStyle(color: Colors.white),),
          centerTitle: true,
          backgroundColor: Color(0xff00008b),
          iconTheme: IconThemeData(color: Colors.white),),
        drawer: Drawer(
          backgroundColor: Color(0xff00008b),
          child: ListView(
            children: <Widget>[
              Container(
                height: 220,
                width: 140,color:Colors.white,
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
                        Text("My Profile", style: TextStyle(color: Color(
                            0xff00008b),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,),),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 45,
                              backgroundImage: AssetImage("assets/images/kk.png"),
                            ),
                            SizedBox(width: 10),
                            Text(userData['fullname'] ?? "No Name", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xff8B0000)),),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text("ID:${userData['voterId'] ?? 'N/A'}",style: TextStyle(fontSize: 9),),
                        Text("Aadhar No.:${userData['aadhar'] ?? 'N/A'}",style: TextStyle(fontSize: 10),),
                        Text("Mob.:${userData['mobile'] ?? 'N/A'}",style: TextStyle(fontSize: 9),),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 15),
              ListTile(
                leading: Icon(Icons.arrow_forward_ios_outlined, color: Colors.white),
                title: ElevatedButton(onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => Eci()));
                },
                  child: Text("Election Commission of India", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.white)),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),),),
              ListTile(
                  leading: Icon(Icons.arrow_forward_ios_outlined, color: Colors.white),
                  title: ElevatedButton(onPressed: () {},
                    child:
                    Text("Voters Education", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.white)), style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  )),
              ListTile(
                  leading: Icon(Icons.arrow_forward_ios_outlined, color: Colors.white),
                  title: ElevatedButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Aii()));
                  }, child:
                  Text("Ai", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.white)), style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  )),
              ListTile(
                  leading: Icon(Icons.arrow_forward_ios_outlined, color: Colors.white),
                  title: ElevatedButton(onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Result(selectedCandidate: Votingg.selectedName, selectedImage: Votingg.selectedImage,),));
                  },
                    child: Text("Result", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  )),
              ListTile(
                  leading: Icon(Icons.arrow_forward_ios_outlined, color: Colors.white),
                  title: ElevatedButton(onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Const()));
                  },
                    child: Text("Know Your Constituency", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  )),
              ListTile(
                  leading: Icon(Icons.arrow_forward_ios_outlined, color: Colors.white),
                  title: ElevatedButton(onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
                  },
                    child: Text("Logout", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.white)),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  )),
              ListTile(
                  leading: Icon(
                      Icons.arrow_forward_ios_outlined, color: Colors.white),
                  title: ElevatedButton(onPressed: () {}, child: Text("About Us", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  )),
            ],
          ),
        ),
        body:
        Container(decoration: BoxDecoration(color: Color(0xff00008b)), child: Column(children: [
          SizedBox(height: 10,),
          HorizontalListView(
            crossAxisCount: 1, crossAxisSpacing: 0.0, children: [
            Container(
              child: Image.asset("assets/images/Eci3.jpg", fit: BoxFit.cover,),
              height: 210,
              width: 590,),
            Container(child: Image.asset("assets/images/Eci1.jpg"),
              height: 210,
              width: 590,),
            Container(
              child: Image.asset("assets/images/Votte.jpg", fit: BoxFit.cover,),
              height: 210,
              width: 590,),
          ],),
          SizedBox(height: 30,),
          InkWell(onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Result(selectedCandidate: Votingg.selectedName, selectedImage: Votingg.selectedImage)));
          }, child: Row(children: [
            CircleAvatar(radius: 45,
              backgroundImage: AssetImage("assets/images/Res.jpg"),),
            SizedBox(width: 10,),
            Text("Results", style: TextStyle(fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white),),
          ],),),
          SizedBox(height: 20,),
          InkWell(onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Voting()));
          }, child: Row(children: [
            CircleAvatar(radius: 45,
              backgroundImage: AssetImage("assets/images/vote2.jpg"),),
            SizedBox(width: 10,),
            Text("Vote", style: TextStyle(fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white),),
          ],),),
          SizedBox(height: 20,),
          GestureDetector(onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Const()));
          }, child: Row(children: [
            CircleAvatar(radius: 45,
              backgroundImage: AssetImage("assets/images/Location.jpg"),),
            SizedBox(width: 10,),
            Text("Constituency", style: TextStyle(fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white),),
          ],),),
          SizedBox(height: 40,),
          Center(child: Text("MADE IN INDIA", style: TextStyle(fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xffFFFFFF)),)),
        ]),
        )
    );
  }}