// @dart=2.9
import 'package:bwa_kos_course/pages/splash.dart';
import 'package:bwa_kos_course/providers/space_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => SpaceProviders(),
      child: MaterialApp(
      home: SplashPage(),
    )
    );
  }
}
