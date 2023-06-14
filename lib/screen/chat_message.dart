import 'package:flutter/material.dart';
import '../chat/chat_model.dart';
import '../util/color.dart';

class ChatMessageWidget extends StatelessWidget {
  const ChatMessageWidget(
      {super.key, required this.text, required this.chatMessageType});

  final String text;
  final ChatMessageType chatMessageType;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.all(16),
      color: chatMessageType == ChatMessageType.bot
          ? ColorSets.botBackgroundColor
          : ColorSets.backgroundColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: chatMessageType == ChatMessageType.bot
            // AI의 대사일 경우
            ? <Widget>[
                Container(
                  margin: const EdgeInsets.only(right: 8.0),
                  child: CircleAvatar(
                    backgroundColor: const Color.fromRGBO(16, 163, 127, 1),
                    child: Image.asset(
                      'picture/chatgpt.png',
                      color: Colors.white,
                      scale: 1.5,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        child: Text(
                          text,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ]
            // 유저의 대사일 경우
            : <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        child: Text(
                          text,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 8.0),
                  child: const CircleAvatar(
                    backgroundColor: const Color.fromRGBO(70, 70, 70, 1),
                    child: Icon(
                      Icons.person,
                    ),
                  ),
                ),
              ],
      ),
    );
  }
}
