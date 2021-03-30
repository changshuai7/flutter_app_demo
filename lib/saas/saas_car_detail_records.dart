import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'common/saas_car_detail_common_widget.dart';
import 'provider/saas_car_detail_model.dart';
import 'web/common_web_view.dart';

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
            child: RecordsItemWidget(
              '车源操作记录',
              Icon(
                Icons.margin,
                color: Colors.orangeAccent,
              ),
              onTap: () {
                //TODO 导航到新路由，打开H5
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CommonWebView(
                      'https://www.jd.com',
                      displayAppBar: true,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: RecordsItemWidget(
              '车主/价格/证照',
              Icon(
                Icons.margin,
                color: Colors.orangeAccent,
              ),
              onTap: () {
                //TODO 导航到新路由，打开H5
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CommonWebView(
                      'https://www.renrenche.com',
                      displayAppBar: true,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class RecordsItemWidget extends StatelessWidget {
  final String title;
  final Widget img;
  final void Function() onTap;

  RecordsItemWidget(this.title, this.img, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
            Text(this.title),
            Expanded(
              child: Container(
                width: 22,
                height: 22,
                child: this.img,
              ),
            ),
          ],
        ),
      ),
      onTap: this.onTap,
    );
  }
}
