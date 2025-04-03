import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voting/Home/Hom.dart';
import 'package:voting/SignUp/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatelessWidget {
  final TextEditingController id=TextEditingController();
  final TextEditingController pass=TextEditingController();
// It is a function to login
  final FirebaseAuth _auth=FirebaseAuth.instance;
  Future<void> login(BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: id.text.trim(),
        password: pass.text.trim(),
      );

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
    } catch (e) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed: ${e.toString()}')),
      );
    }}
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(title: Text("Login"),backgroundColor: Colors.lightBlue,centerTitle: true,),
      body: Column(mainAxisAlignment: MainAxisAlignment.start,
        children: [

          SizedBox(height: 8,),
          Center(child: SizedBox(height:140,child: Image.asset("assets/images/FOURLION.png",fit: BoxFit.cover,))),
          SizedBox(height: 12,),
          Text("GOVERNMENT ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.red),),
          Text("OF",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.red),),
          Text("INDIA",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.red),),
          SizedBox(height: 1,),
          Padding(
            padding: const EdgeInsets.only(right: 310),
            child: Container(child: Text("Voter ID",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.blue),)),
          ),
          SizedBox(height: 9,),
          TextField(controller:id ,keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                hintText:"           Enter Your ID",
                prefixIcon: Icon(Icons.perm_identity),
                prefixIconColor: Colors.grey,


              )),
          SizedBox(height: 3.1,),
          Padding(
            padding: const EdgeInsets.only(right: 310),
            child: Text("Password",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.blue),),
          ),
          TextField(controller:pass ,keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                hintText:"           Enter Your Password",
                prefixIcon: Icon(Icons.lock),

              )),
          SizedBox(height: 2,),
          SizedBox(width: 310,
            child: ElevatedButton(onPressed: (){
              login(context);
            }, child: Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),),
          ),
          SizedBox(height: 7,),

          Row(
            children: [
              SizedBox(width: 100,),
              Text("Forget Password?"),
              SizedBox(width: 3,),
              TextButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUp()));
              }, child: Text("SignUP",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.lightBlue),)),
            ],
          ),


        ],
      ),
    );
  }

}