import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:map_booking_application/app/pages/components/app_bar/my_app_bar.dart';
import 'package:map_booking_application/app/pages/components/app_drawer/app_drawer.dart';
import 'package:map_booking_application/app/pages/components/bottom_navigator/bottom_navigator.dart';
import 'package:map_booking_application/app/utils/variables.dart';
import 'package:map_booking_application/core/maps/map_helper.dart';
import 'package:map_booking_application/core/wemap%20template/full_map.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _animController = AnimationController(vsync: this, duration: Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: GlobalKeys.mainScaffold,
      appBar: MyAppBar(
        animController: _animController,
      ),
      body: FullMap(),
      drawer: AppDrawer(),
      bottomNavigationBar: MyBottomNavigator(
        pageController: _pageController,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        tooltip: "get my location",
        child: Icon(
          Icons.location_on_rounded,
          color: Colors.red,
          size: 30,
        ),
        onPressed: getCurrentPosition,
      ),
    );
  }

  void getCurrentPosition() async {
    final Position _myLocation = await MapHelper.determinePosition();
    print(_myLocation);
  }
}
