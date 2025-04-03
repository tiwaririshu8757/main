import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Const extends StatefulWidget{
  @override
  State<Const> createState() => _ConstState();
}

class _ConstState extends State<Const> {
  String Selectedstate="Andhra Pradesh";
  List<String> state = ["Arunachal Pradesh", "Assam", "Bihar", "Chhattisgarh", "Goa", "Gujarat", "Haryana", "Himachal Pradesh", "Jharkhand", "Karnataka", "Kerala", "Madhya Pradesh", "Maharashtra", "Manipur", "Meghalaya", "Mizoram", "Nagaland", "Odisha", "Punjab", "Rajasthan", "Sikkim", "Tamil Nadu", "Telangana", "Tripura", "Uttar Pradesh", "Uttarakhand", "West Bengal"];
  String Selectedcity="NewDelhi";
  List<String> city = ["NewDelhi", "Hajipur","dispur","Surat","Ahemdabad","Mumbai","Pune","Nagpur","SriNagar","Chennai","Vadodara","Jaipur","VisakhaPatna","Lucknow","Kanpur","Indore","Bhopal","Patna"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Constiquency Name",style: TextStyle(color: Colors.black),),
        centerTitle: true,iconTheme: IconThemeData(color: Colors.white),),
      backgroundColor: Colors.lightBlue.shade50,
      body: Column(children: [
        SizedBox(height: 60,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: DropdownButtonFormField(items: state.map((String statei) {
                  return DropdownMenuItem(
                  child: Text(statei.toString()), value: statei,);
                  }).toList(), onChanged: (newvalue) {
                  setState(() {
                  Selectedstate = newvalue!;
                  });
                  }, decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                  hintText: "Select Your State",)
                  ),
            ),

        SizedBox(height: 60,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: DropdownButtonFormField(items: city.map((String cityi) {
            return DropdownMenuItem(
              child: Text(cityi.toString()), value: cityi,);
          }).toList(), onChanged: (newvalue) {
            setState(() {
              Selectedcity = newvalue!;
            });
          }, decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
            hintText: "choose Your Constiiquency",)
          ),
        ),

        SizedBox(height: 60,),

        ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text("Previous Page"))
      ],),


    );
  }
}