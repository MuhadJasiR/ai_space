import 'package:ai_space/api/chat_api_service.dart';
import 'package:ai_space/model/chat_message_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  RxList<ChatMessageModel> message = <ChatMessageModel>[].obs;
  RxBool isLoading = false.obs;
  final TextEditingController textEditingController = TextEditingController();
  Future chatRequest() async {
    final text = textEditingController.text;
    textEditingController.clear();
    isLoading.value = true;
    message.add(
        ChatMessageModel(role: "user", parts: [ChatPartModel(text: text)]));
    final generatedText = await ChatApiService().chatRequest(message);
    if (generatedText.isNotEmpty) {
      message.add(ChatMessageModel(
          role: "model", parts: [ChatPartModel(text: generatedText)]));
    } else {
      isLoading.value = false;
    }
    isLoading.value = false;
  }
}
