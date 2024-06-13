import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationItemModel {
  String title;
  Icon icon;

  NavigationItemModel(
      {this.title = "", this.icon = const Icon(FontAwesomeIcons.a)});
}
