import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_view/anicese_page_item.dart';
import 'home_view/home_one.dart';

const url =
    'http://www.pptbz.com/pptpic/UploadFiles_6909/201203/2012031220134655.jpg';

class DataAnalasisePage extends StatefulWidget {
  @override
  _DataAnalasisePageState createState() => _DataAnalasisePageState();
}

class _DataAnalasisePageState extends State<DataAnalasisePage>
    with TickerProviderStateMixin {
  TabController tabController;
  TabController tabController1;
  TabController tabController2;

  var visibleOrGon = 56.0;
  int _currentIndex = 0; //选中位置
  bool upMoveing = true;

  AnimationController controllerWidth;
  AnimationController controllerHeight;

  Animation<double> animation;
  Animation<double> animationrevers;
  Animation<double> animationTopBar;

  bool flgUp = false;

  @override
  void initState() {
    controllerWidth = AnimationController(
      value: 1,
      vsync: this,
      duration: Duration(milliseconds: 10),
    );
    controllerHeight = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    animation = Tween<double>(begin: 1, end: 0).animate(controllerHeight);
    animationTopBar = Tween<double>(begin: 0, end: 1).animate(controllerHeight);
    animationrevers =
        Tween<double>(begin: 0, end: 250).animate(controllerHeight);

    //提供方法 为动画添加监听
    animation.addListener(() {
      //当widget有变化的时候系统调用setstate方法重新绘制widget
      setState(() {
        //将动画的值传递给animationvalue（方便展示变化）
        print(animation.value);
      });
    });
    tabController1 = TabController(length: 5, vsync: this);
    tabController2 = TabController(initialIndex: 0, length: 2, vsync: this);
    //TabBar监听器
    tabController2.addListener(() => _onTabChanged());
    super.initState();
  }

  //监听基本面和技术面来切换滑块的状态颜色等。
  bool tabIndex = true;

  _onTabChanged() {
    print("tab=" + tabController2.index.toString());
    if (tabController2.index == 1) {
      tabIndex = false;
    } else if (tabController2.index == 0) {
      tabIndex = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(11, 61, 102, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(11, 61, 102, 1),
        centerTitle: true,
        title: Stack(
          alignment: Alignment(0, 1),
          children: <Widget>[
            Container(
              height: ScreenUtil().setHeight(50 * animationTopBar.value), //变化
              margin: EdgeInsets.only(
                  right: ScreenUtil().setWidth(100 * animationTopBar.value)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image.asset(
                        "images/sp_b_srcb.png",
                        height:
                            ScreenUtil().setHeight(60 * animationTopBar.value),
                        width:
                            ScreenUtil().setWidth(60 * animationTopBar.value),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: ScreenUtil()
                                .setWidth(10 * animationTopBar.value)),
                        child: Text(
                          "新疆天山",
                          style: TextStyle(
                              fontSize: ScreenUtil()
                                  .setSp(26 * animationTopBar.value),
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "2",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize:
                                ScreenUtil().setSp(40 * animationTopBar.value),
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: ScreenUtil()
                                .setWidth(20 * animationTopBar.value)),
                        color: Color(0xFF01579B).withOpacity(0.7),
                        width: ScreenUtil().setWidth(3 * animationTopBar.value),
                        height:
                            ScreenUtil().setHeight(30 * animationTopBar.value),
                      ),
                      Text(
                        "3",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize:
                                ScreenUtil().setSp(40 * animationTopBar.value),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                            left: ScreenUtil()
                                .setWidth(10 * animationTopBar.value),
                            right: ScreenUtil()
                                .setWidth(10 * animationTopBar.value)),
                        child: Text(
                          "新疆天山",
                          style: TextStyle(
                              fontSize: ScreenUtil()
                                  .setSp(26 * animationTopBar.value),
                              color: Colors.white),
                        ),
                      ),
                      Image.asset(
                        "images/sp_b_srcb.png",
                        height:
                            ScreenUtil().setHeight(60 * animationTopBar.value),
                        width:
                            ScreenUtil().setWidth(60 * animationTopBar.value),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: ScreenUtil().setWidth(100)),
              height: !upMoveing ? 0 : ScreenUtil().setHeight(70), //变化
              child: Column(
                children: <Widget>[
                  Text(
                    "中甲 >",
                    style: TextStyle(
                      color:
                          Colors.white.withOpacity(1 - animationTopBar.value),
                      fontSize: ScreenUtil().setSp(33),
                    ),
                  ),
                  Text(
                    "08-18 10:30",
                    style: TextStyle(
                      color: Color.fromRGBO(171, 188, 201, 1)
                          .withOpacity(1 - animationTopBar.value),
                      fontSize: ScreenUtil().setSp(20),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: new Column(
        children: <Widget>[
          //缩放动画
          Container(
            /* height: upMoveing
                  ? ScreenUtil().setHeight(250)
                  : ScreenUtil().setHeight(0), */ //变参数
            height: ScreenUtil().setHeight(250 * animation.value),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                      left: ScreenUtil().setWidth(20 * animation.value)),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        "images/sp_b_srcb.png",
                        height: ScreenUtil().setHeight(80 * animation.value),
                        width: ScreenUtil().setWidth(80 * animation.value),
                      ),
                      Text(
                        "新疆天山雪豹",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(30 * animation.value),
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(40 * animation.value),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(
                            left: ScreenUtil().setWidth(15 * animation.value),
                            right: ScreenUtil().setWidth(15 * animation.value),
                            top: ScreenUtil().setHeight(5 * animation.value),
                            bottom:
                                ScreenUtil().setHeight(5 * animation.value)),
                        child: Text(
                          "已完场",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  ScreenUtil().setSp(25 * animation.value)),
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF01579B).withOpacity(0.7),
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              ScreenUtil().setWidth(50 * animation.value),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical:
                                ScreenUtil().setHeight(10 * animation.value)),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "2",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize:
                                      ScreenUtil().setSp(50 * animation.value),
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: ScreenUtil()
                                      .setWidth(50 * animation.value)),
                              color: Color(0xFF01579B).withOpacity(0.7),
                              width: ScreenUtil().setWidth(3 * animation.value),
                              height:
                                  ScreenUtil().setHeight(30 * animation.value),
                            ),
                            Text(
                              "3",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize:
                                      ScreenUtil().setSp(50 * animation.value),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "半场 1:1",
                        style: TextStyle(
                            color: Color.fromRGBO(171, 188, 201, 1),
                            fontSize: ScreenUtil().setSp(25 * animation.value)),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                  right: ScreenUtil()
                                      .setWidth(2 * animation.value)),
                              padding: EdgeInsets.only(
                                  left: ScreenUtil()
                                      .setWidth(15 * animation.value),
                                  right: ScreenUtil()
                                      .setWidth(15 * animation.value),
                                  top: ScreenUtil()
                                      .setHeight(5 * animation.value),
                                  bottom: ScreenUtil()
                                      .setHeight(5 * animation.value)),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.aspect_ratio,
                                    color: Colors.red,
                                    size: ScreenUtil()
                                        .setWidth(33 * animation.value),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: ScreenUtil()
                                            .setWidth(8 * animation.value)),
                                    child: Text(
                                      "视频直播",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: ScreenUtil()
                                              .setSp(20 * animation.value)),
                                    ),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xFF01579B).withOpacity(0.7),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                    ScreenUtil().setWidth(40 * animation.value),
                                  ),
                                  bottomLeft: Radius.circular(
                                    ScreenUtil().setWidth(40 * animation.value),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: ScreenUtil()
                                      .setWidth(3 * animation.value)),
                              padding: EdgeInsets.only(
                                  left: ScreenUtil()
                                      .setWidth(15 * animation.value),
                                  right: ScreenUtil()
                                      .setWidth(15 * animation.value),
                                  top: ScreenUtil()
                                      .setHeight(5 * animation.value),
                                  bottom: ScreenUtil()
                                      .setHeight(5 * animation.value)),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.widgets,
                                    color: Colors.green,
                                    size: ScreenUtil()
                                        .setWidth(33 * animation.value),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: ScreenUtil()
                                            .setWidth(8 * animation.value)),
                                    child: Text(
                                      "视频直播",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: ScreenUtil()
                                              .setSp(20 * animation.value)),
                                    ),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xFF01579B).withOpacity(0.7),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(
                                    ScreenUtil().setWidth(40 * animation.value),
                                  ),
                                  bottomRight: Radius.circular(
                                    ScreenUtil().setWidth(40 * animation.value),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: ScreenUtil().setWidth(10 * animation.value),right:ScreenUtil().setWidth(10*animation.value)),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        "images/sp_b_srcb.png",
                        height: ScreenUtil().setHeight(80 * animation.value),
                        width: ScreenUtil().setWidth(80 * animation.value),
                      ),
                      Text(
                        "新疆天山雪豹",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(30 * animation.value),
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Color.fromRGBO(11, 61, 102, 1),
            margin: EdgeInsets.only(
              top: ScreenUtil().setHeight(10), //变参数
            ),
            child: Column(
              children: <Widget>[
                new TabBar(
                  tabs: [
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "分析 ",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "数据 ",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "情报",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        " 专家 ",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        " 阵容 ",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                  indicatorColor: Color.fromRGBO(238, 206, 70, 1),
                  unselectedLabelColor: Color.fromRGBO(171, 188, 201, 1),
                  labelColor: Color.fromRGBO(238, 206, 70, 1),
                  controller: tabController1,
                  indicatorPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  labelPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
                Container(
                  padding: EdgeInsets.only(top: ScreenUtil().setHeight(30)),
                  alignment: Alignment.center,
                  width: ScreenUtil.screenWidth,
                  color: Colors.white,
                  child: TabBar(
                    indicatorPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    indicatorColor: Color(0xFFFB8C00),
                    labelColor: Color.fromRGBO(21, 138, 235, 1),
                    labelPadding: EdgeInsets.only(left: 16, right: 16),
                    unselectedLabelColor: Color.fromRGBO(109, 109, 109, 1),
                    isScrollable: true,
                    indicator: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.orange, width: 0.01),
                      ),
                    ),
                    tabs: [
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(
                            left: ScreenUtil().setWidth(90),
                            right: ScreenUtil().setWidth(90),
                            bottom: ScreenUtil().setHeight(5),
                            top: ScreenUtil().setHeight(5)),
                        child: Text(
                          " 基本面 ",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                        decoration: tabIndex
                            ? BoxDecoration(
                                color: Color(0xFF01579B).withOpacity(0.2),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    ScreenUtil().setWidth(40),
                                  ),
                                ),
                              )
                            : BoxDecoration(
                                color: Color.fromRGBO(212, 212, 212, 1)
                                    .withOpacity(0.2),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    ScreenUtil().setWidth(40),
                                  ),
                                ),
                              ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(
                            left: ScreenUtil().setWidth(90),
                            right: ScreenUtil().setWidth(90),
                            bottom: ScreenUtil().setHeight(5),
                            top: ScreenUtil().setHeight(5)),
                        child: Text(
                          " 技术面 ",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                        decoration: tabIndex
                            ? BoxDecoration(
                                color: Color.fromRGBO(212, 212, 212, 1)
                                    .withOpacity(0.2),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    ScreenUtil().setWidth(40),
                                  ),
                                ),
                              )
                            : BoxDecoration(
                                color: Color(0xFF01579B).withOpacity(0.2),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    ScreenUtil().setWidth(40),
                                  ),
                                ),
                              ),
                      ),
                    ],
                    controller: tabController2,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ExtendedTabBarView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Expanded(
                      child: ExtendedTabBarView(
                        children: <Widget>[
                          AniceseItemPage((value) {
                            //>0.0向上滑动
                            //false向下滑动
                            visibleOrGon = value;
                            if (value > 30) {
                              upMoveing = true;
                              //controllerWidth.forward();
                              controllerHeight.reverse();
                            } else {
                              //向上滑动
                              upMoveing = false;
                              controllerWidth.reverse();
                              controllerHeight.forward();
                            }
                            setState(() {});
                          }),
                          AniceseItemPage((value) {
                            //>0.0向上滑动
                            //false向下滑动
                            visibleOrGon = value;
                            if (value > 30) {
                              upMoveing = true;
                              //controllerWidth.forward();
                              controllerHeight.reverse();
                            } else {
                              //向上滑动
                              upMoveing = false;
                              controllerWidth.reverse();
                              controllerHeight.forward();
                            }
                            setState(() {});
                          }),
                        ],
                        controller: tabController2,
                        linkWithAncestor: true,
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Expanded(
                      child: ExtendedTabBarView(
                        children: <Widget>[
                          List("Tab01"),
                          List("Tab02"),
                        ],
                        controller: tabController2,
                        linkWithAncestor: true,
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Expanded(
                      child: ExtendedTabBarView(
                        children: <Widget>[
                          List("Tab01"),
                          List("Tab02"),
                        ],
                        controller: tabController2,
                        linkWithAncestor: true,
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Expanded(
                      child: ExtendedTabBarView(
                        children: <Widget>[
                          List("Tab01"),
                          List("Tab02"),
                        ],
                        controller: tabController2,
                        linkWithAncestor: true,
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Expanded(
                      child: ExtendedTabBarView(
                        children: <Widget>[
                          List("Tab01"),
                          List("Tab02"),
                        ],
                        controller: tabController2,
                        linkWithAncestor: true,
                      ),
                    )
                  ],
                ),
              ],
              controller: tabController1,
              linkWithAncestor: true,
            ),
          )
        ],
      ),
    );
  }
}

class List extends StatelessWidget {
  final String tabKey;

  List(this.tabKey);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (c, i) {
          return Container(
            //decoration: BoxDecoration(border: Border.all(color: Colors.orange,width: 1.0)),
            alignment: Alignment.center,
            height: 60.0,
            child: Text("$tabKey : List$i"),
          );
        },
        itemCount: 100);
  }
}
