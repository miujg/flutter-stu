// 字体样式说明

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        home: MyHome());
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('xxxx'),
      ),
      body: Container(
        child: Column(
          children: [
            Text(
              '1111',
              style: TextStyle(
                color: Colors.blue,
              ),
              textAlign: TextAlign.center,
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                text: 'text',
              )
            ])),
            Container(
              width: double.infinity,
              child: Text(
                'xxxxx',
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
