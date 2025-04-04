
import 'package:google_generative_ai/google_generative_ai.dart';

class Aii extends StatefulWidget {
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
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
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
    return const Placeholder();
  }
}
