import 'package:flutter/material.dart';
import 'package:flutter_app_demo/saas/provider/saas_car_detail_model.dart';
import 'package:flutter_app_demo/saas/saas_car_detail_banner.dart';
import 'package:flutter_app_demo/saas/saas_car_detail_business_info.dart';
import 'package:provider/provider.dart';

class SaasCarDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true, //沉浸式状态栏
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => CarDetailBean(
              selfCarImage: [
                SelfCarImageBean(
                    '名字1', ['https://www.itying.com/images/flutter/1.png']),
                SelfCarImageBean(
                    '名字2', ['https://www.itying.com/images/flutter/2.png'])
              ],
              sourceTags: ['人人车派单', '自建', '闪卖'],
              title: '宝骏-宝骏730 2014款 1.5L 手动标准型 5座',
              city: '北京',
              showPrice: '24.50',
              displayPrice: '40.00',
              showStatus: '未上架',
              tradeStatus: '在售',
              inspectorName: '喻华',
              saleName: '朱莉民',
              ownVehicleId: 'hello-world',
              rrcId: 'bj-123456',
              isContactOwner: true,
            ),
          ),
        ],
        child: Column(
          children: [
            SaasCarDetailBanner(),
            SaasCarDetailBusinessInfo(),
          ],
        ),
      ),
    );
  }
}
