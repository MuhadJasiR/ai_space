import 'package:ai_space/controller/chat_controller.dart';
import 'package:ai_space/core/constants/const_colors.dart';
import 'package:ai_space/core/constants/constants.dart';
import 'package:ai_space/view/home/widget/drop_down_widget.dart';
import 'package:ai_space/view/home/widget/sidebar_widget.dart';
import 'package:ai_space/view/home/widget/specialized_suggestion_widget.dart';
import 'package:ai_space/view/home/widget/suggested_question_widget.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isTablet = size.width > 600 && size.width < 960;
    bool isMobile = size.width < 600;
    final chatController = Get.find<ChatController>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SizedBox(
          height: size.height * 0.04,
          child: Image.asset(
            isMobile || isTablet
                ? "assets/dutco_single_logo.png"
                : "assets/Dutco_Logo.png",
          ),
        ),
        actions: [
          Row(
            children: [
              const MyDropdownButton(),
              const MyDropdownButton(),
              const SizedBox(width: 5),
              InkWell(
                onTap: () => Get.toNamed("/signUp"),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: const Text(
                    "Sign In",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      drawer: const MobileDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Obx(() {
          if (chatController.message.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                kHeight(10),
                LayoutBuilder(
                  builder: (context, constraints) {
                    bool isMobile = constraints.maxWidth < 600;
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Chat with",
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.w900),
                            ),
                            kWidth(10),
                            SizedBox(
                                height: size.height * 0.05,
                                child:
                                    Image.asset("assets/dutco_single_logo.png"))
                          ],
                        ),
                        Container(
                          color: Colors.grey.shade400,
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: Text(
                            "Powered by Longspur Technologies",
                            style: TextStyle(fontSize: isMobile ? 12 : 15),
                          ),
                        ),
                        kHeight(20),
                        Text(
                          "Ask for Products, Catalogs and more...",
                          style: TextStyle(
                              fontSize: isMobile ? 20 : 28,
                              fontWeight: FontWeight.w900),
                          textAlign: TextAlign.center,
                        ),
                        kHeight(20),
                        SizedBox(
                          width: isMobile ? null : size.width * 0.5,
                          child: TextFormField(
                            controller: chatController.textEditingController,
                            style: const TextStyle(fontSize: 25),
                            decoration: InputDecoration(
                              suffixIcon: Container(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: InkWell(
                                  onTap: () async {
                                    await chatController.chatRequest();
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: kPrimaryColor,
                                    child: Icon(
                                      Icons.search,
                                      color: kWhiteColor,
                                    ),
                                  ),
                                ),
                              ),
                              hintText:
                                  "know our new product approved by Dubai Municipality? |",
                              hintStyle: TextStyle(
                                  fontSize: isMobile ? 20 : 25,
                                  color: kGreyColorShade300),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: kGreyColorShade300),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: kGreyColorShade300),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              contentPadding: isMobile
                                  ? const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 20)
                                  : const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 20),
                            ),
                            onFieldSubmitted: (value) async {
                              await chatController.chatRequest();
                            },
                          ),
                        ),
                        kHeight(20),
                        const Text(
                          "Suggested Questions",
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                        ),
                        kHeight(10),
                        SuggestedQuestionWidget(
                          size: size,
                          question:
                              'Help with choosing lab analytical instruments?',
                        ),
                        kHeight(10),
                        SuggestedQuestionWidget(
                          size: size,
                          question:
                              'Need some help with drip tubes for landscaping?',
                        ),
                        kHeight(10),
                        SuggestedQuestionWidget(
                          size: size,
                          question:
                              'Provide specs for a 12-inch gate valve suitable for potable water systems?',
                        ),
                      ],
                    );
                  },
                ),
                const SpecializedSuggestionWidget(),
              ],
            );
          } else {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: chatController.message.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          chatController.message[index].role == "user"
                              ? Image.asset(
                                  "assets/dutco_single_logo.png",
                                  height: 30,
                                )
                              : IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.send_outlined)),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: chatController.message[index].role ==
                                        "model"
                                    ? const Color(0xFFEFF7F5)
                                    : null,
                                border: Border.all(
                                    color: chatController.message[index].role ==
                                            "model"
                                        ? Colors.green
                                        : Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                chatController.message[index].parts.first.text,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                chatController.isLoading.value
                    ? LottieBuilder.asset(
                        "assets/Loading2.json",
                        height: 100,
                      )
                    : const SizedBox(),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: TextFormField(
                          controller: chatController.textEditingController,
                          style: const TextStyle(fontSize: 25),
                          decoration: InputDecoration(
                            suffixIcon: Container(
                              padding: const EdgeInsets.only(right: 10),
                              child: InkWell(
                                onTap: () async {
                                  await chatController.chatRequest();
                                },
                                child: CircleAvatar(
                                  backgroundColor: kPrimaryColor,
                                  child: Icon(
                                    Icons.search,
                                    color: kWhiteColor,
                                  ),
                                ),
                              ),
                            ),
                            hintText:
                                "know our new product approved by Dubai Municipality? |",
                            hintStyle: TextStyle(
                                fontSize: isMobile ? 20 : 25,
                                color: kGreyColorShade300),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: kGreyColorShade300),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: kGreyColorShade300),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: isMobile
                                ? const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 20)
                                : const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 20),
                          ),
                          onFieldSubmitted: (value) async {
                            await chatController.chatRequest();
                          },
                        ),
                      ),
                    ),
                    kWidth(10),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          color: Colors.grey.shade300,
                          child: const Text("To know more",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Row(
                          children: [
                            const Text(
                              "Suhail",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            IconButton(
                                onPressed: () {}, icon: const Icon(Icons.call)),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.message))
                          ],
                        ),
                      ],
                    )
                  ],
                )
              ],
            );
          }
        }),
      ),
    );
  }
}
