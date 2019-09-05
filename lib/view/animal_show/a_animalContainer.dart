import 'package:flutter/material.dart';
import 'package:extended_tabs/extended_tabs.dart';

import 'package:flutter_basckball/view/home_view/home_one.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Extended Tabs Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Extended Tabs Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  TabController tabController;
  TabController tabController1;
  TabController tabController2;
  var visibleOrGon = 56.0;

  //第一个动画
  double width = 0;
  double secondWidth = 0;
  var isFlag = false;

  double pointXStar = 0;

  double dxDistans = 0;

  var rightdWidth=0.0;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController1 = TabController(length: 5, vsync: this);
    tabController2 = TabController(length: 3, vsync: this);

    //TabBar监听器
    tabController.addListener(() => _onTabChanged());
    super.initState();
  }

  int _currentIndex = 0; //选中位置
  _onTabChanged() {
    _currentIndex = tabController.index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 828, height: 1792)..init(context);
    return Material(
        color: Color(0xFF01579B),
        child: Stack(
          alignment:Alignment(0,1),
          children: <Widget>[
          Stack(
            alignment: Alignment(-1, 0.5),
            children: <Widget>[
              Stack(
                alignment:Alignment(1, -1.8),
                children: <Widget>[
                  getcontent(),
                  GestureDetector(
                    onTap: () {
                      setState(() {});
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 2),
                      width: MediaQuery.of(context).size.width,
                      height:200,
                      margin:EdgeInsets.only(top:width),
                      child: Stack(
                        alignment: Alignment(1, -1),
                        children: <Widget>[
                          Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        "images/xiayu.gif",
                                      ),
                                      fit: BoxFit.fill),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.orangeAccent,
                                        blurRadius: 70)
                                  ]),
                            ),
                          ),
                        ],
                      ),
                      curve: Curves.bounceOut,
                    ),
                  )
                ],
              ),
              GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: AnimatedContainer(
                  duration: Duration(seconds: 2),
                  width: secondWidth,
                  height: 500,
                  child: Stack(
                    alignment: Alignment(1, 0),
                    children: <Widget>[
                      GestureDetector(
                        onHorizontalDragDown: (horidown) {
                          pointXStar = horidown.localPosition.dx;
                        },
                        onHorizontalDragUpdate: (dragUpdate) {
                          if (pointXStar>dragUpdate.delta.dx) {
                            dxDistans =  pointXStar-dragUpdate.delta.dx;
                            print(dxDistans);
                            setState(() {
                              secondWidth=0;
                            });
                          } else {
                          }
                        },
                        child: Container(
                          height:500,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.deepOrangeAccent,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              image: DecorationImage(
                                  image: AssetImage("images/girl.gif"),
                                  fit: BoxFit.fill),
                              boxShadow: [
                                BoxShadow(color: Colors.blue, blurRadius: 10)
                              ]),
                        ),
                      ),
                    ],
                  ),
                  curve: Curves.ease,
                ),
              )
            ],
          ),
          GestureDetector(
            onTap: () {
              setState(() {});
            },
            child: AnimatedContainer(
              duration: Duration(seconds: 2),
              width: MediaQuery.of(context).size.width,
              height: rightdWidth,
              child: Stack(
                alignment: Alignment(1,1),
                children: <Widget>[
                  GestureDetector(
                    onHorizontalDragDown: (horidown) {
                      pointXStar = horidown.localPosition.dx;
                    },
                    onHorizontalDragUpdate: (dragUpdate) {
                      if (pointXStar>dragUpdate.delta.dx) {
                        dxDistans =  pointXStar-dragUpdate.delta.dx;
                        print(dxDistans);
                        setState(() {
                          rightdWidth=0;
                        });
                      } else {
                      }
                    },
                    child: Container(
                      height:80,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.deepOrangeAccent,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          image: DecorationImage(
                              image: AssetImage("images/map.png"),
                              fit: BoxFit.fill),
                          boxShadow: [
                            BoxShadow(color: Colors.blue, blurRadius: 10)
                          ]),
                    ),
                  ),
                ],
              ),
              curve: Curves.linear,
            ),
          )

        ],));
  }

  Widget getcontent() {
    return Stack(
      alignment: Alignment(1, 0),
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 56),
          child: Column(
            children: <Widget>[
              Container(
                color: Color(0xFF01579B),
                height: visibleOrGon,
                child: Row(
                  children: <Widget>[
                    TabBar(
                        controller: tabController,
                        indicatorWeight: 0.01,
                        isScrollable: true,
                        tabs: <Widget>[
                          Text(
                            "足球",
                            style: TextStyle(
                                fontSize: 33,
                                color: _currentIndex == 0
                                    ? Color(0xFFFFC02D)
                                    : Colors.white.withOpacity(0.8)),
                          ),
                          Text(
                            "篮球",
                            style: TextStyle(
                                fontSize: 33,
                                color: _currentIndex == 1
                                    ? Color(0xFFFFC02D)
                                    : Colors.white.withOpacity(0.8)),
                          ),
                        ]),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Image.asset(
                            "images/sp_b_srcb.png",
                            height: 20,
                            width: 20,
                            color: Colors.white,
                          ),
                          Text(
                            "资料库",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      width: 90,
                      height: 34,
                      decoration: BoxDecoration(
                          color: Color(0xFF2979FF),
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Icon(
                        Icons.graphic_eq,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Icon(
                        Icons.settings,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ExtendedTabBarView(
                  children: <Widget>[
                    Container(
                      child: Container(
                        padding: EdgeInsets.only(top: 20),
                        child: Column(
                          children: <Widget>[
                            TabBar(
                              indicatorPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              labelPadding:
                                  EdgeInsets.only(left: 16, right: 16),
                              indicatorColor: Color(0xFFFB8C00),
                              labelColor: Color(0xFFFB8C00),
                              unselectedLabelColor: Colors.white,
                              isScrollable: true,
                              indicator: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      color: Colors.orange, width: 2),
                                ),
                              ),
                              tabs: [
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    " 全部 ",
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
                                    " 竞猜 ",
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
                                    "北单子",
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
                                    " 足彩 ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    " 全部 ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                              controller: tabController1,
                            ),
                            Container(
                              child: Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          child: Icon(Icons.arrow_back),
                                          margin: EdgeInsets.symmetric(
                                              vertical: 6, horizontal: 5),
                                          height: 35,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8))),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 7),
                                          child: Row(
                                            children: <Widget>[
                                              RichText(
                                                text: TextSpan(
                                                    text: "日期",
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text: ": 08/10   ",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                          children: <
                                                              TextSpan>[]),
                                                      TextSpan(
                                                        text: " 周六",
                                                        style: TextStyle(
                                                            fontSize: 13),
                                                      )
                                                    ]),
                                              ),
                                              Icon(
                                                Icons.arrow_drop_down,
                                                color: Colors.grey
                                                    .withOpacity(0.8),
                                              ),
                                            ],
                                          ),
                                          margin: EdgeInsets.symmetric(
                                              vertical: 6, horizontal: 5),
                                          height: 35,
                                          width: 150,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(0.2),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Icon(Icons.arrow_forward),
                                          margin: EdgeInsets.symmetric(
                                              vertical: 6, horizontal: 5),
                                          height: 35,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8))),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 5),
                                      height: 35,
                                      width: 80,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text("全部"),
                                          Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.grey.withOpacity(0.8),
                                          ),
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.2),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8))),
                                    ),
                                  ],
                                ),
                                margin: EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 16.0),
                                        color:
                                            Colors.blueGrey.withOpacity(0.08),
                                        blurRadius: 15.0,
                                        spreadRadius: -4.0),
                                  ],
                                ),
                              ),
                              color: Colors.white,
                            ),
                            Expanded(
                              child: ExtendedTabBarView(
                                children: <Widget>[
                                  OnePage((value) {
                                    visibleOrGon = value;
                                    setState(() {});
                                  }),
                                  OnePage((value) {
                                    visibleOrGon = value;
                                  }),
                                  OnePage((value) {
                                    visibleOrGon = value;
                                  }),
                                  OnePage((value) {
                                    visibleOrGon = value;
                                  }),
                                  OnePage((value) {
                                    visibleOrGon = value;
                                  }),
                                ],
                                controller: tabController1,
                              ),
                            )
                          ],
                        ),
                      ),
                      color: Color(0xFF01579B),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: 20,
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(bottom: 12),
                            child: TabBar(
                              indicatorPadding: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: -10),
                              indicatorColor: Color(0xFFFB8C00),
                              labelColor: Color(0xFFFB8C00),
                              unselectedLabelColor: Colors.white,
                              tabs: [
                                Text(
                                  "全部",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  "竞猜",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  "关注",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                              controller: tabController2,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFF01579B),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 16.0),
                                    color: Colors.blueGrey.withOpacity(0.08),
                                    blurRadius: 15.0,
                                    spreadRadius: -4.0),
                              ],
                            ),
                          ),
                          Expanded(
                            child: ExtendedTabBarView(
                              children: <Widget>[
                                OnePage((value) {
                                  visibleOrGon = value;
                                }),
                                List("Tab01"),
                                List("Tab02"),
                              ],
                              controller: tabController2,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                  controller: tabController,
                ),
              )
            ],
          ),
        ),
        InkWell(
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 50),
            padding: EdgeInsets.only(left: 10),
            height: 30,
            width: 60,
            child: Text(
              !isFlag ? "播放" : "关闭",
              style: TextStyle(color: Colors.white),
            ),
            decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
          ),
          onTap: () {
            isFlag = !isFlag;
            if (isFlag) {
              width = 200;
              secondWidth = 300;
              rightdWidth=500;
            } else {
              width = 0;
              secondWidth = 0;
              rightdWidth=0;
            }
            setState(() {});
          },
        ),
      ],
    );
  }
}

class List extends StatelessWidget {
  final String tabKey;

  List(this.tabKey);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.all(0),
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
