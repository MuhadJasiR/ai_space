import 'package:ai_space/controller/chat_controller.dart';
import 'package:ai_space/controller/sidebar_controller.dart';
import 'package:ai_space/core/constants/const_colors.dart';
import 'package:ai_space/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isTabletSize = size.width > 600 && size.width < 960;
    final bool isDesktopSize = size.width > 960;
    final chatController = Get.find<ChatController>();
    final sideBarController = Get.find<SideBarController>();
    if (isTabletSize) {
      return SizedBox(
        width: size.width * 0.05,
        child: Drawer(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.grid_view_outlined)),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.add_box_rounded)),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.blur_circular_rounded)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
              ],
            ),
          ),
        ),
      );
    } else if (isDesktopSize) {
      return Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child:
                    IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
              ),
              ListTile(
                selected: true,
                selectedColor: kPrimaryColor,
                iconColor: kPrimaryColor,
                textColor: kPrimaryColor,
                leading: const Icon(
                  Icons.grid_view_outlined,
                ),
                title: const Text(
                  'AI Assistant',
                ),
                onTap: () {
                  sideBarController.selectedPageIdx.value = 0;
                  sideBarController.update();
                },
              ),
              ListTile(
                leading: const Icon(Icons.add_box_rounded),
                title: const Text('New Chat'),
                onTap: () {
                  chatController.message.clear();
                  sideBarController.selectedPageIdx.value = 1;
                  sideBarController.update();
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
                          color: Color(0xFF244069),
                          fontWeight: FontWeight.bold),
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
                title: const Text('Discover'),
                onTap: () {
                  sideBarController.selectedPageIdx.value = 2;
                  sideBarController.update();
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  sideBarController.selectedPageIdx.value = 3;
                  sideBarController.update();
                },
              ),
            ],
          ),
        ),
      );
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
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
            ),
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
            ListTile(
              leading: const Icon(Icons.blur_circular_rounded),
              title: const Text('Discover'),
              onTap: () {
                // Navigate to settings page
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Navigate to settings page
              },
            ),
          ],
        ),
      ),
    );
  }
}
