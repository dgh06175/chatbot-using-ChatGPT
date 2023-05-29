import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Screen(),
    );
  }
}

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  final List<String> messages = [];

  TextEditingController messageController = TextEditingController();

  void sendMessage(String message) {
    setState(() {
      messages.add(message);
      messageController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text('메세지 답장 봇'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 1,
              child: Divider(
                color: Colors.white,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(messages[index],
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        )),
                  );
                },
              ),
            ),
            SizedBox(
              height: 1,
              child: Divider(
                color: Colors.white,
              ),
            ),
            Container(
              color: Colors.grey[800],
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      autofocus: true,
                      cursorColor: Colors.yellow,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                      decoration: InputDecoration(
                        hintText: '메세지를 입력하세요.',
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      sendMessage(messageController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    child: Text('전송'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
