import 'package:get/get.dart';
import '../routes/app_routes.dart';
import '../../screen/home_screen.dart';
import '../../screen/bindings/home_binding.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}

