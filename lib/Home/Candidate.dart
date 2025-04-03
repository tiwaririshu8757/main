import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Candidate extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Candidate",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold,color: Colors.white),),backgroundColor: Color(0xff00008b),iconTheme: IconThemeData(color: Colors.white),),
body: Column(crossAxisAlignment: CrossAxisAlignment.center,
  children: [
  Container(height: 65,width: 100,
      child: Image.asset("assets/images/Nar.jpg",fit: BoxFit.cover,)),
    Text("Narendra Damodardas Modi (born 17 September 1950) is an Indian politician who has served as the prime minister of India since 2014. Modi was the chief minister of Gujarat from 2001 to 2014 and is the member of parliament (MP) for Varanasi. He is a member of the Bharatiya Janata Party (BJP) and of the Rashtriya Swayamsevak Sangh (RSS), a far-right Hindu nationalist paramilitary volunteer organisation."),
    Container(height:65,width: 100,child: Image.asset("assets/images/Rah.jpg")),
    Text("Rahul Rajiv Gandhi is an Indian Politician. A member of the Indian National Congress (INC), he is currently serving as the 12th leader of the Opposition in Lok Sabha and as the member of the Lok Sabha for Rae Bareli, Uttar Pradesh, since June 2024.[c][d] He previously represented the constituency of Wayanad, Kerala, from 2019 to 2024, and Amethi, Uttar Pradesh, from 2004 to 2019."),
    Container(height:65,width: 130,child: Image.asset("assets/images/LALU.jpg")),
    Text("Lalu Prasad (born 11 June 1948) is an Indian politician who served as the chief minister of Bihar from 1990 to 1997 with a brief interruption in 1995 and as the union minister for Railways from 2004 to 2009. He is the founder and president of the Rashtriya Janata Dal (RJD) a prominent political party in Bihar.[2][3][4] He is also a former member of Parliament (MP) of the Lok Sabha and Rajya Sabha.He entered politics at Patna University as a student leader and in 1977, was elected as one of the youngest member of the Lok Sabha for the Bharatiya Lok Dal of Janata Alliance.")

  
  ],),
    );
  }
}