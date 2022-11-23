import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/counter.dart';
import 'package:counter_7/form.dart';
import 'package:counter_7/data.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Menambahkan clickable menu
          ListTile(
            title: const Text('counter_7'),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.of(context).pushReplacementNamed('/counter');
            },
          ),
          ListTile(
            title: const Text('Tambah Budget'),
            onTap: () {
              // Route menu ke halaman form
              Navigator.of(context).pushReplacementNamed('/form');
            },
          ),
          ListTile(
            title: const Text('Data Budget'),
            onTap: () {
              // Route menu ke halaman data
              Navigator.of(context).pushReplacementNamed('/data');
            },
          ),
          ListTile(
            title: const Text('My Watchlist'),
            onTap: () {
              // Route menu ke halaman my watchlist
              Navigator.of(context).pushReplacementNamed('/watchlist');
            },
          ),
        ],
      ),
    );
  }
}