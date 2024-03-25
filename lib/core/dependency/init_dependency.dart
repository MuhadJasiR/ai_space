import 'package:ai_space/controller/chat_controller.dart';
import 'package:ai_space/controller/sidebar_controller.dart';
import 'package:get/get.dart';

class InitDependency extends Bindings {
  @override
  void dependencies() {
    Get.put(SideBarController());
    Get.put(ChatController());
  }
}
