import 'package:first_application/presentation/onboarding/onboarding.dart';

import 'package:first_application/presentation/resources/color_manager.dart';
import 'package:first_application/presentation/state_renderer/state_renderer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: ColorManager.primary),
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          body: StateRenderer(
        stateRendererType: StateRendererType.POPUP_LOADING_STATE,
        retryFunction: () {},
      )),
    );
  }
}
