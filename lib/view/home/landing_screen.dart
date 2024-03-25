import 'package:ai_space/controller/sidebar_controller.dart';
import 'package:ai_space/view/ai_assistant/ai_assistant_screen.dart';
import 'package:ai_space/view/auth/login_screen.dart';
import 'package:ai_space/view/auth/verification_screen.dart';
import 'package:ai_space/view/discover/discover_screen.dart';
import 'package:ai_space/view/home/home_screen.dart';
import 'package:ai_space/view/home/widget/sidebar_widget.dart';
import 'package:ai_space/view/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sideBarController = Get.find<SideBarController>();
    List<Widget> screens = const [
      AiAssistantScreen(),
      HomeScreen(),
      DiscoverScreen(),
      SettingsScreen(),
      LoginScreen(),
    ];
    return Scaffold(
      body: Row(
        children: [
          const MyDrawer(),
          Obx(
            () => Expanded(
              child: Container(
                child: screens[sideBarController.selectedPageIdx.value],
              ),
            ),
          )
        ],
      ),
    );
  }
}
