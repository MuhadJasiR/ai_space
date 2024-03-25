import 'package:ai_space/controller/sidebar_controller.dart';
import 'package:ai_space/controller/sidebar_controller.dart';
import 'package:ai_space/core/constants/const_colors.dart';
import 'package:ai_space/core/constants/constants.dart';
import 'package:ai_space/view/auth/verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isTablet = size.width > 600 && size.width < 1380;
    bool isMobile = size.width < 600;
    final sideBarController = Get.find<SideBarController>();
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: size.height * 0.04,
          child: Image.asset(
            isMobile || isTablet
                ? "assets/dutco_single_logo.png"
                : "assets/Dutco_Logo.png",
          ),
        ),
      ),
      body: SizedBox(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isMobile
                ? Container(
                    padding: const EdgeInsets.all(20),
                    height: size.height * 0.6,
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.green, width: 2)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: kPrimaryColor),
                            ),
                            kHeight(5),
                            const Text(
                              "Join the community",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            TextFormField(
                              decoration:
                                  const InputDecoration(hintText: "Full Name"),
                            ),
                            kHeight(5),
                            TextFormField(
                              decoration: const InputDecoration(
                                  hintText: "Company name"),
                            ),
                            kHeight(5),
                            TextFormField(
                              decoration: const InputDecoration(
                                  hintText: "Company Email Address"),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Get.to(const EmailVerificationScreen());
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                backgroundColor: kGreenColor,
                              ),
                              child: Text(
                                "Create Account",
                                style: TextStyle(color: kWhiteColor),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an Account?",
                              style: TextStyle(color: kGreyColor),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Log in",
                                  style: TextStyle(color: kGreenColor),
                                ))
                          ],
                        )
                      ],
                    ),
                  )
                : Container(
                    padding: const EdgeInsets.all(50),
                    height: size.height * 0.6,
                    width: isTablet ? size.width * 0.6 : size.width * 0.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.green, width: 2)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: kPrimaryColor),
                            ),
                            kHeight(5),
                            const Text(
                              "Join the community",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            TextFormField(
                              decoration:
                                  const InputDecoration(hintText: "Full Name"),
                            ),
                            kHeight(5),
                            TextFormField(
                              decoration: const InputDecoration(
                                  hintText: "Company name"),
                            ),
                            kHeight(5),
                            TextFormField(
                              decoration: const InputDecoration(
                                  hintText: "Company Email Address"),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            sideBarController.selectedPageIdx.value = 5;
                            sideBarController.update();
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              backgroundColor: kGreenColor,
                              minimumSize: const Size(double.infinity, 60)),
                          child: Text(
                            "Create Account",
                            style: TextStyle(color: kWhiteColor),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an Account?",
                              style: TextStyle(color: kGreyColor),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Log in",
                                  style: TextStyle(color: kGreenColor),
                                ))
                          ],
                        )
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
