import 'package:flutter/material.dart';
import 'package:petinder/chat_widget.dart';

class DogChat extends StatefulWidget {

  DogChat({super.key});

  @override
  State<DogChat> createState() => _DogChatState();
}

class _DogChatState extends State<DogChat> {
  final List<ChatWidget> msgs = [];
  
  @override
  
  Widget build(BuildContext context) {
    String textController = '';
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    void newMsg(String msg) {
      msgs.add(ChatWidget(msg: textController));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: width / 3, height: height / 10, color: Colors.green),
              Column(
                children: [
                  Container(
                    width: width / 1.5,
                    height: height * 0.85,
                    color: Colors.blue,
                    child: ListView(
                      children: msgs,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            height: height * 0.077,
            width: width,
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: TextField(
                  onChanged: (value) {
                    textController = value;
                  },
                  decoration: InputDecoration(
                      suffix: IconButton(
                          padding: EdgeInsets.only(top: 20),
                          onPressed: () {
                            setState(() {
                              textController.isEmpty
                                  ? null
                                  : newMsg(textController);
                            });
                          },
                          icon: Icon(
                            Icons.send,
                            color: Colors.green,
                          )),
                      hintText: "Digite sua mensagem aqui",
                      border: OutlineInputBorder()),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
