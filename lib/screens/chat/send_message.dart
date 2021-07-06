import 'package:estate_social_app/constant.dart';
import 'package:estate_social_app/widgets/core/sub_page.dart';
import 'package:flutter/material.dart';

class MessageSendScreen extends StatefulWidget {
  _MessageSendScreenState createState() => _MessageSendScreenState();
}

class _MessageSendScreenState extends State<MessageSendScreen> {
  Widget _buildCard(context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(0, 4),
            blurRadius: 6,
          )
        ],
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 90,
                height: 90,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: Image(
                    image: AssetImage('assets/images/home.png'),
                  ),
                ),
              ),
              hSBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      mainBoldText("1,000.00 AD", size: 16),
                    ],
                  ),
                  vXSBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.pin_drop_outlined,
                        color: Colors.black45,
                      ),
                      hSBox,
                      greyText('7744 Mill Pond, Damam St.')
                    ],
                  ),
                  vXSBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      imageIcon(icon: 'bed'),
                      hXSBox,
                      greyText('2'),
                      hMdSBox,
                      imageIcon(icon: 'bed'),
                      hXSBox,
                      greyText('3'),
                      hMdSBox,
                      imageIcon(icon: 'bed'),
                      hXSBox,
                      greyText('110m'),
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget messageContent() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: grey),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }

  Widget messageInput() {
    return paddingBox(
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              height: 48,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: Offset(0, 4),
                    blurRadius: 6,
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(24)),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Expanded(child: SizedBox()),
                  hSBox,
                  Icon(Icons.camera_alt_outlined),
                  hMdSBox
                ],
              ),
            ),
          ),
          hMdSBox,
          FloatingActionButton(
            onPressed: () => {},
            backgroundColor: primaryColor,
            child: Icon(
              Icons.mic,
              color: white,
            ),
          )
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return SubPage(
      title: 'Chat\'s Name',
      child: Container(
        child: Column(
          children: [
            paddingBox(child: _buildCard(context)),
            Expanded(
              child: paddingHBox(child: messageContent()),
            ),
            messageInput()
          ],
        ),
      ),
    );
  }
}
