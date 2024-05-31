import 'package:ai_space/controller/sidebar_controller.dart';
import 'package:ai_space/view/ai_assistant/ai_assistant_screen.dart';
import 'package:ai_space/view/discover/discover_screen.dart';
import 'package:ai_space/view/home/home_screen.dart';
import 'package:ai_space/view/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget/sidebar_widget.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sideBarController = Get.find<SideBarController>();
    List<Widget> screens = const [
      AiAssistantScreen(),
      HomeScreen(),
      DiscoverScreen(),
      SettingsScreen(),
    ];
    return Scaffold(
      drawer: size.width < 600 ? const MobileDrawer() : null,
      appBar: size.width < 600
          ? AppBar(
              title: Image.asset(
                "assets/dutco_single_logo.png",
                height: 40,
              ),
              leading: Builder(
                builder: (context) => IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: const Icon(Icons.menu)),
              ),
            )
          : null,
      body: Obx(
        () => Row(
          children: [
            if (size.width >= 600) const MyDrawer(),
            Expanded(
              child: Container(
                child: screens[sideBarController.selectedPageIdx.value],
              ),
            )
          ],
        ),
      ),
    );
  }
}
