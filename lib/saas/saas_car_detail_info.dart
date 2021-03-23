import 'package:flutter/material.dart';
import 'package:flutter_app_demo/saas/provider/saas_car_detail_model.dart';
import 'package:provider/provider.dart';

///车辆信息数据
class SaasCarDetailInfo extends StatefulWidget {
  @override
  _SaasCarDetailInfoState createState() => _SaasCarDetailInfoState();
}

class _SaasCarDetailInfoState extends State<SaasCarDetailInfo> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CarDetailBean>(
      builder: (BuildContext context, CarDetailBean allData, Widget child) {
        return Container(
          color: Colors.grey,
          width: double.infinity,
          height: 362,
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              SourceTags(),
            ],
          ),
        );
      },
    );
  }
}

class SourceTags extends StatelessWidget {
  List<SourceTagBtn> _generateTags(List<String> sourceList) {
    return sourceList.map((e) => SourceTagBtn(text: e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<CarDetailBean, List<String>>(
      selector: (BuildContext context, CarDetailBean allData) {
        return allData.sourceTag;
      },
      builder: (BuildContext context, List<String> sourceList, Widget child) {
        return Container(
          width: double.infinity,
          child: Wrap(
            alignment: WrapAlignment.start,
            spacing: 5,
            children: _generateTags(sourceList),
          ),
        );

      },
    );
  }
}

class SourceTagBtn extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;

  SourceTagBtn(
      {this.text = '',
      this.bgColor = const Color(0xFFFFEAE0),
      this.textColor = const Color(0xFFFF5F5F)});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
      decoration: ShapeDecoration(
          shape: StadiumBorder(
            side: BorderSide.none,
          ),
          color: this.bgColor),
      child: Text(
        this.text,
        textAlign: TextAlign.center,
        style: TextStyle(color: this.textColor, fontSize: 11),
      ),
    );
  }
}
