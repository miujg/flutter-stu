// state的生命周期
// 导入 material ui 库
import 'package:flutter/material.dart';

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
        // '/': (context) => MyHomePage(title: 'xxxx'),
        '/': (context) => MyHome(),
        'count': (context) => CounterWidget()
      },
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
      ),
      body: Center(
        child: Column(
          children: [
            FlatButton(
              child: Text('go count'),
              onPressed: () {
                Navigator.pushNamed(context, 'count');
              },
            ),
          ],
        ),
      ),
    );
  }
}

// 计数组件
class CounterWidget extends StatefulWidget {
  CounterWidget({
    Key key,
    this.initValue: 0,
  });

  // 状态
  final int initValue;

  // 返回一个state对象
  @override
  _CounterWidgetState createState() => new _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _count = 0;

  void _incrementCounter() {
    setState(() {
      _count = _count + 1;
      return _count;
    });
  }

  // 从另一个页面跳转触发
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('initState');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('计数器')),
      body: Center(
        child: Column(
          children: [
            Text('$_count'),
            FlatButton(
              child: Text('click me'),
              onPressed: _incrementCounter,
            )
          ],
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactive");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}
