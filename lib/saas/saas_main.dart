import 'package:flutter/material.dart';
import 'package:flutter_app_demo/saas/saas_car_detail.dart';

main() {
  runApp(SaasApp());
}

class SaasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SaasCarDetail(),
    );
  }
}
