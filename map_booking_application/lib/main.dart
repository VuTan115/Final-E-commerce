import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:map_booking_application/app/application.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:map_booking_application/infrastructure/repositories/authentication_repository.dart';
import 'infrastructure/utils/constance.dart';
import 'package:wemapgl/wemapgl.dart' as WEMAP;

import 'core/observers/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();

  WEMAP.Configuration.setWeMapKey(Constance.wemapAPIKEY);
  WEMAP.Configuration.setOpenWeatherKey(Constance.wemapAPIKEY);
  await Firebase.initializeApp();
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom, SystemUiOverlay.top]);

  runApp(Application());
}
