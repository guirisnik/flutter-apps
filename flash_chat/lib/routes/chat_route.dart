import 'package:flutter/material.dart';
import 'package:flash_chat/components/input.dart';

class ChatRoute extends StatefulWidget {
  static const routeName = '/chat';
  
  @override
  _ChatRouteState createState() => _ChatRouteState();
}

class _ChatRouteState extends State<ChatRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.close),
          )
        ],
      ),
      backgroundColor: Colors.lightBlue,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('https://qph.fs.quoracdn.net/main-qimg-8b585fb4a5c9fedbb899cfb0cf0331a7'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Row(
                  children: [

                  ],
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: Container(
                color: Colors.lightBlue,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Input(
                          color: Colors.lightBlue,
                          borderWidth: 0.0,
                          textAlign: TextAlign.justify,
                          multiLine: true,
                        )
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.send,
                          color: Colors.amber,
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ),)
          ],
        ),
      ),
    );
  }
}