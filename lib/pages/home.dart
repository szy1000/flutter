import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:myapp/dao/home_dao.dart';
import 'package:myapp/model/common_model.dart';
import 'package:myapp/model/grid_nav_model.dart';
import 'package:myapp/model/sales_box_model.dart';
import 'package:myapp/widget/grid_nav.dart';
import 'package:myapp/widget/loading_container.dart';
import 'package:myapp/widget/local_nav.dart';
import 'package:myapp/widget/sales_box.dart';
import 'package:myapp/widget/sub_nav.dart';
import 'package:myapp/widget/webview.dart';

const APPBAR_SCROLL_OFFSET = 100;

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => new _HomePage();
}

class _HomePage extends State<HomePage> {
  double appBarAlpha = 0.0;
  String resultString = '';
  List<CommonModel> localNavList = [];
  List<CommonModel> bannerList = [];
  List<CommonModel> subNavList = [];
  bool _isLoading = true;
  GridNavModel gridNavModel;
  SalesBoxModel salesBoxModel;

  @override
  void initState() {
    super.initState();
    _handleRefresh();
  }

  Future<Null> _handleRefresh() async {
    HomeDao.fetch().then((value) {
      setState(() {
        localNavList = value.localNavList;
        gridNavModel = value.gridNav;
        subNavList = value.subNavList;
        bannerList = value.bannerList;
        salesBoxModel = value.salesBox;
        _isLoading = false;
      });
    }).catchError((e) {
      setState(() {
        _isLoading = false;
        resultString = e.toString();
      });
    });
    return null;
  }

  void _onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: LoadingContainer(
            isLoading: _isLoading,
            child: Stack(
              children: <Widget>[
                MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  // 监听滚动
                  child: RefreshIndicator(
                      onRefresh: _handleRefresh,
                      child: NotificationListener(
                          onNotification: (scrollNotification) {
                            if (scrollNotification
                                    is ScrollUpdateNotification &&
                                scrollNotification.depth == 0) {
                              _onScroll(scrollNotification.metrics.pixels);
                            }
                            return false;
                          },
                          child: ListView(
                            children: <Widget>[
                              Container(
                                height: 160.0,
                                child: Swiper(
                                  itemCount: bannerList.length,
                                  autoplay: true,
                                  pagination: SwiperPagination(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          CommonModel model = bannerList[index];
                                          return WebView(
                                            url: model.url,
                                            statusBarColor:
                                                model.statusBarColor,
                                            hideAppBar: model.hideAppBar,
                                          );
                                        }));
                                      },
                                      child: Image.network(
                                          bannerList[index].icon,
                                          fit: BoxFit.cover),
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
                                  child: LocalNav(localNavList: localNavList)),
                              Padding(
                                padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
                                child: GridNav(gridNavModel: gridNavModel),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
                                child: SubNav(subNavList: subNavList),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
                                child: SalesBox(salesBox: salesBoxModel),
                              ),
                            ],
                          ))),
                ),
                Opacity(
                  opacity: appBarAlpha,
                  child: Container(
                    height: 80.0,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Center(
                      child: Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Text('首页')),
                    ),
                  ),
                )
              ],
            )));
  }
}
