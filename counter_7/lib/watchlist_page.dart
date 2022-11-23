import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:counter_7/models/mywatchlist.dart';
import 'package:counter_7/fetchdata.dart';
import 'package:counter_7/widget_drawer.dart';
import 'package:counter_7/watchlist_detail.dart';

class MyWatchlistPage extends StatefulWidget {
  const MyWatchlistPage({Key? key}) : super(key: key);

  @override
  MyWatchlistPageState createState() => MyWatchlistPageState();
}

class MyWatchlistPageState extends State<MyWatchlistPage> {
  late Future<List<MyWatchlist>> watchlistData;

  Widget loadWidget(List<MyWatchlist> data) {
    return ListView.builder(itemCount: data.length, itemBuilder: (context, index) {
      bool isWatched = data[index].fields.watched;
      MaterialColor borderColor = (isWatched)? Colors.blue: Colors.red;

      return Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: borderColor, // bonus todo: change outline if watched or not watched
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: 
        ListTile(
          title: Text(data[index].fields.title),
          trailing: Checkbox(
            value: isWatched,
            onChanged: (bool? value) {
              setState(() {
                isWatched = value!;
                data[index].fields.watched = value;
                borderColor = (value)? Colors.blue: Colors.red;
              });
            },
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MyWatchlistDetail(data: data[index])));
          },
        ),
      );
    });
  }
  
  @override
  void initState() {
    super.initState();
    watchlistData = fetchMyWatchlist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watchlist'),
      ),
      drawer: const DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: FutureBuilder(
            future: watchlistData,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              }
              else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada watchlist :(",
                        style: TextStyle(
                          color: Color(0xff59A5D8),
                          fontSize: 20
                        ),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                }
                else {
                  return loadWidget(snapshot.data!);
                }
              }
            }
          ),
        ),
      )
        
    );
  }
}