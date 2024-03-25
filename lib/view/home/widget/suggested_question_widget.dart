// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ai_space/controller/chat_controller.dart';
import 'package:flutter/material.dart';

import 'package:ai_space/core/constants/const_colors.dart';
import 'package:ai_space/core/constants/constants.dart';
import 'package:get/get.dart';

class SuggestedQuestionWidget extends StatelessWidget {
  const SuggestedQuestionWidget({
    super.key,
    required this.size,
    required this.question,
  });

  final Size size;
  final String question;

  @override
  Widget build(BuildContext context) {
    final chatController = Get.find<ChatController>();
    return IntrinsicWidth(
      child: InkWell(
        onTap: () {
          chatController.textEditingController.text = question;
          chatController.chatRequest();
        },
        child: Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
              border: Border.all(color: kGreyColorShade300),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  question,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              kWidth(5),
              const Icon(Icons.search),
            ],
          ),
        ),
      ),
    );
  }
}
