import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'config/routes.dart';
import 'constants/colors.dart';

void main() {
  // setPathUrlStrategy();
  runApp(const KaryanaWala());
}

class KaryanaWala extends StatelessWidget {
  const KaryanaWala({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Palette.myColors,
        visualDensity: VisualDensity.adaptivePlatformDensity,

      ),
      initialRoute: MyRoutes.getSplashRoute(),
      getPages: MyRoutes.appRoutes(),
    );
  }
}
