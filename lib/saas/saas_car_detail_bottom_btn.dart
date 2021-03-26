import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/saas_car_detail_model.dart';

///车辆信息数据
class SaasCarDetailBottomBtn extends StatefulWidget {
  @override
  _SaasCarDetailBottomBtnState createState() => _SaasCarDetailBottomBtnState();
}

class BottomEnable {
  bool canChangePrice; //是否可以改价
  bool canEdit; //是否可以编辑
  bool canClosingDeal; //是否可以成交
  bool canAbandonSale; //是否可以放弃销售
  bool canTransferCar; //是否可以转车
  bool canPurchaseInfo; //是否可以采购
  bool canPublish; //是否可以上架

  BottomEnable({
    this.canChangePrice = true,
    this.canEdit = true,
    this.canClosingDeal = true,
    this.canAbandonSale = true,
    this.canTransferCar = true,
    this.canPurchaseInfo = true,
    this.canPublish = true,
  });

  @override
  bool operator ==(Object other) {
    if (other is BottomEnable) {
      if (this.canChangePrice == other.canChangePrice &&
          this.canEdit == other.canEdit &&
          this.canClosingDeal == other.canClosingDeal &&
          this.canAbandonSale == other.canAbandonSale &&
          this.canTransferCar == other.canTransferCar &&
          this.canPurchaseInfo == other.canPurchaseInfo &&
          this.canPublish == other.canPublish) {
        return true;
      }
    }
    return false;
  }

  @override
  int get hashCode => 1000;
}

class _SaasCarDetailBottomBtnState extends State<SaasCarDetailBottomBtn> {
  @override
  Widget build(BuildContext context) {
    return Selector<CarDetailBean, BottomEnable>(
      selector: (BuildContext context, CarDetailBean allValue) {
        //TODO  需要根据接口来确定展示规则
        return BottomEnable();
      },
      shouldRebuild: (BottomEnable pre, BottomEnable next) => pre != next,
      builder: (BuildContext context, BottomEnable bottomEnable, Widget child) {
        print('SaasCarDetailBottomBtn - Selector - Builder');
        return Container(
          color: Colors.white,
          height: 56,
          padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    /// 改价
                    Expanded(
                      child: BottomItem(
                        Icon(
                          Icons.account_tree_rounded,
                          color: BottomItem.enableColor,
                        ),
                        Icon(
                          Icons.account_tree_rounded,
                          color: BottomItem.disableColor,
                        ),
                        '改价',
                        onTap: () {
                          _onEventChangePrice(context);
                        },
                        enable: bottomEnable.canChangePrice,
                      ),
                    ),

                    /// 编辑
                    Expanded(
                      child: BottomItem(
                        Icon(
                          Icons.edit,
                          color: BottomItem.enableColor,
                        ),
                        Icon(
                          Icons.edit,
                          color: BottomItem.disableColor,
                        ),
                        '编辑',
                        onTap: () {
                          _onEventEdit(context);
                        },
                        enable: bottomEnable.canEdit,
                      ),
                    ),

                    /// 成交
                    Expanded(
                      // child: BottomIcon(Image.asset('images/2.0x/a.png'), 'world'),
                      child: BottomItem(
                        Icon(
                          Icons.handyman,
                          color: BottomItem.enableColor,
                        ),
                        Icon(
                          Icons.handyman,
                          color: BottomItem.disableColor,
                        ),
                        '成交',
                        onTap: () {
                          _onEventClosingDeal(context);
                        },
                        enable: bottomEnable.canClosingDeal,
                      ),
                    ),

                    /// 更多
                    Expanded(
                      child: PopupMenuButton<BottomPopItemType>(
                        tooltip: '更多',
                        //offset: Offset(0,-190),
                        shape: RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        //child的点击事件必须屏蔽，否则无法唤起PopupMenu
                        child: BottomItem(
                          Icon(
                            Icons.more_horiz,
                            color: BottomItem.enableColor,
                          ),
                          Icon(
                            Icons.more_horiz,
                            color: BottomItem.enableColor,
                          ),
                          '更多',
                          textColor: BottomItem.enableColor,
                          disableTextColor: BottomItem.enableColor,
                          enable: false,
                        ),
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuItem<BottomPopItemType>>[
                          /// 放弃销售
                          bottomEnable.canAbandonSale
                              ? PopupMenuItem<BottomPopItemType>(
                                  value: BottomPopItemType.AbandonSale,
                                  child: BottomPopItem(
                                    Icon(Icons.sms_failed_outlined,
                                        color: BottomItem.enableColor),
                                    '放弃销售',
                                  ),
                                )
                              : null,

                          /// 转车
                          bottomEnable.canTransferCar
                              ? PopupMenuItem<BottomPopItemType>(
                                  value: BottomPopItemType.TransferCar,
                                  child: BottomPopItem(
                                    Icon(Icons.transform,
                                        color: BottomItem.enableColor),
                                    '转车',
                                  ),
                                )
                              : null,

                          /// 采购信息
                          bottomEnable.canPurchaseInfo
                              ? PopupMenuItem<BottomPopItemType>(
                                  value: BottomPopItemType.PurchaseInfo,
                                  child: BottomPopItem(
                                    Icon(Icons.widgets,
                                        color: BottomItem.enableColor),
                                    '采购信息',
                                  ),
                                )
                              : null,
                        ],
                        onSelected: (BottomPopItemType value) {
                          if (value == BottomPopItemType.AbandonSale) {
                            _onEventAbandonSale(context);
                          } else if (value == BottomPopItemType.TransferCar) {
                            _onEventTransferCar(context);
                          } else if (value == BottomPopItemType.PurchaseInfo) {
                            _onEventPurchaseInfo(context);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: double.infinity,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      side: BorderSide.none,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    color: Color(0xFFFA8745),
                    textColor: Colors.white,
                    onPressed: bottomEnable.canPublish
                        ? () {
                            _onEventEventPublish(context);
                          }
                        : null,
                    child: Text(
                      '上架',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  //TODO 各类事件完成一下
  //改价事件
  void _onEventChangePrice(BuildContext context) {
    print('改价');
  }

  //编辑事件
  void _onEventEdit(BuildContext context) {
    print('编辑');
  }

  //成交事件
  void _onEventClosingDeal(BuildContext context) {
    print('成交');
  }

  //放弃销售事件
  void _onEventAbandonSale(BuildContext context) {
    print('放弃销售');
  }

  //转车事件
  void _onEventTransferCar(BuildContext context) {
    print('转车');
  }

  //采购信息事件
  void _onEventPurchaseInfo(BuildContext context) {
    print('采购信息');
  }

  //上架事件
  void _onEventEventPublish(BuildContext context) {
    print('上架');
  }
}

const enableColorInt = 0xFF7A7A85;
const disableColorInt = 0x667A7A85;

/// 底部按钮Item
class BottomItem extends StatelessWidget {
  static Color enableColor = Color(enableColorInt);
  static Color disableColor = Color(disableColorInt);

  final Widget img;
  final Widget disableImg;
  final String text;
  final Color textColor;
  final Color disableTextColor;
  final void Function() onTap;
  final bool enable;

  BottomItem(
    this.img,
    this.disableImg,
    this.text, {
    this.onTap,
    this.enable = true,
    this.textColor = const Color(enableColorInt),
    this.disableTextColor = const Color(disableColorInt),
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      disabledColor: Colors.white,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 22,
            height: 22,
            child: enable ? this.img : this.disableImg,
          ),
          Text(
            '${this.text}',
            style: TextStyle(
                fontSize: 10, color: enable ? textColor : disableTextColor),
          ),
        ],
      ),
      onPressed: !enable ? null : (onTap == null ? () {} : this.onTap),
    );
  }
}

/// 更多的pop item
class BottomPopItem extends StatelessWidget {
  final Widget img;
  final String text;

  BottomPopItem(this.img, this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 22,
          height: 22,
          child: this.img,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          '${this.text}',
          style: TextStyle(fontSize: 12, color: BottomItem.enableColor),
        ),
      ],
    );
  }
}
/// 更多的pop item 的类型
enum BottomPopItemType {
  AbandonSale, //放弃销售
  TransferCar, //转车
  PurchaseInfo, //采购
}
