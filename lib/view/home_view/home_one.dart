import 'package:flutter/material.dart';
import 'dart:convert';

import '../anicese_page.dart';

class OnePage extends StatefulWidget {
  ValueChanged callBack;

  OnePage(this.callBack);

  @override
  State<StatefulWidget> createState() {
    return _OnePageState();
  }
}

class _OnePageState extends State<OnePage> {
  String jsonString = "";
  double dx = 0.0;
  double dy = 0.0;

  bool scrollPos = false;

  @override
  void initState() {
    super.initState();
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    //ScrollUpdateNotification 还有其他可使用，需要自行优化
    if (notification is ScrollEndNotification) {
      //下滑到最底部
      if (notification.metrics.extentAfter == 0.0) {
      }
      //滑动到最顶部
      if (notification.metrics.extentBefore == 0.0 && scrollPos) {}
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder(
            future:
                DefaultAssetBundle.of(context).loadString('images/data.json'),
            builder: (context, snapshot) {
              Map<String, dynamic> mydata =
                  json.decode(snapshot.data.toString());
              return NotificationListener(
                onNotification: _handleScrollNotification,
                child: Listener(
                  onPointerDown: (dowPointer) {
                    print("dy:" + dowPointer.position.dy.toString());
                    print("dx" + dowPointer.position.dx.toString());
                    dx = dowPointer.position.dx;
                    dy = dowPointer.position.dy;
                  },
                  onPointerMove: (movePoint) {
                    //向下滑动。
                    if (movePoint.position.dy - dy > 0) {
                      if (movePoint.position.dy - dy > 56) {
                        widget.callBack(56.0);
                        scrollPos = true;
                      }
                    } else {
                      if (-(movePoint.position.dy - dy) > 56) {
                        widget.callBack(0.0);
                        scrollPos = false;
                      }
                    }
                  },
                  child: ListView.builder(
                      padding: EdgeInsets.all(0.0),
                      itemCount: mydata == null ? 0 : mydata["datas"].length,
                      itemBuilder: (buildContext, index) {
                        return InkWell(
                          onTap:(){
                            Navigator.of(context).push(new MaterialPageRoute(builder:(context){
                              return DataAnalasisePage();
                            }));
                          },
                          child: Container(
                              padding: EdgeInsets.only(left: 10),
                              child: Column(
                                children: <Widget>[
                                  Stack(
                                    alignment: Alignment.center,
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 15,
                                            bottom: 15,
                                            left: 10,
                                            right: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              mydata["datas"][index]
                                                  ["leagueName"],
                                              style: TextStyle(
                                                  color: Color(0xFF757575),
                                                  fontSize: 13),
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(right: 5),
                                                  child: Icon(
                                                    Icons.flag,
                                                    color: Color(0xFF757575)
                                                        .withOpacity(0.6),
                                                    size: 16,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 3, right: 20),
                                                  child: Text(
                                                    mydata["datas"][index]
                                                        ["corner"],
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF757575),
                                                        fontSize: 13),
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Color(0xFF757575)
                                                      .withOpacity(0.3),
                                                  size: 20,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "${mydata["datas"][index]["elapsedTime"] + "  " + mydata["datas"][index]["matchDate"]}",
                                        style: TextStyle(
                                            color: Color(0xFF757575),
                                            fontSize: 13),
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: <Widget>[
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: Row(
                                                children: <Widget>[
                                                  int.parse(mydata["datas"]
                                                                  [index]
                                                              ["card"][0]) >
                                                          0
                                                      ? Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                            left: 3,
                                                            right: 3,
                                                          ),
                                                          child: Text(
                                                            mydata["datas"]
                                                                    [index]
                                                                ["card"][0],
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          decoration: BoxDecoration(
                                                              color: Colors
                                                                  .redAccent,
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          3))),
                                                        )
                                                      : Container(),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 3),
                                                    padding: EdgeInsets.only(
                                                      left: 3,
                                                      right: 3,
                                                    ),
                                                    child: Text(
                                                      mydata["datas"][index]
                                                          ["card"][1],
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFFFB74D),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    3))),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10, right: 5),
                                                    child: Text(
                                                      mydata["datas"][index]
                                                          ["homeRank"],
                                                      style: TextStyle(
                                                          color: Color(
                                                                  0xFF757575)
                                                              .withOpacity(0.6),
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 3, right: 10),
                                                  child: Text(
                                                    mydata["datas"][index]
                                                        ["awayRank"],
                                                    style: TextStyle(
                                                        color: Color(0xFF757575)
                                                            .withOpacity(0.6),
                                                        fontSize: 12),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      right: 15),
                                                  padding: EdgeInsets.only(
                                                      left: 3, right: 3),
                                                  child: Text(
                                                    mydata["datas"][index]
                                                        ["card2"][0],
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  decoration: BoxDecoration(
                                                      color: Color(0xFFFFB74D),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  3))),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 3, right: 10),
                                            child: Text(
                                              mydata["datas"][index]
                                                  ["homeName"],
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: 12,
                                                right: 12,
                                                top: 8,
                                                bottom: 8),
                                            child: Text(
                                              mydata["datas"][index]["score"]
                                                  [0],
                                              style: TextStyle(
                                                  color: Color(0xFFFF8A80),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFF8A80)
                                                  .withOpacity(0.13),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(5),
                                                bottomLeft: Radius.circular(5),
                                              ),
                                            ),
                                          ),
                                          Container(
                                              height: 25,
                                              width: 0.3,
                                              color: Color(0xFFFF8A80)),
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: 12,
                                                right: 12,
                                                top: 8,
                                                bottom: 8),
                                            child: Text(
                                              mydata["datas"][index]["score"]
                                                  [1],
                                              style: TextStyle(
                                                  color: Color(0xFFFF8A80),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            decoration: BoxDecoration(
                                                color: Color(0xFFFF8A80)
                                                    .withOpacity(0.13),
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(5),
                                                    bottomRight:
                                                        Radius.circular(5))),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 15, right: 5),
                                            child: Text(
                                              mydata["datas"][index]
                                                  ["awayName"],
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 15, bottom: 15, left: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                mydata["datas"][index]
                                                        ["isVideo"]
                                                    ? Icon(
                                                        Icons.video_call,
                                                        color: Colors.orange,
                                                      )
                                                    : Container(),
                                                mydata["datas"][index]
                                                        ["isCartoon"]
                                                    ? Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 6),
                                                        child: Icon(
                                                          Icons.videogame_asset,
                                                          color: Colors.green,
                                                        ),
                                                      )
                                                    : Container(),
                                                mydata["datas"][index]
                                                        ["isCartoon"]
                                                    ? Text(
                                                        "中立场",
                                                        style: TextStyle(
                                                            color: Colors
                                                                .blueAccent,
                                                            fontSize: 13),
                                                      )
                                                    : Container(),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 3, right: 20),
                                                  child: Text(
                                                    mydata["datas"][index]
                                                        ["oddsAsia"],
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF757575),
                                                        fontSize: 13),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "${"(" + mydata["datas"][index]["bifen"][0] + ":" + mydata["datas"][index]["bifen"][1] + ")"}",
                                        style: TextStyle(
                                            color: Color(0xFF757575),
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: 400,
                                    height: 1,
                                    color: Colors.grey.withOpacity(0.1),
                                  ),
                                ],
                              )),
                        );
                      }),
                ),
              );
            }));
  }
}
