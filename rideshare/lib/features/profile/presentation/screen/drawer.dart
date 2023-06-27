import 'package:flutter/material.dart';
import 'package:rideshare/features/profile/presentation/screen/passenger_profile.dart';

import '../../../../constants/drawer_items.dart';
import '../widgets/drawer_head.dart';
import '../widgets/get_widget.dart';
import '../widgets/logout_dialog.dart';

class MyHomePageDrawer extends StatefulWidget {
  const MyHomePageDrawer({
    Key? key,

  }) : super(key: key);

  @override
  State<MyHomePageDrawer> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePageDrawer> {
  Future<void> navigateToNewPage() async {
    Navigator.push(
      context,
      MaterialPageRoute<Widget>(
        builder: (BuildContext context) => const ProfilePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFEFEFFA),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: menuItems.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return const DrawerHeadWidget();
          }

          final DrawerMenuItem menuItem = menuItems[index - 1];

          switch (menuItem.title) {
            case 'Log out':
              return getWidget(menuItem, () {
                LogoutDialog.show(context);
              });
            case 'Rides':
              return getWidget(menuItem, () {});
            case 'Settings':
              return getWidget(menuItem, () {});
            case 'Edit Profile':
              return getWidget(menuItem, () {});
            default:
              return getWidget(menuItem, () {}); // Placeholder onTap function
          }
        },
      ),
    );
  }
}
