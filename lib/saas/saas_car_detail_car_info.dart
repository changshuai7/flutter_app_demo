import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'common/saas_car_detail_common_widget.dart';
import 'provider/saas_car_detail_model.dart';

///车辆信息数据
class SaasCarDetailCarInfo extends StatefulWidget {
  @override
  _SaasCarDetailCarInfoState createState() => _SaasCarDetailCarInfoState();
}

class _SaasCarDetailCarInfoState extends State<SaasCarDetailCarInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          color: Colors.white),
      width: double.infinity,
      padding: EdgeInsets.all(16),
      child: Consumer<CarDetailBean>(
        builder: (BuildContext context, CarDetailBean allData, Widget child) {
          return Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 标题

                Text(
                  '车辆信息',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(
                  height: 15,
                ),

                ///标签卡
                Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  // height: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xfff8f8fb),
                        Colors.white,
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: TextItem('行程里程', '${allData.mileage}')),
                          Expanded(
                              child: TextItem(
                                  '上牌时间', '${allData.firstLicensedDate}')),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child:
                                  TextItem('过户次数', '${allData.transferTimes}')),
                          Expanded(
                              child:
                                  TextItem('上牌城市', '${allData.licenseCity}')),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child:
                                  TextItem('汽车排量', '${allData.displacement}')),
                          Expanded(
                              child:
                                  TextItem('出厂时间', '${allData.deliveryTime}')),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: TextItem(
                                  '年检到期', '${allData.transportTestExpire}')),
                          Expanded(
                              child: TextItem('强险过期',
                                  '${allData.compulsoryInsuranceExpire}')),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 44,
                  child: FlatButton(
                    onPressed: () {
                      //TODO 更多参数配置跳转
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '查看更多参数配置',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 14,
                          color: Color(0xFFD8DADF),
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Color(0xFFD8DADF), width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
