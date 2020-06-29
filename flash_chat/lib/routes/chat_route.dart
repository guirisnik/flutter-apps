import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/components/message_view.dart';

/*
 * There's an issue in chat route where MessageView doesn't scroll
 * to the bottom at the start, only after new data arrives.
 * I'm too lazy to fix that right now, so just leaving this here to
 * remind me in case I come back here someday hehe.
 */ 

class ChatRoute extends StatefulWidget {
  static const routeName = '/chat';

  @override
  _ChatRouteState createState() => _ChatRouteState();
}

class _ChatRouteState extends State<ChatRoute> {
  final Color _themeColor = Colors.grey.shade900;
  final _store = Firestore.instance;
  final _auth = FirebaseAuth.instance;
  TextEditingController _inputController;
  ScrollController _scrollController = ScrollController();
  String userEmail;
  String message = '';

  void setMessage(value) {
    setState(() {
      message = value;
    });
  }

  void getCurrentUser() async {
    final user = await _auth.currentUser();
    if (user != null) {
      setState(() {
        userEmail = user.email;
        print(userEmail);
      });
    }
  }

  void logOut() async {
    await _auth.signOut();
    Navigator.pop(context);
  }

  void sendMessage() async {
    setMessage(_inputController.text);
    _inputController.clear();

    if (message != null && message != '')
      await _store.collection(MESSAGE_COLLECTION).add({
        'sender': userEmail,
        'text': message,
        'created_at': DateTime.now(),
      });

    setMessage('');
    
    scrollToBottom();
  }

  void scrollToBottom() => _scrollController.animateTo(
    _scrollController.position.maxScrollExtent,
    duration: Duration(milliseconds: 300), 
    curve: Curves.easeOut
  );

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    _inputController = TextEditingController();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _inputController.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        backgroundColor: _themeColor,
        actions: [
          IconButton(
            onPressed: logOut,
            icon: Icon(Icons.close),
          )
        ],
      ),
      backgroundColor: _themeColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://qph.fs.quoracdn.net/main-qimg-8b585fb4a5c9fedbb899cfb0cf0331a7'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: MessageView(
                  userEmail: userEmail,
                  scrollController: _scrollController,
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: Container(
                color: _themeColor,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Input(
                        controller: _inputController,
                        color: _themeColor,
                        borderWidth: 0.0,
                        textAlign: TextAlign.justify,
                        multiLine: true,
                      )),
                      IconButton(
                        icon: Icon(
                          Icons.send,
                          color: Colors.amber,
                        ),
                        onPressed: sendMessage,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
