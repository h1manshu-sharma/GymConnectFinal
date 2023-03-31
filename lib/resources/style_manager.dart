import 'package:flutter/material.dart';
import 'package:smart_home_app/resources/color_manager.dart';
import 'package:smart_home_app/resources/font_manager.dart';

class StyleManager {
  static const splashText1TextStyle = TextStyle(
    color: ColorManager.white,
    fontSize: FontSize.s40,
    fontWeight: FontWightManager.bold,
  );
  static final splashText2TextStyle = TextStyle(
    color: ColorManager.lighGrey,
    fontSize: FontSize.s18,
    fontWeight: FontWightManager.semiBold,
  );
}