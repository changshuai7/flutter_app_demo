import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/saas_car_detail_model.dart';
import 'saas_car_detail_banner.dart';
import 'saas_car_detail_business_info.dart';
import 'saas_car_detail_car_info.dart';
import 'saas_car_detail_car_info_des.dart';
import 'saas_car_detail_records.dart';

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
                  sourceTags: [
                    '人人车派单',
                    '自建',
                    '闪卖'
                  ],
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
                  mileage: '5万公里',
                  firstLicensedDate: '2012年9月',
                  transferTimes: '10次',
                  licenseCity: '北京',
                  displacement: '1.0T',
                  deliveryTime: '2010年9月',
                  transportTestExpire: '2021年12月',
                  compulsoryInsuranceExpire: '2022年5月',
                  vehicleConditionDescription:'该车原厂原漆，外观无瑕疵，外观无更换；灯光系统正常；内饰整洁；电子系统正常；发动机、变速箱工况正常，怠速规律无抖动，转向灵活；综合车况优秀。'
              ),
            ),
          ],
          child: Container(
            color: Color(0xFFF8F8FA),
            child: ListView(
              children: [
                SaasCarDetailBanner(),
                SaasCarDetailBusinessInfo(),
                SizedBox(
                  height: 10,
                ),
                SaasCarDetailQueryRecords(),
                SizedBox(
                  height: 10,
                ),
                SaasCarDetailCarInfo(),
                SizedBox(
                  height: 10,
                ),
                SaasCarDetailCarInfoDes(),
              ],
            ),
          )),
    );
  }
}
