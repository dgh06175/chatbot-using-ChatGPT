import 'package:http/http.dart' as http;
import 'package:chatbot/util/keys.dart';
import 'dart:convert';

const systemContent =
    "You are a chatbot that recommends replying to messages. Your role is the user\'s friend. If the user asks for an explanation you should explain it for your past answer. If not, just tell him the recommended reply without explanation. use Korean language";

Future<String> sendMessageToChatGPT(String message) async {
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
        {"role": "user", "content": message}
      ],
    }),
  );
  // Do something with the response
  Map<String, dynamic> newresponse =
      jsonDecode(utf8.decode(response.bodyBytes));

  return newresponse['choices'][0]['message']['content'];
}
