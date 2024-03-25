import 'package:ai_space/core/constants/const_colors.dart';
import 'package:ai_space/core/constants/constants.dart';
import 'package:ai_space/view/auth/login_screen.dart';
import 'package:ai_space/view/home/widget/drop_down_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AiAssistantScreen extends StatelessWidget {
  const AiAssistantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    bool isTablet = size.width > 600 && size.width < 960;
    bool isMobile = size.width < 600;
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
                const SizedBox(width: 10),
                const MyDropdownButton(),
                const SizedBox(width: 10),
                const MyDropdownButton(),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Get.to(const LoginScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Sign In",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Column(
          children: [
            const Text(
              "AI Assistants",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Navigate your product world with precision: secure, customized access from initial catalog to submittal, all through our advanced AI Assistant.",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            kHeight(20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomContainer(),
                CustomContainer(),
              ],
            )
          ],
        ));
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: 400,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: kGreyColor,
            width: 2,
          )),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(Icons.check_circle_outline_rounded),
              Image.asset("assets/image 8.png"),
            ],
          ),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "General Product Information",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Product Details: Categories, features, specs, and applications. Inquire about availability, municipal uses, and certifications.",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
