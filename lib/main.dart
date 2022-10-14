import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:karyana_wala/providers/auth_provider.dart';
import 'package:karyana_wala/providers/location_provider.dart';
import 'package:provider/provider.dart';
import 'config/routes.dart';
import 'constants/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => LocationProvider(),
        ),
      ],
      child: KaryanaWala(),
    ),
  );
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
