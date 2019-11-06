import 'package:flutter/material.dart';
import 'package:sc_app/styles/app_colors.dart';

class Style {
  static final baseTextStyle = const TextStyle(fontFamily: 'Raleway', 
          fontWeight: FontWeight.bold,);
  static final smallTextStyle = commonTextStyle.copyWith(
    fontSize: 12.0,
  );

  static final commonTextStyle = baseTextStyle.copyWith(
      color: const Color(0xffb6b2df),
      fontSize: 14.0,
      fontWeight: FontWeight.w400);

  static final titleTextStyle = baseTextStyle.copyWith(
      color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.w600);

  static final headerTextStyle = baseTextStyle.copyWith(
      color: new Color(0xff00c6ff),
      fontSize: 20.0,
      fontWeight: FontWeight.w400
      );

  static final bigButtonTextStyle = baseTextStyle.copyWith(
          color: Colors.white, fontSize: 20.0,
  );

  static final appNameTextStyle = baseTextStyle.copyWith(
          color: Colors.white, fontSize: 26.0,
  );

  static final normalTextStyle = baseTextStyle.copyWith(
          color: Colors.black87, fontSize: 19.0,
          
  );
  static final welcomeTextStyle = TextStyle(fontFamily: 'WorkSansBold', 
          fontWeight: FontWeight.bold,
          color: AppColors.green, fontSize: 25.0,
          
  );

  //FORM STYLES
  static final formFieldStyle = baseTextStyle.copyWith(
          color: Colors.black, fontSize: 19.0,
          

  //INPUT DECORATION
  );
  


}
