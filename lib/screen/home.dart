import 'package:flutter/material.dart';
import 'screen.dart';
import '../util/color.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String inputText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "메세지 답장 챗봇",
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: ColorSets.botBackgroundColor,
      ),
      backgroundColor: ColorSets.backgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '메세지를 보낸 사람과의 관계를 알려주세요.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _showInputDialog(context);
                },
                child: Text('문자열 입력'),
              ),
              SizedBox(height: 20),
              Text(
                inputText,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ChatPage(relationText: inputText);
                      },
                    ),
                  );
                },
                child: Text('챗봇 실행 !'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showInputDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('문자열 입력'),
          content: TextField(
            onChanged: (value) {
              setState(() {
                inputText = value;
              });
            },
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('확인'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
