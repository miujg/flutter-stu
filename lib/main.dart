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

Future<GkpageData> getGkpageData() async {
  // final response =
  //     await http.get('https://jsonplaceholder.typicode.com/posts/1');
  // final responseJson = json.decode(response.body);
  // print(responseJson);
  // return new Post.fromJson(responseJson);

  final response = await http
      .get('http://10.10.0.13:8766/dataserver/common/icon/init?position=1');

  // final response = await dio.get('/dataserver/common/icon/init?position=1');
  print(response.body);
  final responseJson = json.decode(response.body);
  return new GkpageData.fromJson(responseJson);
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(Object context) {
    return new Container(
      child: FutureBuilder<GkpageData>(
        future: getGkpageData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            print(snapshot.data.data['data_10']);
            return Scaffold(
              backgroundColor: Colors.white,
              body: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20, 20.0, 20.0),
                child: Column(
                  children: [
                    // 切换至高一
                    Flex(
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
                    // 专业测评-了解职业
                    // ListView:
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
