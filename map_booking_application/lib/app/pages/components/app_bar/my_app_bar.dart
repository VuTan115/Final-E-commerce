import 'package:flutter/material.dart';
import 'package:map_booking_application/app/utils/media.dart';
import 'package:map_booking_application/app/utils/variables.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key, required AnimationController animController})
      : _animController = animController,
        super(key: key);
  final AnimationController _animController;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: _handleOpenDrawer,
      ),
      title: Text(
        "Home",
        style: kLabelStyle,
      ),
      centerTitle: true,
      titleSpacing: 0.0,
      elevation: 1.0,
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Colors.amber,
      brightness: Brightness.dark,
      actions: <Widget>[
        (false)
            ? SizedBox.shrink()
            : IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () => {},
              ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: Icon(
              Icons.notifications_none,
            ),
            onPressed: () => {},
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70);
  void _handleOpenDrawer() {
    GlobalKeys.mainScaffold.currentState!.openDrawer();
  }
}
