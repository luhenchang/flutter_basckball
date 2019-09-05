import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:convert';

import '../anicese_page.dart';

class AniceseItemPage extends StatefulWidget {
  ValueChanged callBack;

  AniceseItemPage(this.callBack);

  @override
  State<StatefulWidget> createState() {
    return _AniceseItemPageState();
  }
}

class _AniceseItemPageState extends State<AniceseItemPage> {
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
      if (notification.metrics.extentAfter == 0.0) {}
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
                  child: ListView(
                    children: <Widget>[
                      ///历史交锋模块
                      Container(
                        margin: EdgeInsets.only(
                          top: ScreenUtil().setHeight(20),
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                left: ScreenUtil().setWidth(30),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "历史交锋",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: ScreenUtil().setSp(38),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                ScreenUtil().setWidth(20)),
                                        child: Text(
                                          "全部",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  32, 144, 236, 1),
                                              fontSize: ScreenUtil().setSp(30),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                ScreenUtil().setWidth(20)),
                                        child: Text(
                                          "客主",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  116, 116, 116, 1),
                                              fontSize: ScreenUtil().setSp(30),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                ScreenUtil().setWidth(20)),
                                        child: Row(
                                          children: <Widget>[
                                            Text("筛选",
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        116, 116, 116, 1),
                                                    fontSize:
                                                        ScreenUtil().setSp(30),
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Icon(
                                              Icons.arrow_drop_down,
                                              color: Color.fromRGBO(
                                                  116, 116, 116, 1),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: ScreenUtil().setHeight(50),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Stack(
                                          alignment: Alignment(3, -0.8),
                                          children: <Widget>[
                                            Text(
                                              "33",
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    ScreenUtil().setSp(36),
                                              ),
                                            ),
                                            Text(
                                              "%",
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.w500,
                                                fontSize:
                                                    ScreenUtil().setSp(20),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical:
                                                  ScreenUtil().setHeight(5)),
                                          child: Text(
                                            "胜率",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontSize: ScreenUtil().setSp(30),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "1胜1平1负",
                                          style: TextStyle(
                                            color: Color.fromRGBO(
                                                116, 116, 116, 1),
                                            fontWeight: FontWeight.w400,
                                            fontSize: ScreenUtil().setSp(30),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Stack(
                                          alignment: Alignment(3, -0.8),
                                          children: <Widget>[
                                            Text(
                                              "33",
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    ScreenUtil().setSp(36),
                                              ),
                                            ),
                                            Text(
                                              "%",
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.w500,
                                                fontSize:
                                                    ScreenUtil().setSp(20),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical:
                                                  ScreenUtil().setHeight(5)),
                                          child: Text(
                                            "赢盘率",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontSize: ScreenUtil().setSp(30),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "1胜1平1负",
                                          style: TextStyle(
                                            color: Color.fromRGBO(
                                                116, 116, 116, 1),
                                            fontWeight: FontWeight.w400,
                                            fontSize: ScreenUtil().setSp(30),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Stack(
                                          alignment: Alignment(3, -0.8),
                                          children: <Widget>[
                                            Text(
                                              "33",
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    ScreenUtil().setSp(36),
                                              ),
                                            ),
                                            Text(
                                              "%",
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.w500,
                                                fontSize:
                                                    ScreenUtil().setSp(20),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical:
                                                  ScreenUtil().setHeight(5)),
                                          child: Text(
                                            "大球率",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontSize: ScreenUtil().setSp(30),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "1胜1平1负",
                                          style: TextStyle(
                                            color: Color.fromRGBO(
                                                116, 116, 116, 1),
                                            fontWeight: FontWeight.w400,
                                            fontSize: ScreenUtil().setSp(30),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              color: Color.fromRGBO(242, 243, 247, 1),
                              padding: EdgeInsets.only(
                                  top: ScreenUtil().setHeight(20),
                                  bottom: ScreenUtil().setHeight(20)),
                              margin: EdgeInsets.only(
                                  top: ScreenUtil().setHeight(20)),
                              width: ScreenUtil.screenWidth,
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Text("日期"),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: ScreenUtil().setWidth(200),
                                            right: ScreenUtil().setWidth(10)),
                                        child: Text("对阵"),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: ScreenUtil().setWidth(120),
                                            right: ScreenUtil().setWidth(10)),
                                        child: Text("让球"),
                                      ),
                                      Text("进球数"),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            ///莫斯巴达
                            ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 3,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.only(
                                          top: ScreenUtil().setHeight(10),
                                          bottom: ScreenUtil().setHeight(10),
                                        ),
                                        color: Colors.white,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Text("19/08/09"),
                                                Text("欧罗巴杯"),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Text("罗格兹尼"),
                                                Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: ScreenUtil()
                                                          .setWidth(20)),
                                                  child: Text(
                                                    "2:3",
                                                    style: TextStyle(
                                                      color: Colors.redAccent,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: ScreenUtil()
                                                          .setSp(26),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  "莫斯巴达",
                                                  style: TextStyle(
                                                    color: Colors.redAccent,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize:
                                                        ScreenUtil().setSp(26),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Text("受评/半"),
                                                Text(
                                                  "赢",
                                                  style: TextStyle(
                                                    color: Colors.redAccent,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize:
                                                        ScreenUtil().setSp(26),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Text("2/2.5"),
                                                Text(
                                                  "大",
                                                  style: TextStyle(
                                                    color: Colors.redAccent,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize:
                                                        ScreenUtil().setSp(26),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                          color: Colors.grey.withOpacity(0.2),
                                          width: ScreenUtil.screenWidth,
                                          height: 1),
                                    ],
                                  );
                                }),
                            Container(
                              margin: EdgeInsets.only(
                                left: ScreenUtil().setWidth(30),
                                top: ScreenUtil().setHeight(30),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "近期状态",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: ScreenUtil().setSp(38),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                ScreenUtil().setWidth(20)),
                                        child: Text(
                                          "全部",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  32, 144, 236, 1),
                                              fontSize: ScreenUtil().setSp(30),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                ScreenUtil().setWidth(20)),
                                        child: Text(
                                          "客主",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  116, 116, 116, 1),
                                              fontSize: ScreenUtil().setSp(30),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                ScreenUtil().setWidth(20)),
                                        child: Row(
                                          children: <Widget>[
                                            Text("筛选",
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        116, 116, 116, 1),
                                                    fontSize:
                                                        ScreenUtil().setSp(30),
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Icon(
                                              Icons.arrow_drop_down,
                                              color: Color.fromRGBO(
                                                  116, 116, 116, 1),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: ScreenUtil().setHeight(30),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: ScreenUtil().setWidth(30)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              child: Text("5胜2平3负"),
                                            ),
                                            Container(
                                              height:
                                                  ScreenUtil().setHeight(10),
                                              width: ScreenUtil().setWidth(260),
                                              child: LinearProgressIndicator(
                                                backgroundColor: Colors.blue,
                                                value: 0.2,
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  Color.fromRGBO(
                                                      242, 243, 247, 1),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: ScreenUtil().setHeight(40)),
                                        child: Text("胜率"),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: ScreenUtil().setWidth(30)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: <Widget>[
                                            Container(
                                              child: Text("5胜2平3负"),
                                            ),
                                            Container(
                                              height:
                                                  ScreenUtil().setHeight(10),
                                              width: ScreenUtil().setWidth(260),
                                              child: LinearProgressIndicator(
                                                backgroundColor: Color.fromRGBO(
                                                    242, 243, 247, 1),
                                                value: 0.5,
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  Colors.blue,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: ScreenUtil().setHeight(30),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: ScreenUtil().setWidth(30)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              child: Text("5胜2平3负"),
                                            ),
                                            Container(
                                              height:
                                                  ScreenUtil().setHeight(10),
                                              width: ScreenUtil().setWidth(260),
                                              child: LinearProgressIndicator(
                                                backgroundColor: Colors.blue,
                                                value: 0.5,
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  Color.fromRGBO(
                                                      242, 243, 247, 1),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: ScreenUtil().setHeight(40)),
                                        child: Text("赢盘率"),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: ScreenUtil().setWidth(30)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: <Widget>[
                                            Container(
                                              child: Text("5胜2平3负"),
                                            ),
                                            Container(
                                              height:
                                                  ScreenUtil().setHeight(10),
                                              width: ScreenUtil().setWidth(260),
                                              child: LinearProgressIndicator(
                                                backgroundColor: Color.fromRGBO(
                                                    242, 243, 247, 1),
                                                value: 0.8,
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  Colors.blue,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: ScreenUtil().setHeight(30),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: ScreenUtil().setWidth(30)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              child: Text("5胜2平3负"),
                                            ),
                                            Container(
                                              height:
                                                  ScreenUtil().setHeight(10),
                                              width: ScreenUtil().setWidth(260),
                                              child: LinearProgressIndicator(
                                                backgroundColor: Colors.blue,
                                                value: 0.2,
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  Color.fromRGBO(
                                                      242, 243, 247, 1),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: ScreenUtil().setHeight(40)),
                                        child: Text("大球率"),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: ScreenUtil().setWidth(30)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: <Widget>[
                                            Container(
                                              child: Text("5胜2平3负"),
                                            ),
                                            Container(
                                              height:
                                                  ScreenUtil().setHeight(10),
                                              width: ScreenUtil().setWidth(260),
                                              child: LinearProgressIndicator(
                                                backgroundColor: Color.fromRGBO(
                                                    242, 243, 247, 1),
                                                value: 0.2,
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  Colors.blue,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            ///莫斯巴达
                            Container(
                              margin: EdgeInsets.only(
                                  top: ScreenUtil().setHeight(30)),
                              child: Text(
                                "莫斯巴达",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: ScreenUtil().setSp(36),
                                ),
                              ),
                            ),
                            ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 3,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.only(
                                          top: ScreenUtil().setHeight(10),
                                          bottom: ScreenUtil().setHeight(10),
                                        ),
                                        color: Colors.white,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  "19/08/09",
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize:
                                                        ScreenUtil().setSp(26),
                                                  ),
                                                ),
                                                Text(
                                                  "欧罗巴杯",
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize:
                                                        ScreenUtil().setSp(26),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Text("罗格兹尼"),
                                                Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: ScreenUtil()
                                                          .setWidth(20)),
                                                  child: Text(
                                                    "2:3",
                                                    style: TextStyle(
                                                      color: Colors.redAccent,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: ScreenUtil()
                                                          .setSp(26),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  "莫斯巴达",
                                                  style: TextStyle(
                                                    color: Colors.redAccent,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize:
                                                        ScreenUtil().setSp(26),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Text("受评/半"),
                                                Text(
                                                  "赢",
                                                  style: TextStyle(
                                                    color: Colors.redAccent,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize:
                                                        ScreenUtil().setSp(26),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Text("2/2.5"),
                                                Text(
                                                  "大",
                                                  style: TextStyle(
                                                    color: Colors.redAccent,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize:
                                                        ScreenUtil().setSp(26),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                          color: Colors.grey.withOpacity(0.2),
                                          width: ScreenUtil.screenWidth,
                                          height: 1),
                                    ],
                                  );
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
