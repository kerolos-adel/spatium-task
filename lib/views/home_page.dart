import 'package:flutter/material.dart';
import 'package:testspatium/custom_widgets/custom_listview/custom_listview_hot.dart';
import '../custom_widgets/custom_listview/custom_listview_new.dart';
import '../custom_widgets/custom_listview/custom_listview_rising.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("/r/FlutterDev"),
          bottom: const TabBar(tabs: [
            Tab(
              child: Text("Hot"),
            ),
            Tab(
              child: Text("New"),
            ),
            Tab(
              child: Text("Rising"),
            ),
          ],),
        ),
        body: const TabBarView(children: [
            CustomListviewHot(),
            CustomListviewNew(),
            CustomListviewRising(),
          ]
        ),

    ));
  }
}
