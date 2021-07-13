import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

const APPBAR_SCROLL_OFFSET = 100;

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => new _HomePage();
}

class _HomePage extends State<HomePage> {
  List _list = [
    'https://img30.360buyimg.com/pop/s1180x940_jfs/t1/181096/22/13276/44005/60e6afeeE3c767c78/fdd374c62521fb21.jpg.webp',
    'https://imgcps.jd.com/ling4/100019386660/5Lqs6YCJ5aW96LSn/5L2g5YC85b6X5oul5pyJ/p-5bd8253082acdd181d02fa22/8d4968e4/cr/s/q.jpg',
    'https://imgcps.jd.com/ling4/100009077475/5Lqs6YCJ5aW96LSn/5L2g5YC85b6X5oul5pyJ/p-5bd8253082acdd181d02f9d0/47272e7d/cr/s/q.jpg',
  ];
  double appBarAlpha = 0.0;

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
        body: Stack(
          children: <Widget>[
            MediaQuery.removePadding(
                removeTop: true,
                context: context,
                // 监听滚动
                child: NotificationListener(
                    onNotification: (scrollNotification) {
                      if (scrollNotification is ScrollUpdateNotification &&
                          scrollNotification.depth == 0) {
                        _onScroll(scrollNotification.metrics.pixels);
                      }
                    },
                    child: ListView(
                      children: <Widget>[
                        Container(
                          height: 160.0,
                          child: Swiper(
                            itemCount: _list.length,
                            autoplay: true,
                            pagination: SwiperPagination(),
                            itemBuilder: (BuildContext context, int index) {
                              return Image.network(
                                  _list[index], fit: BoxFit.cover);
                            },
                          ),
                        ),
                        Container(
                          height: 800,
                          child: ListTile(
                            title: Text('www'),
                          ),
                        )
                      ],
                    ))),
            Opacity(
              opacity: appBarAlpha,
              child: Container(
                height: 80.0,
                decoration: BoxDecoration(color: Colors.white),
                child: Center(
                  child: Padding(
                      padding: EdgeInsets.only(top: 20.0), child: Text('首页')),
                ),
              ),
            )
          ],
        ));
  }
}
