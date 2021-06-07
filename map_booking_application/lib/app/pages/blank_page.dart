import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:map_booking_application/app/pages/components/indication/progress_indicator.dart'
    as pi;
import 'package:map_booking_application/app/utils/media.dart';

class BlankPage extends StatefulWidget {
  final Logger logger = Logger('BlankPage');

  _BlankPageState createState() => _BlankPageState();
}

class _BlankPageState extends State<BlankPage> {
  late Timer _timer;

  final int _duration = 10; //seconds

  @override
  void initState() {
    super.initState();

    _onStartup();
  }

  @override
  Widget build(BuildContext context) {
    widget.logger.info('Blank');
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: Center(
        child: Column(
          children: [
            Text(
              "Blank Page",
              style: kLabelStyle,
            ),
            pi.ProgressIndicator(
              color: Color(0xFF00B3FF),
              size: 30,
            ),
          ],
        ),
      ),
    ));
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Future _onStartup() async {
    _timer = Timer(Duration(seconds: _duration), () {
      widget.logger.warning('The Blank page lasted more than $_duration seconds');
    });
  }
}
