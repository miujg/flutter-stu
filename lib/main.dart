// 导入 material ui 库
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// 导入工具库
import 'package:flu_app/util/dio.dart';
import 'package:http/http.dart' as http;

// 应用入口
void main() {
  runApp(MyApp());
}

// 无状态组件
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // 主题
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // 路由表注册
      routes: {
        '/': (context) => MyHomePage(),
      },
      // 钩子函数注册
      // 对命名路由进行校验
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          print('拦截命名路由');
        });
      },
      // 主页，路由
      // home: RouterTestRoute(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.pageData});
  final Object pageData;

  // @override
  _MyHomePageState createState() => new _MyHomePageState();
}

// modal类
class GkpageData {
  final int code;
  final dynamic data;
  final List datas;
  GkpageData({this.code, this.data, this.datas});
  factory GkpageData.fromJson(Map<String, dynamic> json) {
    return new GkpageData(
      code: json['code'],
      data: json['data'],
      datas: json['datas'],
    );
  }
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return new Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

//http://10.10.0.14:8766/dataserver/school/8bbbbab74e7dcd1f3a97f68f73825e85/index

Future<GkpageData> getGkpageData() async {
  Response response = await dio.get('/dataserver/common/icon/init?position=1');
  return new GkpageData.fromJson(new Map<String, dynamic>.from(response.data));
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(Object context) {
    return new Container(
      child: FutureBuilder<GkpageData>(
        future: getGkpageData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List list8 = snapshot.data.data['data_8'];
            List list12 = snapshot.data.data['data_12'];
            List list9 = snapshot.data.data['data_9'];
            return Scaffold(
              backgroundColor: Colors.white,
              body: Container(
                // padding: const EdgeInsets.fromLTRB(20.0, 20, 20.0, 20.0),
                child: Column(
                  children: [
                    // 切换至高一
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      margin: EdgeInsets.only(bottom: 5.0, top: 30),
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              '升学定向',
                              style: TextStyle(
                                color: Color.fromRGBO(102, 102, 102, 1),
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '切换至高一',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Color.fromRGBO(58, 173, 172, 1),
                                fontSize: 14,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    // 专业测评-了解职业
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Flex(
                        direction: Axis.horizontal,
                        children: list8.map<Widget>((e) {
                          return Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                Image(
                                  image: NetworkImage(e['apppic']),
                                  width: 50,
                                  height: 50,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      // color: Colors.red,
                                      width: 110,
                                      padding: const EdgeInsets.fromLTRB(
                                          2, .0, .0, 3.0),
                                      child: Text(
                                        e['title'],
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                      width: 110,
                                      // color: Colors.blue,
                                      padding: const EdgeInsets.fromLTRB(
                                          2, .0, .0, .0),
                                      child: Text(
                                        e['description'],
                                        style: TextStyle(fontSize: 12),
                                        textAlign: TextAlign.left,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                    // 线条
                    Container(
                      height: 5,
                      color: Color.fromRGBO(204, 204, 204, 1),
                      margin: EdgeInsets.only(top: 20),
                    ),
                    // 高考数据
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 15),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 8),
                            child: Flex(
                              direction: Axis.horizontal,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    '高考数据',
                                    style: TextStyle(
                                      color: Color.fromRGBO(102, 102, 102, 1),
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    '分类考试',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color.fromRGBO(58, 173, 172, 1),
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Flex(
                            direction: Axis.horizontal,
                            children: list9.map<Widget>((e) {
                              return Expanded(
                                  flex: 1,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color(
                                              int.parse('0xff' + e['color'])),
                                        ),
                                        width: 67,
                                        height: 59,
                                      ),
                                      Positioned(
                                        top: 10,
                                        child: Image(
                                          image: NetworkImage(e['apppic']),
                                          height: 21,
                                          width: 21,
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 8,
                                        child: Text(
                                          e['title'],
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ));
                            }).toList(),
                          )
                        ],
                      ),
                    ),
                    // 底部
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Column(children: [
                        Container(
                          width: 1000,
                          padding: EdgeInsets.only(left: 9),
                          margin: EdgeInsets.only(top: 14, bottom: 8),
                          child: Text(
                            '志愿方案',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(102, 102, 102, 1)),
                          ),
                        ),
                        Column(
                          children: list12.map<Widget>((e) {
                            return Container(
                              child: Flex(
                                direction: Axis.horizontal,
                                children: [
                                  Container(
                                    height: 42,
                                    width: 42,
                                    margin: EdgeInsets.only(bottom: 10),
                                    child: Image(
                                      image: NetworkImage(e['apppic']),
                                      width: 42,
                                      height: 42,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 1000,
                                          padding: EdgeInsets.only(left: 10),
                                          child: Text(
                                            e['title'],
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromRGBO(
                                                    26, 26, 26, 1)),
                                          ),
                                        ),
                                        Container(
                                          width: 1000,
                                          padding: EdgeInsets.only(left: 10),
                                          child: Text(
                                            e['description'],
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    153, 153, 153, 1)),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          }).toList(),
                        )
                      ]),
                    )
                    //
                  ],
                ),
              ),
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
