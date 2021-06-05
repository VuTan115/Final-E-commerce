import 'package:flutter/material.dart';
import 'package:map_booking_application/app/pages/components/indication/progress_indicator.dart'
    as pi;

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: pi.ProgressIndicator()),
    );
  }
}
