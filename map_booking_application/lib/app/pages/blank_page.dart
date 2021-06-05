import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

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
        child: Text("Error"),
      ),
    );
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
