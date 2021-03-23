import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'common/saas_car_detail_common_widget.dart';
import 'provider/saas_car_detail_model.dart';

///车辆信息数据
class SaasCarDetailBottomBtn extends StatefulWidget {
  @override
  _SaasCarDetailBottomBtnState createState() => _SaasCarDetailBottomBtnState();
}

class _SaasCarDetailBottomBtnState extends State<SaasCarDetailBottomBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 56,
      padding: EdgeInsets.fromLTRB(16, 5, 16, 5),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: InkWell(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.edit),
                    Text(
                      '放弃销售',
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
                onTap: () {
                  //TODO  放弃销售点击事件
                  print('放弃销售');
                },
              )),
          Expanded(
            flex: 1,
            child: RaisedButton(
              color: Color(0xFFFA8745),
              textColor: Colors.white,
              onPressed: () {
                //TODO  改价点击事件
                print('改价');
              },
              child: Text(
                '改价',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 1,
            child: RaisedButton(
              color: Color(0xFF58728D),
              textColor: Colors.white,
              onPressed: () {
                //TODO  编辑点击事件
                print('编辑');
              },
              child: Text(
                '编辑',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
