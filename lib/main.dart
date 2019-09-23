import "package:flutter/material.dart";
import 'package:flutter_app/demo/form_demo.dart';
import 'package:flutter_app/demo/material_components.dart';
import 'package:flutter_app/demo/state/state_management_demo.dart';
import 'package:flutter_app/demo/stream/stream_demo.dart';

import 'demo/basic_demo.dart';
import 'demo/bottom_navigation_bar_demo.dart';
import 'demo/drawer_demo.dart';
import 'demo/layout_demo.dart';
import 'demo/list_demo.dart';
import 'demo/navigator_demo.dart';
import 'demo/sliver_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Home(),
      // home: NavigatorDemo(),
      initialRoute: '/Stream',//要显示的界面内容
      routes: {
        // '/':(context)=>NavigatorDemo(),
        '/': (context) => Home(),
        '/about': (context) => Page(title: 'About'),
        '/form': (context) => FormDemo(),//表单
        '/mdc': (context) => MaterialComponents(),//组件
        '/state-management': (context) => StateManagementDemo(),//小部件状态
        '/Stream': (context) => StramDemo(),//流
      },
      // home: SliverDemo(),
      theme: ThemeData(//公共的主题
        primaryColor: Colors.yellow,
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
        splashColor: Colors.white70,
        accentColor: Color.fromRGBO(3, 54, 255, 1.0),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text('hantongxue'),
          elevation: 4.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              tooltip: '菜单',
              onPressed: () => debugPrint('Search button is pressed.'),
            ),
            // IconButton(
            //   icon: Icon(Icons.arrow_back_ios),
            //   tooltip: 'Navigation',
            //   onPressed: () => debugPrint('Navigation button is pressed.'),
            // ),
          ],
          bottom: TabBar(
            unselectedLabelColor: Colors.black38,
            indicatorColor: Colors.black54,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 1.0,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.local_florist),
              ),
              Tab(
                icon: Icon(Icons.change_history),
              ),
              Tab(
                icon: Icon(Icons.directions_bike),
              ),
              Tab(
                icon: Icon(Icons.view_quilt),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListViewDemo(),
            BasicDemo(),
            LayoutDemo(),
            // ViewDemo(),
            SliverDemo()
          ],
        ),
        drawer: DrawerDemo(),
        bottomNavigationBar: BottomNavigationBarDemo(),
      ),
    );
  }
}
