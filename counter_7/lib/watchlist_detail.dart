import 'package:counter_7/models/mywatchlist.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/widget_drawer.dart';
import 'package:intl/intl.dart';

class MyWatchlistDetail extends StatelessWidget {
  const MyWatchlistDetail({super.key, required this.data});

  final MyWatchlist data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
      ),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                child: Text(
                  data.fields.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    Table(
                      children: [
                        TableRow(
                          children: [
                            const Text("Release Date:", style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(DateFormat.yMMMd().format(data.fields.releaseDate)),
                          ]
                        ),
                        TableRow(
                          children: [
                            const TableCell(child: Text("Rating:", style: TextStyle(fontWeight: FontWeight.bold))),
                            TableCell(child: Text("${data.fields.rating}/5")),
                          ]
                        ),
                        TableRow(
                          children: [
                            const Text("Status:", style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(data.fields.watched ? "Watched" : "Not Watched"),
                          ]
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    const Text("Review:", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(data.fields.review),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(40),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Back"),
        ),
      )
    );
  }
}