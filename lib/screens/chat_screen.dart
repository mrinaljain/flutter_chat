import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat App')),
      body: StreamBuilder(
          stream: Firestore.instance
              .collection('chats/wumfiKuX5jQuRBUO2hEp/messages')
              .snapshots(),
          builder: (ctx, streamSnapshot) {
            if (streamSnapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final documents = streamSnapshot.data.documents;
            return ListView.builder(
                itemCount: documents.length,
                itemBuilder: (ctx, index) => Card(
                      margin: EdgeInsets.only(bottom: 10),
                      elevation: 7,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(documents[index]['text']),
                      ),
                    ));
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Firestore.instance
                .collection('chats/wumfiKuX5jQuRBUO2hEp/messages')
                .add({'text': 'This Wass added by Clicking Button'});
          },
          child: Icon(Icons.add)),
    );
  }
}
