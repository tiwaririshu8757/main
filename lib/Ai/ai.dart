import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:voting/main.dart';


class Aii extends StatefulWidget{
  const Aii({super.key});

  @override
  State<Aii> createState() => _AiiState();
}

class _AiiState extends State<Aii> {
   String _apikey = "AIzaSyAGCl6opSjoa-eFIc-4WN_9cXd3wamK7E4";

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



