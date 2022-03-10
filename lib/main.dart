import 'dart:convert';

import 'package:flutter/material.dart';

import 'DummyData.dart';
import 'NewsItemWidget.dart';
import 'NewsResponse.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> implements CardStackListener {
  MaterialColor _color = Colors.pink;
  late List<Widget> widgetList;
  late List<Widget> newsItemList;

  @override
  void addCard(Items? newsItem, int position) {
    print("listener addCard");
  }

  @override
  void removeCard(Widget newsItem, int position) {
    newsItemList.removeAt(position);
    setState(() {
      widgetList = updateWidgetList();
    });
    print("listener removeCard at position : $position");
  }

  @override
  void initState() {
    newsItemList = loadNewsItems();
    widgetList = updateWidgetList();
    updateWidgetList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: widgetList,
      )),
    );
  }

  List<Widget> updateWidgetList() {
    List<Widget> stackWidgetList = List.empty(growable: true);
    List<Widget> widgets = newsItemList;
    for (var i = 0; i < widgets.length; i++) {
      if (i == widgets.length - 3) {
        stackWidgetList.add(Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(right: 40, left: 40),
              child: widgets[i],
            )));
      } else if (i == widgets.length - 2) {
        stackWidgetList.add(Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 15, right: 20, left: 20),
              child: widgets[i],
            )));
      } else if (i == widgets.length - 1) {
        stackWidgetList.add(Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 30),
              child: widgets[i],
            )));
      } else {
        stackWidgetList.add(Align(
            child: Container(
          margin: const EdgeInsets.only(right: 50, left: 50),
          child: widgets[i],
        )));
      }
    }
    return stackWidgetList;
  }

  List<Widget> loadNewsItems() {
    List<Widget> widgetList = [];
    Map<String, dynamic> newItemUserMap =
        jsonDecode(DummyData.getNewsItemJson());
    var newsResponse = NewsResponse.fromJson(newItemUserMap);
    if (newsResponse.data?.items?.isNotEmpty == true) {
      int index = 0;
      newsResponse.data?.items?.reversed.toList().forEach((element) {
        widgetList.add(
            NewsItemWidget(index: index, newsItem: element, listener: this));
        index++;
      });
      return widgetList;
    } else {
      return widgetList;
    }
  }
}
