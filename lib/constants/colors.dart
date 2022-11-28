import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor myColors = MaterialColor(
    0xff65737E, // 0% comes in here, this will be color picked if no shade is selected
    // when defining a Color property which does not require a swatch.
    <int, Color>{
      50: Color(0xffE8EBED), //10%
      100: Color(0xffD2D7DB), //20%
      200: Color(0xffBCC2C8), //30%
      300: Color(0xff9BA3AB), //40%
      400: Color(0xff7A8690), //50%
      500: Color(0xff65737E), //60%
      600: Color(0xff49535B), //70%
      700: Color(0xff373D43), //80%
      800: Color(0xff373D43), //90%
      900: Color(0xff1e2023), //100%
    },
  );
}


const primary = Color(0xff65737e);
const secondary = Color(0xff373D43);
const lightColor = Color(0xffBCC2C8);
const wWhiteColor = Colors.white;
const wDarkBlackColor = Colors.black;