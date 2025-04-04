import 'package:flutter/material.dart';
import 'package:voting/Ai/ai.dart';
import 'package:voting/Drawer/Eci.dart';
import 'package:voting/Drawer/voteredu.dart';
import 'package:voting/Home/Hom.dart';
import 'package:voting/Home/Votting.dart';
import 'package:voting/Login/Login.dart';
import 'package:voting/SignUp/signup.dart';
import 'package:voting/Splash/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_generative_ai/google_generative_ai.dart';



String _apikey = "AIzaSyAGCl6opSjoa-eFIc-4WN_9cXd3wamK7E4";


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home:Aii(),//AuthWrapper(),
    );
  }
}





class Aii extends StatefulWidget{
  const Aii({super.key});

  @override
  State<Aii> createState() => _AiiState();
}

class _AiiState extends State<Aii> {
  late final GenerativeModel _model;
  late final ChatSession _chat;
  final ScrollController _scrollController=ScrollController();
  final TextEditingController _textController=TextEditingController();
  final List<ChatMessage> _messages=[];

  @override
  void initState() {
    super.initState();
    _model=GenerativeModel(
      model:"gemini-2.0-flash" ,
      apiKey:_apikey ,
    );
    _chat=_model.startChat();
  }
  
  
  void _scrolldowm(){
    WidgetsBinding.instance.addPostFrameCallback((_)=>_scrollController.animateTo(
    _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 750),
        curve: Curves.easeOutCirc),);
  }
  
  Future<void>_sendMessage(String message)async{
    setState(() {
      _messages.add(ChatMessage(text: message, isUser: true));
    });
    try{
      final response=await _chat.sendMessage(Content.text(message));
      final text=response.text;
      setState(() {
        _messages.add(ChatMessage(text: text!, isUser: false));
        _scrolldowm();
      });
    }catch(e){
      setState(() {
        _messages.add(ChatMessage(text: "Error occured", isUser: false));
      });
    }finally{
      _textController.clear();
    }
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("AI"),
      ),
      body: Column(children: [
        Expanded(child: ListView.builder(
          controller: _scrollController,
            itemCount: _messages.length,
            itemBuilder: (context,index){
          return ChatBubble(message: _messages[index]);
        },)),
        Padding(padding: EdgeInsets.all(8),
        child: Row(children: [
          Expanded(child: TextField(
            
            controller: _textController,
            decoration: InputDecoration(
              hintText: "Enter your message",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              ),
            ),
          ),
          IconButton(onPressed: ()=> _sendMessage(_textController.text),
           icon: Icon(Icons.send))
        ],)),
      ],),
    );
  }
}



class ChatMessage{

  final String text;
  final bool isUser;
  ChatMessage({required this.text,required this.isUser});
}





class ChatBubble extends StatelessWidget {
  final ChatMessage message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
      alignment: message.isUser?Alignment.centerRight:Alignment.centerLeft,

      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width / 1.25,

        ),
        padding:EdgeInsets.symmetric(vertical: 10,horizontal: 14),
        decoration: BoxDecoration(
          color: message.isUser?Colors.blue:Colors.grey[300],
        ),
        child: Text(message.text,style: TextStyle(fontSize: 16,),),
      ),

    );
  }
}



