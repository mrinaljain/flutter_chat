import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final Key key;
  final String message;
  final String userName;
  final String imageUrl;
  final bool isMe;

  const MessageBubble(this.message, this.userName, this.imageUrl, this.isMe,
      {this.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
                decoration: BoxDecoration(
                  color:
                      isMe ? Colors.grey[300] : Theme.of(context).accentColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomLeft:
                          !isMe ? Radius.circular(0) : Radius.circular(12),
                      bottomRight:
                          isMe ? Radius.circular(0) : Radius.circular(12)),
                ),
                width: deviceSize.width * 0.6,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                margin: EdgeInsets.symmetric(vertical: 16, horizontal: 4),
                child: Column(
                  crossAxisAlignment:
                      isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isMe
                            ? Colors.black
                            : Theme.of(context).accentTextTheme.headline1.color,
                      ),
                      textAlign: isMe ? TextAlign.end : TextAlign.start,
                    ),
                    Text(
                      message,
                      style: TextStyle(
                        color: isMe
                            ? Colors.black
                            : Theme.of(context).accentTextTheme.headline1.color,
                      ),
                    ),
                  ],
                )),
          ],
        ),
        Positioned(
          right: isMe ? deviceSize.width * 0.55 : null,
          left: isMe ? null : deviceSize.width * 0.55,
          top: -0,
          child: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(imageUrl ?? ''),
            child: Text(imageUrl != null ? '' : userName[0].toUpperCase()),
          ),
        ),
      ],
    );
  }
}
