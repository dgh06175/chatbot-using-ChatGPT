import 'package:flutter/material.dart';
import 'chat_screen.dart';
import '../util/color.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController inputTextEditingController = TextEditingController();
  String inputText = '';
  clearSearchBox() {
    inputTextEditingController.clear();
    setState(() {
      inputText = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
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
                '메세지를 받은 사람과의 관계를 알려주세요.',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 0.0),
                child: TextField(
                  controller: inputTextEditingController,
                  autofocus: true,
                  cursorColor: Colors.white,
                  cursorHeight: 24.0,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    hintText: '입력 후 엔터',
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: ColorSets.textFieldbackgroundColor,
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      onPressed: () {
                        clearSearchBox();
                      },
                      icon: Icon(
                        Icons.clear,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onSubmitted: (text) {
                    clearSearchBox();
                    setState(() {
                      inputText = text;
                    });
                  },
                ),
              ),
              SizedBox(height: 20),
              inputText == ""
                  ? SizedBox(height: 16)
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorSets.pointColor),
                      onPressed: () {
                        inputText == ""
                            ? showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: const Text('관계를 입력해주세요.'),
                                      // content: Text('Of course not!'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ))
                            : Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ChatPage(relationText: inputText);
                                  },
                                ),
                              );
                      },
                      child: Text(
                        '챗봇 실행 ! (' + inputText + ')',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
