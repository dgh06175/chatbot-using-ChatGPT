Flutter / GPT-3.5-turbo

## 📺 메세지 답장 추천 챗봇
Message respond recommend Chatbot
Chatbot_APP은 사용자가 특정 대상에게 받은 메세지를 분석하여 적절한 답변을 추천해주는 챗봇입니다.
답장하기 곤란한 문자 메세지를 받았을때 사용하기 위해 고안됐습니다.

## 🛠 기능
* 사용자가 누구와 메세지를 주고받고 있는지 입력합니다.
* 챗봇을 실행하고, 받은 메세지 내용을 입력합니다.
* GPT-3.5 모델이 메세지를 분석하여 답변을 추천합니다.
https://youtube.com/shorts/uCA8JbMmlaU?feature=share
## 🎦 작동 영상
[![ChatBot](https://youtube.com/shorts/uCA8JbMmlaU)]

## 🎮 실행 방법
lib/util/keys.dart 를 생성하고 다음과 같은 코드를 입력해 줘야 합니다.
#### keys.dart
```dart
const String MY_API_KEY = '{본인의 OpenAi API key}';
```
위 작업을 완료한 후, Android Studio를 이용해서 실행해야 합니다.

[GPT-3.5 API 공식문서](https://platform.openai.com/docs/api-reference/chat)
