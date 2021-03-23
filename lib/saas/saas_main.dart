import 'package:flutter/material.dart';

import 'saas_car_detail.dart';

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
