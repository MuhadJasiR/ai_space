import 'package:ai_space/controller/sidebar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabletSizeSideBar extends StatelessWidget {
  const TabletSizeSideBar({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    final sideBarController = Get.find<SideBarController>();

    return SizedBox(
      width: size.width * 0.05,
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                  onPressed: () {
                    sideBarController.isMinimized.toggle();
                  },
                  icon: const Icon(Icons.menu)),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.grid_view_outlined)),
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
  }
}
