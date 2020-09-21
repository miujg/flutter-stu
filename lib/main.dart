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
        '/': (context) => RouterTestRoute(),
        'echo': (context) => EchoRoute(),
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

// 首页
// StatefulWidget 有状态组件 状态在widget的生命周期中可以改变
// StatelessWidget 无状态组件
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.text}) : super(key: key);
  final String title;
  final String text;

  // State类
  @override
  _MyHomePageState createState() => _MyHomePageState(text: 'yyyy');
}

// State状态
class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState({Key key, @required this.text});

  final String text;

  // 记录数目
  int _counter = 0;

  // 点击按钮的时候 调用此函数
  void _incrementCounter() {
    // 改变状态 然后通知Flutter 执行build方法
    setState(() => _counter++);
  }

  // 构建ui界面 返回一个Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // Center 对齐在屏幕中心
      body: Center(
        // 垂直方向排列组件
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text('$text'),
            FlatButton(
              child: Text('go to route'),
              textColor: Colors.red,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    // 新打开路由时传参
                    return NewRoute(
                      text: 'xxxx',
                    );
                  },
                ));
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class NewRoute extends StatelessWidget {
  // 路由接受参数例子
  NewRoute({Key key, @required this.text}) : super(key: key);

  // 用于接受参数
  String text;
  final String name = '111';

  @override
  Widget build(Object context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('new roter'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text),
          FlatButton(
            child: Text('return'),
            textColor: Colors.red,
            onPressed: () {
              Navigator.pop(context, 'yyyyy');
            },
          )
        ],
      )),
    );
  }
}

/**
 * 路由传参例子
 */

class RouterTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () async {
          print('通过路由发送值');
          Navigator.pushNamed(context, 'echo', arguments: [1, 2, 3, 4]);
        },
      ),
    );
  }
}

class TipRoute extends StatelessWidget {
  TipRoute({
    Key key,
    @required this.text, // 接收一个text参数
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('tipRouter')),
      body: Center(
        child: Column(
          children: [
            Text('$text'),
            FlatButton(
              child: Text('返回'),
              onPressed: () {
                Navigator.pop(context, 'xxxx');
              },
            )
          ],
        ),
      ),
    );
  }
}

class EchoRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //获取路由参数
    var args = ModalRoute.of(context).settings.arguments;
    print(args);
    //...省略无关代码
    return Scaffold(
      appBar: AppBar(title: Text('echo')),
      body: Center(
        child: Column(
          children: [Text('xxxx')],
        ),
      ),
    );
  }
}
