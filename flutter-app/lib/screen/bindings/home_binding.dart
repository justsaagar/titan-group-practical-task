import 'package:get/get.dart';
import '../../app/controllers/items_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ItemsController>(() => ItemsController());
  }
}

