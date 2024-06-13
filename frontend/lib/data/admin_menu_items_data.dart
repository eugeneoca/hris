import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/model/navigation_item_model.dart';

class AdminMenuItemsData {
  final adminMenuItemsData = [
    NavigationItemModel(
        title: "Administration", icon: const Icon(FontAwesomeIcons.userLock)),
    NavigationItemModel(
        title: "Employees", icon: const Icon(FontAwesomeIcons.users))
  ];
}
