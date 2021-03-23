import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'common/saas_car_detail_common_widget.dart';
import 'provider/saas_car_detail_model.dart';

///车辆信息数据
class SaasCarDetailQueryRecords extends StatefulWidget {
  @override
  _SaasCarDetailQueryRecordsState createState() =>
      _SaasCarDetailQueryRecordsState();
}

class _SaasCarDetailQueryRecordsState extends State<SaasCarDetailQueryRecords> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          color: Colors.white),
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: InkWell(
                child: Container(
                  height: 60,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Color(0xFFD8DADF), width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      color: Colors.white),
                  child: Row(
                    children: [
                      Text('车源操作记录'),
                      Expanded(
                          child: Icon(
                        Icons.margin,
                        color: Colors.orangeAccent,
                      )),
                    ],
                  ),
                ),
                onTap: () {
                  //TODO 跳转到车源操作记录页面
                  print('跳转到车源操作记录页面');
                },
              )),
          SizedBox(
            width: 10,
          ),
          Expanded(
              flex: 1,
              child: InkWell(
                child: Container(
                  height: 60,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Color(0xFFD8DADF), width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      color: Colors.white),
                  child: Row(
                    children: [
                      Text('车主/价格/证照'),
                      Expanded(
                          child: Icon(
                        Icons.widgets_rounded,
                        color: Colors.orangeAccent,
                      )),
                    ],
                  ),
                ),
                onTap: () {
                  //TODO 跳转到车主、价格证照页面
                  print('跳转到车主、价格证照页面');
                },
              )),
        ],
      ),
    );
  }
}
