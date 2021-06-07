import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:map_booking_application/app/utils/media.dart';

class MyBottomNavigator extends StatefulWidget {
  const MyBottomNavigator({Key? key, required PageController pageController})
      : _pageController = pageController,
        super(key: key);
  final PageController _pageController;

  @override
  _MyBottomNavigatorState createState() => _MyBottomNavigatorState();
}

class _MyBottomNavigatorState extends State<MyBottomNavigator> {
  int _selectedIndex = 0;

  final List mainViews = const [
    Text("Home"),
    Text("Home"),
    Text("Home"),
    Text("Home"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 70,
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber,
        selectedLabelStyle: kLabelStyle,
        unselectedItemColor: Color.fromRGBO(0, 0, 0, 0.75),
        unselectedLabelStyle: kLabelStyle,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 1 * 24,
              height: 1 * 24,
              child: Icon(Icons.home),
            ),
            // activeIcon: SizedBox(
            //   width: 1 * 24,
            //   height: 1 * 24,
            //   child: Icon(Icons.home),
            // ),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 1 * 24,
              height: 1 * 24,
              child: Icon(Icons.directions_bus_outlined),
            ),
            // activeIcon: SizedBox(
            //   width: 1 * 24,
            //   height: 1 * 24,
            //   child: Icon(Icons.directions_bus_filled),
            // ),
            label: 'Di chuyển',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 1 * 24,
              height: 1 * 24,
              child: Icon(Icons.shopping_bag_outlined),
            ),
            // activeIcon: SizedBox(
            //   width: 1 * 24,
            //   height: 1 * 24,
            //   child: Icon(Icons.shopping_bag_rounded),
            // ),
            label: 'Mua bán',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 1 * 24,
              height: 1 * 24,
              child: Icon(Icons.place),
            ),
            // activeIcon: SizedBox(
            //   width: 1 * 24,
            //   height: 1 * 24,
            //   child: Icon(Icons.place),
            // ),
            label: 'Địa điểm',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 1 * 24,
              height: 1 * 24,
              child: Icon(Icons.person_rounded),
            ),
            // activeIcon: SizedBox(
            //   width: 1 * 24,
            //   height: 1 * 24,
            //   child: Icon(Icons.person_outline_outlined),
            // ),
            label: 'Cá nhân',
          ),
        ],
        onTap: (index) {
          _handleBarItemTap(index);
        },
      ),
    );
  }

  void _handleBarItemTap(int index) {
    print('_handleBarItemTap');
    print(index);
    setState(() {
      _selectedIndex = index;
    });
  }
}
