// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'colors.dart';

class MyTextStyles{
//white colors ******************************
  static TextStyle sectionTitleLargeWhite = TextStyle(
    color: Colors.white,
    fontSize: 36,
    fontWeight: FontWeight.bold,
  );
  static TextStyle sectionTitleSmallWhite = TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );


  static TextStyle headingLargeWhite = TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold
  );

  static TextStyle headingSmallWhite = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold
  );

  static TextStyle subHeadingWhite = TextStyle(
      color: Colors.white, fontSize: 14);

  static TextStyle regularWhite = TextStyle(
    color: Colors.white, fontSize: 12,);

  static TextStyle xSmallWhite = TextStyle(
      color: Colors.white, fontSize: 10);


  //Primary Colors********************************
  static TextStyle sectionTitleLargePrimary = TextStyle(
      color: secondary,
      fontSize: 36,
      fontWeight: FontWeight.bold);
  static TextStyle sectionTitleSmallPrimary = TextStyle(
      color: secondary,
      fontSize: 24,
      fontWeight: FontWeight.bold);



  static TextStyle headingLargePrimary = TextStyle(
    fontSize: 20,
    color: secondary,
    fontWeight: FontWeight.bold,
  );

  static TextStyle headingSmallPrimary =TextStyle(
    fontSize: 16,
    color: secondary,
    fontWeight: FontWeight.bold,
  );

  static TextStyle subHeadingPrimary = TextStyle(
    color: secondary, fontSize: 14,
  );

  static TextStyle regularPrimary =TextStyle(
    fontSize: 12,
    color: secondary,
  );

  static TextStyle xSmallPrimary =TextStyle(
    fontSize: 12,
    color: secondary,
  );



// black ***********************

  static TextStyle headingLargeBlack = TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold
  );

  static TextStyle headingSmallBlack = TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.bold
  );

  static TextStyle subHeadingBlack = TextStyle(
    color: Colors.black,
    fontSize: 14,
  );

  static TextStyle regularBlack = TextStyle(
      color: Colors.black, fontSize: 12);

  static TextStyle xSmallBlack = TextStyle(
      color: Colors.black, fontSize: 10);
//grey*************************************





//button Styles *********************************
  static ButtonStyle selectPlan = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.white),
      padding: MaterialStateProperty.all( EdgeInsets.symmetric(horizontal: 30, vertical: 15),)
  );
}

