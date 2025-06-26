import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voting/Home/Hom.dart';

class Eci extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body:Container(decoration: BoxDecoration(
   gradient: LinearGradient(colors: [Color(0xffFf9933),Color(0xffE1D9D1),Color(0xff00cc00)],
   begin: Alignment.topLeft,
   end: Alignment.bottomRight,
   stops: [0.0,0.5,1.0],),),
     child: Column(mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(height: 60,),
      Center(child: Container(height:110,child: Image.asset("assets/images/Eci.png",fit: BoxFit.cover,))),
      SizedBox(height:13,),
      Text("The Election Commission of India (ECI) is a constitutional body established by the Constitution of the Republic of India empowered to conduct free and fair elections in the Republic of India. It is headed by a chief election commissioner and consists of two other election commissioners as constituent members.",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
      SizedBox(height: 20,),
      Text("The Election Commission of India is a body constitutionally empowered to conduct free and fair elections to the national, the State Legislative Assemblies, State Legislative Councils and the offices of the president and vice-president. The Election Commission operates under the powers granted by Article 324 of the Constitution and subsequently enacted Representation of the People Act.The state election commissions are responsible for conducting local body elections in the respective states. The election commission decides the dates for the filing of nominations, voting, counting and announcement of results.It issues a Model Code of Conduct for political parties and candidates to ensure that the elections are conducted in a free and fair manner.",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
      SizedBox(height: 10),
      Container(width: 150,height: 50,color: Colors.blue,
        child: OutlinedButton(onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
        }, child: Text("Back",style: TextStyle(color: Colors.white),)),
      )
    ],),),
   );
  }
}