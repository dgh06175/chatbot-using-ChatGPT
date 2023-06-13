import 'package:http/http.dart' as http;
import 'package:chatbot/util/keys.dart';
import 'dart:convert';

Future<String> sendMessageToChatGPT(String message, String relationText) async {
  const String systemContent =
      "You are a robot that recommends what User should reply to text messages from someone. use korean.";
  String assistantContent = "유저는 $relationText에게 문자를 받았어.";

  var url = Uri.https("api.openai.com", "/v1/chat/completions");
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
      "Authorization": "Bearer $MY_API_KEY"
    },
    body: json.encode({
      "model": "gpt-3.5-turbo",
      "messages": [
        {
          "role": "system",
          "content": systemContent,
        },
        {"role": "user", "content": message},
        {"role": "assistant", "content": assistantContent}
      ],
      // "temperature": "2",
    }),
  );
  // Do something with the response
  Map<String, dynamic> newresponse =
      jsonDecode(utf8.decode(response.bodyBytes));

  return newresponse['choices'][0]['message']['content'];
}
