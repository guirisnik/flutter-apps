import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';
import 'message.dart';

/*
 * The ideal for this component would be, instead of a StreamBuilder, a stateless ListView that
 * just gets incremented with new messages based on a listener.
 * The way it's built now makes the component render every entirely for every new message, which
 * causes a flicker on the screen for a brief moment while all the data is being fetched from
 * the database.
 * For now I'll just leave it like that, but in case I decide to update, let this be a warning
 * to the future me!
 */

class MessageView extends StatelessWidget {
  final _store = Firestore.instance;
  final ScrollController scrollController;
  final String userEmail;

  MessageView({
    this.userEmail,
    this.scrollController,
  });

  From messageFrom(String sender) {
    if (sender == userEmail) return From.user;
    if (sender == SYSTEM_SENDER) return From.system;
    return From.contact;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _store.collection(MESSAGE_COLLECTION).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          if (snapshot.hasData) {
            final documents = snapshot.data.documents;
            String lastSender;
            documents.sort((a, b) => a.data['created_at']
                .toDate()
                .compareTo(b.data['created_at'].toDate()));

            return ListView(
              controller: scrollController,
              children: documents.map((DocumentSnapshot document) {
                final String sender = lastSender == document.data['sender']
                    ? ''
                    : document.data['sender'];
                lastSender = document.data['sender'];
                return Message(
                    text: document.data['text'],
                    sender: sender,
                    from: messageFrom(document.data['sender']));
              }).toList(),
            );
          }
        });
  }
}
