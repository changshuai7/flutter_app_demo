import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';

import 'provider/saas_car_detail_model.dart';

/// Banner Swiper
/// 用于展示saas详情页顶部轮播图
class SaasCarDetailBanner extends StatefulWidget {
  @override
  _SaasCarDetailBannerState createState() => _SaasCarDetailBannerState();
}

class _SaasCarDetailBannerState extends State<SaasCarDetailBanner> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Stack(
        children: [
          /// 第一层：轮播
          Align(
            alignment: Alignment.center,
            child: BannerWidget(),
          ),

          /// 第二层，审核状态的蒙层
          Align(
            alignment: Alignment.center,
            child: AuditStatusWidget(),
          ),

          /// 第三层：顶部返回按钮
          Align(
            alignment: Alignment(-1.0, -0.8),
            child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).maybePop();
                }),
          )
        ],
      ),
    );
  }
}

class BannerImg {
  String name;// 名称
  String url; // 图片地址

  BannerImg(this.name, this.url);

  @override
  bool operator ==(Object other) {
    if (other is BannerImg) {
      return this.name == other.name && this.url == other.url;
    } else {
      return false;
    }
  }

  @override
  int get hashCode => name.hashCode + url.hashCode;
}

class BannerWidget extends StatelessWidget {

  /// 获取所有banner图片地址
  List<BannerImg> _getAllBannerImgList(List<SelfCarImageBean> selfCarImage) {
    List<BannerImg> result = [];
    selfCarImage?.forEach((SelfCarImageBean element) {
      element?.value?.forEach((s) {
        result.add(BannerImg(element.name, s));
      });
    });
    return result;
  }

  /// 比较两个List<BannerImg>是否相等
  bool _bannerImgListIsEqual(List<BannerImg> pre, List<BannerImg> next) {
    if (pre == null) return next == null;
    if (next == null) return pre == null;
    if (pre.length != next.length) return false;
    if (pre.length == 0 || next.length == 0) return true; //长度为0，则一定等

    //----  至此 二者length 等，且length > 0 ----//
    bool isEqual = true;
    for (var i = 0; i < pre.length; i++) {
      if (pre[i] != next[i]) {
        isEqual = false;
        break;
      }
    }
    return isEqual;
  }

  @override
  Widget build(BuildContext context) {
    return Selector<CarDetailBean, List<BannerImg>>(
        selector: (context, allData) =>
            _getAllBannerImgList(allData.selfCarImage),
        shouldRebuild: (List<BannerImg> previous, List<BannerImg> next) {
          return !_bannerImgListIsEqual(previous, next);
        },
        builder: (BuildContext context, List<BannerImg> bannerImgList,
            Widget child) {
          print('BannerWidget - Selector - Builder');
          return Swiper(
            key: UniqueKey(),
            pagination: SwiperPagination(
                alignment: Alignment.bottomRight,
                builder: CarDetailBannerFractionPaginationBuilder()),
            loop: true,
            autoplay: true,
            itemCount: bannerImgList.length,
            itemBuilder: (context, index) {
              return Container(
                  child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Image.network(
                        bannerImgList[index].url,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ));
            },
            onTap: (index) {
              print('这是第 $index 张轮播图，图片地址为:${bannerImgList[index].url}');
              //TODO 点击事件，跳转到图片查看器
            },
          );
        });
  }
}

class AuditStatusWidget extends StatelessWidget {
  //是否审核通过
  bool _isAuditPass(String auditStatus) {
    //TODO 审核通过或者审核中，是否要通过判空来做？这样的方式可能会发生变化
    return !(auditStatus != null && auditStatus.length > 0);
  }

  @override
  Widget build(BuildContext context) {
    return Selector<CarDetailBean, String>(
      selector: (BuildContext context, CarDetailBean allData) =>
          allData.auditStatus,
      builder: (BuildContext context, String auditStatus, Widget child) {
        print('AuditStatusWidget - Selector - Builder');
        //阻止焦点事件拦截
        return IgnorePointer(
          child: _isAuditPass(auditStatus)
              ? Container()
              : Container(
                  color: Color(0x51767272),
                  width: double.infinity,
                  height: double.infinity,
                  child: Center(
                    child: Container(
                      alignment: Alignment.center,
                      width: 80,
                      height: 80,
                      decoration: ShapeDecoration(
                          shape: CircleBorder(
                            side: BorderSide.none,
                          ),
                          color: Color(0x97050505)),
                      child: Text(
                        auditStatus,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}

//顶部轮播控制器(SwiperController)
class CarDetailBannerFractionPaginationBuilder extends SwiperPlugin {
  @override
  Widget build(BuildContext context, SwiperPluginConfig config) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 3, 5, 3),
      decoration: ShapeDecoration(
          shape: StadiumBorder(
            side: BorderSide.none,
          ),
          color: Color(0x77050505)),
      child: Text(
        '${config.activeIndex + 1}/${config.itemCount}',
        style: TextStyle(fontSize: 11, color: Colors.white),
      ),
    );
  }
}
