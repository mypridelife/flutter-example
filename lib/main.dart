import 'package:flutter/material.dart';
import 'package:hello_provider/example/animation_button.dart';
import 'package:hello_provider/example/bottom_appbar/bottom_appbar.dart';
import 'package:hello_provider/example/bottom_appbar/bottom_appbar2.dart';
import 'package:hello_provider/example/frosted_glass_demo.dart';
import 'package:hello_provider/example/navigator_demo/bottom_navigation_widget.dart';
import 'package:hello_provider/example/navigator_demo/navigation_keep_alive.dart';
import 'package:hello_provider/example/provider_demo.dart';
import 'package:hello_provider/example/router_transition/pages.dart';
import 'package:hello_provider/model/CounterModel.dart';
import 'package:provider/provider.dart';

void main() {
  final counter = CounterModel();
  final textSize = 48;

  runApp(Provider<int>.value(
    value: textSize,
    child: ChangeNotifierProvider.value(
      value: counter,
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: RouterPage(),
      ),
    );
  }
}

class RouterPage extends StatelessWidget {
  const RouterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          OutlineButton(
            child: Text("animation demo"),
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AnimationButton())),
          ),
          OutlineButton(
            child: Text("provider demo"),
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => FirstScreen())),
          ),
          OutlineButton(
            child: Text("navigator demo"),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => BottomNavigationWidget())),
          ),
          OutlineButton(
            child: Text("navigator keep alive demo"),
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => NavigationKeepAlive())),
          ),
          OutlineButton(
            child: Text("bottom appbar demo"),
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => BottomAppBarDemo())),
          ),
          OutlineButton(
            child: Text("bottom appbar2 demo"),
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => BottomAppBarDemo2())),
          ),
          OutlineButton(
            child: Text("router transition demo"),
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => FirstPage())),
          ),
          OutlineButton(
            child: Text("FrostedGlass demo"),
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => FrostedGlassDemo())),
          ),
        ],
      ),
    );
  }
}
