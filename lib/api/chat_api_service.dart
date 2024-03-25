import 'dart:developer';

import 'package:ai_space/core/constants/api_const.dart';
import 'package:ai_space/model/chat_message_model.dart';
import 'package:dio/dio.dart';

class ChatApiService {
  final Dio dio = Dio();
  Future<String> chatRequest(List<ChatMessageModel> previousMessage) async {
    try {
      final response = await dio.post(
          "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.0-pro:generateContent?key=${APiConfig.apiKey}",
          data: {
            "contents":
                previousMessage.map((element) => element.toMap()).toList(),
            "generationConfig": {
              "temperature": 0.9,
              "topK": 1,
              "topP": 1,
              "maxOutputTokens": 2048,
              "stopSequences": []
            },
            "safetySettings": [
              {
                "category": "HARM_CATEGORY_HARASSMENT",
                "threshold": "BLOCK_MEDIUM_AND_ABOVE"
              },
              {
                "category": "HARM_CATEGORY_HATE_SPEECH",
                "threshold": "BLOCK_MEDIUM_AND_ABOVE"
              },
              {
                "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
                "threshold": "BLOCK_MEDIUM_AND_ABOVE"
              },
              {
                "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
                "threshold": "BLOCK_MEDIUM_AND_ABOVE"
              }
            ],
          });

      if (response.statusCode == 200) {
        log(response.data.toString(), name: "success response");
        log(response.data["candidates"][0]["content"]["parts"][0]["text"]);
        return response.data["candidates"][0]["content"]["parts"][0]["text"];
      }
    } catch (e) {
      log(e.toString(), name: "error");
    }
    return "";
  }
}
