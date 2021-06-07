import 'package:flutter/material.dart';
import 'package:map_booking_application/app/widgets/background.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_booking_application/domain/blocs/components/authentication/authentication_bloc.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          CreatDrawerHeader(),
          CreatDrawerItem(icon: Icons.contacts, text: 'Hoạt động', onTap: () {}),
          Divider(),
          CreatDrawerItem(icon: Icons.collections_bookmark, text: 'Thống kê', onTap: () {}),
          Divider(),
          CreatDrawerItem(icon: Icons.help_outline, text: 'Trợ giúp', onTap: () {}),
          CreatDrawerItem(icon: Icons.bug_report, text: 'Báo cáo', onTap: () {}),
          CreatDrawerItem(icon: Icons.settings, text: 'Cài đặt', onTap: () {}),
          CreatDrawerItem(
              icon: Icons.logout_outlined,
              text: 'Đăng xuất ',
              onTap: () {
                context.read<AuthenticationBloc>().add(AuthenticationLoggedOut());
              }),
          ListTile(
            title: Text('Version 1.0 - Power by Tan'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class CreatDrawerHeader extends StatelessWidget {
  const CreatDrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFD0D313),
              Color(0xFFDDE047),
              Color(0xFFD5B710),
              Color(0xFFF5A30A),
            ],
            stops: [0.1, 0.4, 0.7, 0.9],
          ),
        ),
        child: Stack(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.blueAccent,
                radius: 50,
                child: Image.asset(
                  "assets/images/profile.png",
                  fit: BoxFit.fill,
                  height: 100,
                  width: 100,
                  scale: 1,
                ),
              )
            ],
          ),
          Positioned(
              bottom: 12.0,
              left: 90,
              child: Container(
                child: Row(
                  textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Vũ Cao Tân',
                        style: TextStyle(
                            color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.w600)),
                  ],
                ),
              )),
        ]));
  }
}

class CreatDrawerItem extends StatelessWidget {
  const CreatDrawerItem(
      {Key? key, required IconData icon, required String text, required GestureTapCallback onTap})
      : _icon = icon,
        _text = text,
        _onTap = onTap,
        super(key: key);
  final IconData _icon;
  final String _text;
  final GestureTapCallback _onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(_icon, color: Colors.black87.withOpacity(0.65)),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              _text,
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
      onTap: _onTap,
    );
  }
}
