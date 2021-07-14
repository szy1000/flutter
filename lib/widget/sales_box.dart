import 'package:flutter/material.dart';
import 'package:myapp/model/common_model.dart';
import 'package:myapp/model/sales_box_model.dart';
import 'package:myapp/widget/webview.dart';

class SalesBox extends StatelessWidget {
  final SalesBoxModel salesBox;

  const SalesBox({Key key, @required this.salesBox}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(6)),
      child: Padding(
        padding: EdgeInsets.all(7),
        child: _items(context),
      ),
    );
  }

  Widget _items(BuildContext context) {
    if (salesBox == null) return null;
    List<Widget> items = [];
    items.add(_doubleItems(
        context, salesBox.bigCard1, salesBox.bigCard2, true, false));
    items.add(_doubleItems(
        context, salesBox.smallCard1, salesBox.smallCard2, true, false));
    items.add(_doubleItems(
        context, salesBox.smallCard3, salesBox.smallCard4, false, true));
    return Column(
      children: <Widget>[
        Container(
          height: 44,
          margin: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1, color: Color(0xfff2f2f2)))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.network(salesBox.icon,
                  height: 15, width: 79, fit: BoxFit.fill),
              Container(
                padding: EdgeInsets.fromLTRB(10, 1, 8, 1),
                margin: EdgeInsets.only(right: 7),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      colors: [Color(0xffff4e63), Color(0xffff6cc9)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    )),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WebView(
                                  url: salesBox.moreUrl,
                                )));
                  },
                  child: Text(
                    '获取更多福利>',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 4)),
        items[0],
        Padding(padding: EdgeInsets.only(top: 4)),
        items[1],
        Padding(padding: EdgeInsets.only(top: 4)),
        items[2],
      ],
    );
  }

  Widget _doubleItems(BuildContext context, CommonModel leftCard,
      CommonModel rightCard, bool big, bool last) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _item(context, leftCard, big, true),
        _item(context, rightCard, big, false),
      ],
    );
  }

  Widget _item(BuildContext context, CommonModel model, bool big, bool left) {
    return Expanded(
        flex: 1,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WebView(
                          url: model.url,
                          title: model.title ?? '活动',
                        )));
          },
          child: Container(
            width: big ? 130 : 82,
            margin: left ? EdgeInsets.only(right: 4) : EdgeInsets.zero,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Image.network(
              model.icon,
              fit: BoxFit.fill,
              // width: 18.0,
              // height: 18.0,
            ),
          ),
        ));
  }
}
