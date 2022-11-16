import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/form.dart';
import 'package:counter_7/counter.dart';
import 'package:counter_7/widget_drawer.dart';
import 'package:intl/intl.dart';

class DataPage extends StatefulWidget {
    const DataPage({super.key, required this.listData});
    final String title = 'Data Budget';
    final List<List<Object?>> listData;

    @override
    State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  final List<Widget> dataWidgets = [];
  
  void loadWidget() {
    for (var data in widget.listData) {
      String judul = data[0] as String;
      int nominal = data[1] as int;
      String jenis = data[2] as String;
      DateTime tanggal = data[3] as DateTime;
      String strTanggal = DateFormat('d/M/y').format(tanggal);

      dataWidgets.add(
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
          ),
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    judul,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Tanggal: $strTanggal',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Text(
                      '$nominal',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Text(
                      jenis,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      );
      dataWidgets.add(
        const SizedBox(height: 10)
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    loadWidget();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // Menambahkan drawer menu
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          child: Column(
            children: dataWidgets,
          ),
        ),
      ),
    );
  }
}