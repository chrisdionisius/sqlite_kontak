import 'package:flutter/material.dart';
import 'package:sqlite_kontak/service/db_helper.dart';

import '../model/kontak.dart';

class ListKontakPage extends StatefulWidget {
  const ListKontakPage({Key? key}) : super(key: key);

  @override
  State<ListKontakPage> createState() => _ListKontakPageState();
}

class _ListKontakPageState extends State<ListKontakPage> {
  List<Kontak> listKontak = [];
  DbHelper dbHelper = DbHelper();

  @override
  void initState() {
    super.initState();
    dbHelper.getAllKontak().then((value) {
      setState(() {
        listKontak = value as List<Kontak>;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
