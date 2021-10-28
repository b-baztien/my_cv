import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationModel {
  String title;
  IconData icon;

  NavigationModel({required this.title, required this.icon});
}

List<NavigationModel> navigationItems = [
  NavigationModel(title: "About me", icon: FontAwesomeIcons.userAlt),
  NavigationModel(title: "My skill", icon: FontAwesomeIcons.book),
  NavigationModel(title: "Experience", icon: FontAwesomeIcons.userEdit),
  NavigationModel(title: "Contact me", icon: FontAwesomeIcons.solidCommentDots),
];
