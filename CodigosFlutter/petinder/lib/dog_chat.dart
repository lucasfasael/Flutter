import 'package:flutter/material.dart';
import 'package:petinder/chat_widget.dart';

class DogChat extends StatefulWidget {
  const DogChat({super.key});

  @override
  State<DogChat> createState() => _DogChatState();
}

class _DogChatState extends State<DogChat> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textController = TextEditingController();
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
                      children: [
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                        ChatWidget(),
                      ],
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
                  controller: textController,
                  decoration: InputDecoration(
                      suffix: IconButton(
                          padding: EdgeInsets.only(top: 20),
                          onPressed: () {},
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
