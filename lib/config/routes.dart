// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:karyana_wala/pages/deliverymap/delivery_map.dart';

import '../pages/home/home.dart';
import '../pages/splash/splash.dart';
import '../pages/welcome/onboarding.dart';
import '../pages/welcome/welcome.dart';

class MyRoutes {
  ///views routes***************
  static String home = '/home';
  static String splash = '/splash';
  static String welcome = '/welcome';
  static String deliveryMap = '/delivery-map';

  ///***********get routes******************************************
  static String getHomeRoute() => home;
  static String getSplashRoute() => splash;
  static String getWelcome() => welcome;
  static String getDeliveryMap() => deliveryMap;

  /// *********************GetPage********************************************
  static List<GetPage> appRoutes() => [
        GetPage(
          name: home,
          page: () => HomePage(),
          middlewares: [MyMiddleware()],
          transition: Transition.leftToRightWithFade,
          transitionDuration: Duration(milliseconds: 500),
        ),
        GetPage(
          name: splash,
          page: () => SplashScreen(),
          middlewares: [MyMiddleware()],
          transition: Transition.leftToRightWithFade,
          transitionDuration: Duration(milliseconds: 500),
        ),
        GetPage(
          name: welcome,
          page: () => Welcome(),
          middlewares: [MyMiddleware()],
          transition: Transition.leftToRightWithFade,
          transitionDuration: Duration(milliseconds: 500),
        ),
        GetPage(
          name: deliveryMap,
          page: () => DeliveryMap(),
          middlewares: [MyMiddleware()],
          transition: Transition.leftToRightWithFade,
          transitionDuration: Duration(milliseconds: 500),
        ),

      ];
}

class MyMiddleware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    print(page?.name);
    return super.onPageCalled(page);
  }
}
