import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Votingg extends StatefulWidget{
  static String selectedName = "";
  static String selectedImage = "";

  @override
  State<Votingg> createState() => _VotinggState();
}

class _VotinggState extends State<Votingg> {
  int _selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[ListTile(
          title: Text('Narendra modi'),
          leading: Radio(
            value: 1,
            groupValue: _selectedValue,
            onChanged: (int? value) {
              setState(() {
                _selectedValue = value!;
                Votingg.selectedName = "Narendra modi";
                Votingg.selectedImage = "assets/images/BJP.jpg";
              });
            },
          ),
        trailing: Container(height: 40,child: Image.asset("assets/images/BJP.jpg",fit: BoxFit.cover,)),
        ),
        ListTile(
          title: Text("Rahul Gandhi"),
          leading: Radio(
            value: 2,
            groupValue: _selectedValue,
            onChanged: (int? value) {
              setState(() {
                _selectedValue = value!;

                Votingg.selectedName = "Rahul Gandhi";
                Votingg.selectedImage ="assets/images/Congres.jpg";
              });
            },
          ),
          trailing: Container(height: 40,child: Image.asset("assets/images/Congres.jpg",fit: BoxFit.cover,)),
        ),


        ListTile(
          title: Text('Mk Stalin'),

          leading: Radio(
            value: 3,
            groupValue: _selectedValue,
            onChanged: (int? value) {
              setState(() {
                _selectedValue = value!;

                Votingg.selectedName = "Mk Stalin";
                Votingg.selectedImage ="assets/images/dmk.png";
              });
            },
          ),
          trailing: Container(height: 40,child: Image.asset("assets/images/dmk.png",fit: BoxFit.cover,)),
        ),



        ListTile(
          title: Text('Arvind Kejriwal'),

          leading: Radio(
            value: 4,
            groupValue: _selectedValue,
            onChanged: (int? value) {
              setState(() {
                _selectedValue = value!;

                Votingg.selectedName = "Arvind Kejriwal";
                Votingg.selectedImage ="assets/images/AAp.jpg";
              });
            },
          ),
          trailing: Container(height: 40,child: Image.asset("assets/images/AAp.jpg",fit: BoxFit.cover,)),
        ),


        ListTile(
          title: Text('Lalu Yadav'),

          leading: Radio(
            value: 5,
            groupValue: _selectedValue,
            onChanged: (int? value) {
              setState(() {
                _selectedValue = value!;
                Votingg.selectedName = "Lalu Yadav";
                Votingg.selectedImage ="assets/images/RJD.jpg";
              });
            },
          ),
          trailing: Container(height: 40,child: Image.asset("assets/images/RJD.jpg",fit: BoxFit.cover,)),
        ),


        ListTile(
          title: Text('Assudin Owaisi'),

          leading: Radio(
            value: 6,
            groupValue: _selectedValue,
            onChanged: (int? value) {
              setState(() {
                _selectedValue = value!;
                Votingg.selectedName = "Assudin Owaisi";
                Votingg.selectedImage ="assets/images/AMIM.png";
              });
            },
          ),
          trailing: Container(height: 40,child: Image.asset("assets/images/AMIM.png",fit: BoxFit.cover,)),
        ),


        ListTile(
          title: Text('NOTA'),

          leading: Radio(
            value: 7,
            groupValue: _selectedValue,
            onChanged: (int? value) {
              setState(() {
                _selectedValue = value!;
                Votingg.selectedName = "NOTA";
                Votingg.selectedImage ="assets/images/Nota.jpg";
              });
            },
          ),
          trailing: Container(height: 40,child: Image.asset("assets/images/Nota.jpg",fit: BoxFit.cover,)),
        ),




      ],
    );
  }
}
