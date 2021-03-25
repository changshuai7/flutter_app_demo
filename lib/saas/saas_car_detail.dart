import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/saas_car_detail_model.dart';
import 'saas_car_detail_banner.dart';
import 'saas_car_detail_bottom_btn.dart';
import 'saas_car_detail_business_info.dart';
import 'saas_car_detail_car_info.dart';
import 'saas_car_detail_car_info_des.dart';
import 'saas_car_detail_records.dart';

class SaasCarDetail extends StatelessWidget {
  final CarDetailBean carDetailProvider = CarDetailBean(
      selfCarImage: [
        SelfCarImageBean('名字1', [
          'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Ffsimg1.xbdedu.cn%2F2018%2F02%2Fimg_5a967f39c20e4.png&refer=http%3A%2F%2Ffsimg1.xbdedu.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1619101792&t=f0aaf231f2d639cef042cd1cd4272a36'
        ]),
        SelfCarImageBean('名字2', [
          'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fdpic.tiankong.com%2F0w%2Fri%2FQJ6164928400.jpg&refer=http%3A%2F%2Fdpic.tiankong.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1619101943&t=0a7853d5e3b4086c2068586096d48142'
        ])
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
      transportTestExpire: '2021年12月2021年12月2021年12月-测试溢出',
      compulsoryInsuranceExpire: '2022年5月',
      vehicleConditionDescription:
          '该车原厂原漆，外观无瑕疵，外观无更换；灯光系统正常；内饰整洁；电子系统正常；发动机、变速箱工况正常，怠速规律无抖动，转向灵活；综合车况优秀。',
      tags: [TagBean('1', '严选车'),TagBean('2', '店长推荐')],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true, //沉浸式状态栏
      body: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => carDetailProvider,
            ),
          ],
          child: Container(
            color: Color(0xFFF8F8FA),
            child: SingleChildScrollView(
              child: Column(
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
                  SizedBox(
                    height: 10,
                  ),
                  SaasCarDetailBottomBtn(),
                  SizedBox(
                    height: 10,
                  ),
                  RaisedButton(
                      child: Text('测试按钮'),
                      onPressed: () {
                        test();
                      })
                ],
              ),
            ),
          )),
    );
  }

  void test() {
    // carDetailProvider
    //     .selfCarImage[0]
    //     .value
    //     .add('https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fnimg.ws.126.net%2F%3Furl%3Dhttp%253A%252F%252Fdingyue.ws.126.net%252F2021%252F0323%252F2bf57078j00qqf5mj005ac001l600w5c.jpg%26thumbnail%3D650x2147483647%26quality%3D80%26type%3Djpg&refer=http%3A%2F%2Fnimg.ws.126.net&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1619103121&t=2f7c3855ddeb7cfb2c1612272a97d11b');
    //
    // carDetailProvider
    //     .selfCarImage
    //     .add(SelfCarImageBean('demo', [
    //       'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fnimg.ws.126.net%2F%3Furl%3Dhttp%253A%252F%252Fdingyue.ws.126.net%252F2021%252F0323%252F2bf57078j00qqf5mj005ac001l600w5c.jpg%26thumbnail%3D650x2147483647%26quality%3D80%26type%3Djpg&refer=http%3A%2F%2Fnimg.ws.126.net&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1619103121&t=2f7c3855ddeb7cfb2c1612272a97d11b'
    //     ]));
    //
    //
    // carDetailProvider
    //     .selfCarImage[0]
    //     .value = ['https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fnimg.ws.126.net%2F%3Furl%3Dhttp%253A%252F%252Fdingyue.ws.126.net%252F2021%252F0323%252F2bf57078j00qqf5mj005ac001l600w5c.jpg%26thumbnail%3D650x2147483647%26quality%3D80%26type%3Djpg&refer=http%3A%2F%2Fnimg.ws.126.net&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1619103121&t=2f7c3855ddeb7cfb2c1612272a97d11b'];
    //

    // carDetailProvider.auditStatus = '审核中';
    // carDetailProvider.sourceTags.add('hello');
    carDetailProvider.isContactOwner = true;
    carDetailProvider.tags.add(TagBean('id', '你好'));
    // carDetailProvider.title= '哈哈哈哈哈哈';
    carDetailProvider.update();
  }
}
