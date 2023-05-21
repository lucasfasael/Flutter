import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int umidade = 40;
  String msg = '';

  final client = MqttServerClient('192.168.101.8', '1883');

  Future<void> kev() async {
    client.logging(on: true);
    client.keepAlivePeriod = 60;

    try {
      await client.connect();
    } on NoConnectionException {
      client.disconnect();
    } on SocketException {
      client.disconnect();
    }

    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      const topic = 'umidade';
      client.subscribe(topic, MqttQos.atMostOnce);
      client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
        final recMess = c![0].payload as MqttPublishMessage;
        String newMsg =
            MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
        if (msg != newMsg) {
          setState(() => msg = newMsg);
        }
      });
    } else {
      log('client connection failed - disconnecting, status is ${client.connectionStatus}');
      client.disconnect();
      exit(-1);
    }
  }

  @override
  void initState() {
    super.initState();
    kev();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Center(
          child: Text(
            "Nível de Umidade - Irrigação",
            style:
                TextStyle(color: Color.fromARGB(255, 12, 0, 247), fontSize: 25),
          ),
        ),
      ),
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://img.freepik.com/fotos-premium/broto-verde-crescendo-no-jardim-com-sol_34152-1246.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            msg.isEmpty ? 'Ainda não há mensagem' : "Umidade: $msg",
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Color.fromARGB(255, 12, 0, 247), fontSize: 40),
          ),
        ),
      ),
    );
  }
}
