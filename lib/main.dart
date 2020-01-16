import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'example/animation_button.dart';
import 'example/bottom_appbar/bottom_appbar.dart';
import 'example/bottom_appbar/bottom_appbar2.dart';
import 'example/expansion/expansion_panel_list.dart';
import 'example/expansion/expansion_tile.dart';
import 'example/form/form_pop_demo.dart';
import 'example/form/will_pop_scpoe_demo.dart';
import 'example/frosted_glass_demo.dart';
import 'example/navigator_demo/bottom_navigation_widget.dart';
import 'example/navigator_demo/navigation_keep_alive.dart';
import 'example/provider_demo.dart';
import 'example/pull_demo/gridview_demo.dart';
import 'example/pull_demo/pull_down_refresh_pull_up_load.dart';
import 'example/pull_demo/pull_on_loading.dart';
import 'example/pull_demo/pull_to_refresh.dart';
import 'example/reorderable_list.dart';
import 'example/router_transition/pages.dart';
import 'example/search_bar/search_bar_demo.dart';
import 'example/sliver_demo.dart';
import 'example/splash_screen.dart';
import 'example/textfiled_foces.dart';
import 'example/wrap_demo.dart';
import 'model/CounterModel.dart';

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
      // home: SplashScreen(),
    );
  }
}

class RouterPage extends StatelessWidget {
  const RouterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: ListView(children: pageList(context)));
  }

  List<Widget> pageList(BuildContext context) {
    return [
      OutlineButton(
        child: Text("PullToRefresh"),
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => PullToRefresh())),
      ),
      OutlineButton(
        child: Text("PullOnLoading"),
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => PullOnLoading())),
      ),
      OutlineButton(
        child: Text("GridviewDemo"),
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => GridviewDemo())),
      ),
      OutlineButton(
        child: Text("PullDownRefreshPullUpLoad"),
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => PullDownRefreshPullUpLoad())),
      ),
      OutlineButton(
        child: Text("WillPopDemo"),
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => WillPopDemo(title: "will pop demo title"))),
      ),
      OutlineButton(
        child: Text("FormPopDemo"),
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => FormPopDemo(title: "form pop demo title",))),
      ),
      OutlineButton(
        child: Text("ExpansionTileDemo"),
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ExpansionTileDemo())),
      ),
      OutlineButton(
        child: Text("ExpansionPanelListDemo"),
        onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ExpansionPanelListDemo())),
      ),
      OutlineButton(
        child: Text("从这里开始倒序"),
      ),
      OutlineButton(
        child: Text("animation demo"),
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => AnimationButton())),
      ),
      OutlineButton(
        child: Text("provider demo"),
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => FirstScreen())),
      ),
      OutlineButton(
        child: Text("navigator demo"),
        onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => BottomNavigationWidget())),
      ),
      OutlineButton(
        child: Text("navigator keep alive demo"),
        onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => NavigationKeepAlive())),
      ),
      OutlineButton(
        child: Text("bottom appbar demo"),
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => BottomAppBarDemo())),
      ),
      OutlineButton(
        child: Text("bottom appbar2 demo"),
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => BottomAppBarDemo2())),
      ),
      OutlineButton(
        child: Text("router transition demo"),
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => FirstPage())),
      ),
      OutlineButton(
        child: Text("FrostedGlass demo"),
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => FrostedGlassDemo())),
      ),
      OutlineButton(
        child: Text("SearchBarDemo"),
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SearchBarDemo())),
      ),
      OutlineButton(
        child: Text("WarpDemo"),
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => WarpDemo())),
      ),
      OutlineButton(
        child: Text("TextFieldFocusDemo"),
        onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => TextFieldFocusDemo())),
      ),
      OutlineButton(
        child: Text("ReorderableListViewDemo"),
        onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ReorderableListViewDemo())),
      ),
      OutlineButton(
        child: Text("SliverScreen"),
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SliverScreen())),
      ),
    ];
  }
}
