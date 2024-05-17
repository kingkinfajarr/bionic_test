import 'package:get/get.dart';

import '../../splash_page.dart';
import '../modules/chat/bindings/chat_binding.dart';
import '../modules/chat/views/chat_view.dart';
import '../modules/contact/bindings/contact_binding.dart';
import '../modules/contact/views/contact_view.dart';
import '../modules/data/bindings/data_binding.dart';
import '../modules/data/views/data_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/map/bindings/map_binding.dart';
import '../modules/map/views/map_view.dart';
import '../modules/media/bindings/media_binding.dart';
import '../modules/media/views/media_view.dart';
import '../modules/search_contact/bindings/search_contact_binding.dart';
import '../modules/search_contact/views/search_contact_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.MAP,
      page: () => const MapView(),
      binding: MapBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.CONTACT,
      page: () => ContactView(),
      binding: ContactBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.MEDIA,
      page: () => const MediaView(),
      binding: MediaBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.DATA,
      page: () => const DataView(),
      binding: DataBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_CONTACT,
      page: () => SearchContactView(),
      binding: SearchContactBinding(),
    ),
  ];
}
