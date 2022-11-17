import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/data.dart';
import 'package:counter_7/counter.dart';
import 'package:counter_7/widget_drawer.dart';
import 'package:intl/intl.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key, required this.addData});
  final String title = 'Form Budget';
  final void Function(List<Object?> data) addData;

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  String judul = "";
  int nominal = 0;
  String jenis = 'Pengeluaran';
  DateTime tanggal = DateTime.now();
  List<String> listJenisBudget = ['Pengeluaran', 'Pemasukan'];
  List<Object?> listIsiForm = <Object?>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // Menambahkan drawer menu
      drawer: const DrawerWidget(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Padding(
                  // Menggunakan padding sebesar 5 pixels
                  padding: const EdgeInsets.all(5),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Judul",
                      // Menambahkan icon agar lebih intuitif
                      icon: const Icon(Icons.title),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik 
                    onChanged: (String? value) {
                      setState(() {
                        judul = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        judul = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Judul tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  // Menggunakan padding sebesar 5 pixels
                  padding: const EdgeInsets.all(5),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Nominal",
                      // Menambahkan icon agar lebih intuitif
                      icon: const Icon(Icons.attach_money),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik 
                    onChanged: (String? value) {
                      setState(() {
                        if (value != null) {
                          nominal = int.parse(value);
                        }
                        else {
                          nominal = 0;
                        }
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        if (value != null) {
                          nominal = int.parse(value);
                        }
                        else {
                          nominal = 0;
                        }
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nominal tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  width: double.infinity,
                  child: ListTile(
                    leading: const Icon(Icons.calculate),
                    title: const Text('Pilih Jenis'),
                    trailing: DropdownButton(
                      value: jenis,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: listJenisBudget.map((String items) {
                        return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          jenis = newValue!;
                        });
                      },
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  width: double.infinity,
                  child: ListTile(
                    leading: const Icon(Icons.calendar_month),
                    title: const Text('Pilih Tanggal'),
                    trailing: TextButton(
                      style: ButtonStyle(
                        side: MaterialStateProperty.all(const BorderSide(color: Colors.grey)),
                      ),
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2099),
                        ).then((value){
                          setState(() {
                            tanggal = value!;
                          });
                        });
                      },
                      child: Text(
                        DateFormat('d/M/y').format(tanggal),
                        style: const TextStyle(color: Color.fromARGB(190, 0, 0, 0)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        listIsiForm.add(judul);
                        listIsiForm.add(nominal);
                        listIsiForm.add(jenis);
                        listIsiForm.add(tanggal);
                        widget.addData(listIsiForm);
                      }
                    },
                    child: const Text(
                      "Simpan",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}