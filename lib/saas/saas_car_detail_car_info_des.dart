import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'common/saas_car_detail_common_widget.dart';
import 'provider/saas_car_detail_model.dart';

///车辆车况描述
class SaasCarDetailCarInfoDes extends StatefulWidget {
  @override
  _SaasCarDetailCarInfoDesState createState() =>
      _SaasCarDetailCarInfoDesState();
}

class _SaasCarDetailCarInfoDesState extends State<SaasCarDetailCarInfoDes> {
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
          print('SaasCarDetailCarInfoDes - Consumer - Builder');
          return Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 标题

                Text(
                  '车况描述',
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
                        Color(0xfffffaf8),
                        Colors.white,
                      ],
                    ),
                  ),
                  child: Text(allData.vehicleConditionDescription),
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
