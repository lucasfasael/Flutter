import 'package:flutter/material.dart';
import 'package:petinder/chat_widget.dart';

class DogChat extends StatefulWidget {
  DogChat({super.key});

  @override
  State<DogChat> createState() => _DogChatState();
}

class _DogChatState extends State<DogChat> {
  final List<String> msgs = [];

  @override
  Widget build(BuildContext context) {
    String textController = '';
    var controller = TextEditingController();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    void newMsg(String textController) {
      msgs.add(textController);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: width,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: msgs.map((e) => ChatWidget(msg: e)).toList(),
                  ),
                ),
              ),
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 150),
            child: TextField(
              controller: controller,
              maxLines: null,
              onChanged: (value) {
                textController = controller.text;
              },
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          textController.isEmpty
                              ? null
                              : newMsg(textController);
                          controller.clear();
                        });
                      },
                      icon: Icon(
                        Icons.send,
                        color: Color.fromARGB(255, 0, 4, 255),
                      )),
                  hintText: "Digite sua mensagem aqui",
                  border: OutlineInputBorder()),
            ),
          )
        ],
      ),
    );
  }
}
