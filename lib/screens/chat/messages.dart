import 'package:estate_social_app/constant.dart';
import 'package:estate_social_app/widgets/avatar.dart';
import 'package:estate_social_app/widgets/core/page.dart';
import 'package:estate_social_app/widgets/search.dart';
import 'package:flutter/material.dart';

class MessagesScreen extends StatefulWidget {
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  List<ChatMessage> messages = [
    ChatMessage(
        name: 'Khalil Ahmed',
        msg: 'Lorem Ipsum is simply dummy text of the ',
        date: '01/02/21',
        online: true,
        avatar: 'avatar1'),
    ChatMessage(
        name: 'Khalil Ahmed',
        msg: 'Lorem Ipsum is simply dummy text of the ',
        date: '01/02/21',
        online: false,
        avatar: 'avatar1'),
    ChatMessage(
        name: 'Khalil Ahmed',
        msg: 'Lorem Ipsum is simply dummy text of the ',
        date: '01/02/21',
        online: true,
        avatar: 'avatar1'),
    ChatMessage(
        name: 'Khalil Ahmed',
        msg: 'Lorem Ipsum is simply dummy text of the ',
        date: '01/02/21',
        online: false,
        avatar: 'avatar1'),
  ];

  Widget _buildMessageItem(context, index) {
    var message = messages[index];
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed('/chat/send'),
      child: paddingSmBox(
        child: Row(
          children: [
            ChatAvatar(
              image: message.avatar,
              online: message.online,
            ),
            hMdSBox,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      boldText(message.name, size: 16),
                      greyText(message.date)
                    ],
                  ),
                  vSBox,
                  greyText(message.msg)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return MainPage(
      title: 'Chat',
      child: Container(
        child: Column(
          children: [
            paddingBox(child: SearchBox()),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.only(top: 0),
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return _buildMessageItem(context, index);
                },
                separatorBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(left: 60),
                  child: divider,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage {
  final String avatar;
  final bool online;
  final String name;
  final String date;
  final String msg;
  ChatMessage({this.name, this.avatar, this.online, this.date, this.msg});
}
