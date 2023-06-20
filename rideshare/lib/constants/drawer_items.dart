import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DrawerMenuItem {
  final Widget icon;
  final String title;
  final VoidCallback onTap;

  DrawerMenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });
}

final List<DrawerMenuItem> menuItems = <DrawerMenuItem>[
  DrawerMenuItem(
    icon: SvgPicture.asset('assets/images/edit.svg'),
    title: 'Edit Profile',
    onTap: () {
      // Handle edit profile tap
    },
  ),
  DrawerMenuItem(
    icon: SvgPicture.asset('assets/images/ride.svg'),
    title: 'Rides',
    onTap: () {
      // Handle rides tap
    },
  ),
  DrawerMenuItem(
    icon: SvgPicture.asset('assets/images/setting.svg'),
    title: 'Settings',
    onTap: () {
      // Handle settings tap
    },
  ),
  DrawerMenuItem(
    icon: SvgPicture.asset('assets/images/logout.svg'),
    title: 'Log Out',
    onTap: () {
      // Handle log out tap
    },
  ),
];
