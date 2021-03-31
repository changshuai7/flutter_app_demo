import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'common/saas_car_detail_common_widget.dart';
import 'provider/saas_car_detail_model.dart';

///车辆业务信息数据
class SaasCarDetailBusinessInfo extends StatefulWidget {
  @override
  _SaasCarDetailBusinessInfoState createState() =>
      _SaasCarDetailBusinessInfoState();
}

class _SaasCarDetailBusinessInfoState extends State<SaasCarDetailBusinessInfo> {
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
      child: Column(
        children: [
          SourceTagsWidget(),
          InfoWidget(),
        ],
      ),
    );
  }
}

class SourceTagsWidget extends StatelessWidget {
  final _colorList = [
    {
      'textColor': Color(0xFFFF5F5F),
      'bgColor': Color(0xFFFFEAE0),
    },
    {
      'textColor': Color(0xFF3275FF),
      'bgColor': Color(0xFFE1ECFF),
    }
  ];

  List<SourceTag> _generateTags(List<String> sourceList) {
    List<SourceTag> list = [];
    for (int i = 0; i < sourceList.length; i++) {
      list.add(SourceTag(
        text: sourceList[i],
        textColor: _colorList[i % 2]['textColor'],
        bgColor: _colorList[i % 2]['bgColor'],
      ));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Selector<CarDetailBean, List<String>>(
      selector: (BuildContext context, CarDetailBean allData) {
        // 巨坑：切勿将共享数据中的引用类型数据直接返回。务必要重新构造数据。
        return allData.sourceTags.map((e) => e).toList();
      },
      builder: (BuildContext context, List<String> sourceList, Widget child) {
        print('SourceTagsWidget - Selector - Builder');
        return Container(
          width: double.infinity,
          child: Wrap(
            alignment: WrapAlignment.start,
            spacing: 5,
            runSpacing: 3,
            children: _generateTags(sourceList),
          ),
        );
      },
    );
  }
}

class SourceTag extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;

  SourceTag(
      {this.text = '',
      this.bgColor = Colors.orangeAccent,
      this.textColor = Colors.black});

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

class InfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CarDetailBean>(
      builder: (BuildContext context, CarDetailBean allData, Widget child) {
        print('InfoWidget - Consumer - Builder');

        return Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 标题

              Text(
                '${allData.title}',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(
                height: 10,
              ),

              ///Tag信息，位置信息
              Row(
                children: [
                  Expanded(child: TagsWidget(),),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_rounded,
                        color: Colors.orange,
                      ),
                      Text(
                        '${allData.city}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ), // TagsWidget(),
                ],
              ),
              SizedBox(
                height: 18,
              ),

              ///价格信息
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Text(
                            '${allData.showPrice}',
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Expanded(child: Text(
                            '万(展厅价)',
                            style:
                            TextStyle(color: Colors.orange, fontSize: 14),
                          ),),
                        ],
                      )),
                  Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Text(
                            '${allData.displayPrice}',
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Expanded(child: Text(
                            '万(人人车标价)',
                            style:
                            TextStyle(color: Colors.orange, fontSize: 14),
                          ),
                          ),

                        ],
                      )),
                ],
              ),
              SizedBox(
                height: 16,
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
                            child: TextItem('展示状态', '${allData.showStatus}')),
                        Expanded(
                            child: TextItem('交易状态', '${allData.tradeStatus}')),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child:
                                TextItem('归属评估', '${allData.inspectorName}')),
                        Expanded(
                            child: TextItem('绑定销售', '${allData.saleName}')),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        TextItem('车车号    ', '${allData.ownVehicleId}',itemValueIsExpanded: false,),
                        SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          child: Icon(
                            Icons.copy,
                            color: Colors.orange,
                            size: 14,
                          ),
                          onTap: () {
                            //复制操作
                            Clipboard.setData(ClipboardData(text: allData.ownVehicleId));
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        TextItem('车源编号', '${allData.rrcId}',itemValueIsExpanded: false,),
                        SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          child: Icon(
                            Icons.copy,
                            color: Colors.orange,
                            size: 14,
                          ),
                          onTap: () {
                            //复制操作
                            Clipboard.setData(ClipboardData(text: allData.rrcId));
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 10,
              ),

              ///底部按钮
              allData.isContactOwner
                  ? Container(
                      width: double.infinity,
                      height: 44,
                      child: FlatButton(
                        onPressed: () {
                          //TODO 联系车主网络请求
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.phone_forwarded,
                              color: Color(0xFFFFA14D),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '联系车主',
                              style: TextStyle(
                                color: Color(0xFFFFA14D),
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Color(0xFFFFA14D), width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    )
                  : Container(),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        );
      },
    );
  }
}




class TagsWidget extends StatelessWidget {

  List<Tag> _generateTags(List<String> tagList) {
    List<Tag> list = [];
    for (int i = 0; i < tagList.length; i++) {
      list.add(Tag(
        text: tagList[i],
        textColor: Color(0xFF90909E),
        bgColor: Color(0xFFF4F4F7),
      ));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Selector<CarDetailBean, List<String>>(
      selector: (BuildContext context, CarDetailBean allData) {
        // 巨坑：切勿将共享数据中的引用类型数据直接返回。务必要重新构造数据。
        return allData.tags.map((e) => e.name).toList();
      },
      builder: (BuildContext context, List<String> sourceList, Widget child) {
        print('TagsWidget - Selector - Builder');
        return Container(
          width: double.infinity,
          child: Wrap(
            alignment: WrapAlignment.start,
            spacing: 5,
            runSpacing: 3,
            children: _generateTags(sourceList),
          ),
        );
      },
    );
  }
}

class Tag extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;

  Tag(
      {this.text = '',
        this.bgColor = Colors.orangeAccent,
        this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.circular(3),
          ),
          color: this.bgColor),
      child: Text(
        this.text,
        textAlign: TextAlign.center,
        style: TextStyle(color: this.textColor, fontSize: 10),
      ),
    );
  }
}

