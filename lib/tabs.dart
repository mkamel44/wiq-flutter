import 'package:flutter/material.dart';
import 'package:wiq/screens/amazon.dart';
import 'package:wiq/screens/google.dart';
import 'package:wiq/screens/google1.dart';

class MyTabs extends StatefulWidget {
  @override
  _MyTabsState createState() => _MyTabsState();
}

class _MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 1, vsync: this);
  }

  // dispose function
  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        child: TabBar(
          controller: tabController,
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.blue,
          labelStyle: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
          tabs: <Tab>[
            Tab(
              text: "",
            ),
            /*
            Tab(
              text: "قائمة المهام",
            ),
             */
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          //AplicativoB2b(),
          AmazonScreen(),
        ],
      ),
    );
  }
}
