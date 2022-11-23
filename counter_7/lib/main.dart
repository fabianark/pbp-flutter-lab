import 'package:counter_7/watchlist_page.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/form.dart';
import 'package:counter_7/counter.dart';
import 'package:counter_7/data.dart';
import 'package:counter_7/widget_drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  // List untuk menyimpan seluruh data budget pengguna
  final List<List<Object?>> _listData = <List<Object?>>[];

  void _addData(List<Object?> data) {
    setState(() {
      _listData.add(data);
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Program Counter',
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
      home: const CounterPage(),
      routes: {
        '/counter': (context) => const CounterPage(),
        '/form': (context) => FormPage(addData: _addData),
        '/data': (context) => DataPage(listData: _listData),
        '/watchlist':(context) => MyWatchlistPage(),
      },
    );
  }
}