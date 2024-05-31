import 'package:ai_space/controller/chat_controller.dart';
import 'package:ai_space/controller/sidebar_controller.dart';
import 'package:ai_space/core/constants/const_colors.dart';
import 'package:ai_space/core/constants/constants.dart';
import 'package:ai_space/view/home/widget/drop_down_widget.dart';
import 'package:ai_space/view/home/widget/table_size_side_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isTabletSize = size.width > 600 && size.width < 960;
    final bool isDesktopSize = size.width >= 960;
    final sideBarController = Get.find<SideBarController>();
    final chatController = Get.find<ChatController>();

    if (isTabletSize) {
      return TabletSizeSideBar(size: size);
    } else if (isDesktopSize) {
      return Obx(() => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: sideBarController.isMinimized.value ? 60 : 240,
            child: Drawer(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: IconButton(
                        onPressed: () {
                          sideBarController.isMinimized.toggle();
                        },
                        icon: const Icon(Icons.menu),
                      ),
                    ),
                    ListTile(
                      selected: true,
                      selectedColor: kPrimaryColor,
                      iconColor: kPrimaryColor,
                      textColor: kPrimaryColor,
                      leading: const Icon(Icons.grid_view_outlined),
                      title: sideBarController.isMinimized.value
                          ? null
                          : const Text('AI Assistant'),
                      onTap: () {
                        sideBarController.selectedPageIdx.value = 0;
                        sideBarController.update();
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.add_box_rounded),
                      title: sideBarController.isMinimized.value
                          ? null
                          : const Text('New Chat'),
                      onTap: () {
                        chatController.message.clear();
                        sideBarController.selectedPageIdx.value = 1;
                        sideBarController.update();
                      },
                    ),
                    if (!sideBarController.isMinimized.value)
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Today",
                              style: TextStyle(
                                  color:
                                      const Color(0xFF244069).withOpacity(0.5)),
                            ),
                            kHeight(5),
                            const Text(
                              "Solenoid valve Products",
                              style: TextStyle(
                                  color: Color(0xFF244069),
                                  fontWeight: FontWeight.bold),
                            ),
                            kHeight(30),
                            Text(
                              "yesterday",
                              style: TextStyle(
                                  color:
                                      const Color(0xFF244069).withOpacity(0.5)),
                            ),
                            kHeight(5),
                            const Text(
                              "Specification for Solenoid",
                              style: TextStyle(
                                  color: Color(0xFF244069),
                                  fontWeight: FontWeight.bold),
                            ),
                            kHeight(5),
                            const Text(
                              "Irrigation product",
                              style: TextStyle(
                                  color: Color(0xFF244069),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    const Spacer(),
                    ListTile(
                      leading: const Icon(Icons.blur_circular_rounded),
                      title: sideBarController.isMinimized.value
                          ? null
                          : const Text('Discover'),
                      onTap: () {
                        sideBarController.selectedPageIdx.value = 2;
                        sideBarController.update();
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: sideBarController.isMinimized.value
                          ? null
                          : const Text('Settings'),
                      onTap: () {
                        sideBarController.selectedPageIdx.value = 3;
                        sideBarController.update();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ));
    } else {
      return const SizedBox();
    }
  }
}

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              selectedColor: kPrimaryColor,
              leading: const Icon(
                Icons.grid_view_outlined,
              ),
              title: const Text(
                'AI Assistant',
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.add_box_rounded),
              title: const Text('New Chat'),
              onTap: () {
                // Navigate to settings page
              },
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Today",
                    style: TextStyle(
                        color: const Color(0xFF244069).withOpacity(0.5)),
                  ),
                  kHeight(5),
                  const Text(
                    "Solenoid valve Products",
                    style: TextStyle(
                        color: Color(0xFF244069), fontWeight: FontWeight.bold),
                  ),
                  kHeight(30),
                  Text(
                    "yesterday",
                    style: TextStyle(
                        color: const Color(0xFF244069).withOpacity(0.5)),
                  ),
                  kHeight(5),
                  const Text(
                    "Specification for Solenoid",
                    style: TextStyle(
                        color: Color(0xFF244069), fontWeight: FontWeight.bold),
                  ),
                  kHeight(5),
                  const Text(
                    "Irrigation product",
                    style: TextStyle(
                        color: Color(0xFF244069), fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: MyDropdownButton(),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: MyDropdownButton(),
            ),
            ListTile(
              leading: Icon(
                Icons.login,
                color: kGreenColor,
              ),
              title: Text(
                'Sign In',
                style: TextStyle(color: kGreenColor),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.blur_circular_rounded),
              title: const Text('Discover'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
