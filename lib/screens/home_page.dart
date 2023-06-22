import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/models/catalog.dart';
import 'package:myapp/widgets/drawer.dart';
import 'package:myapp/widgets/item_widget.dart';
import 'dart:convert';

class HomePage  extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData()async{
    final catalogJason =
    await rootBundle.loadString("assets/files/catalog.json");
    final decodeData = jsonDecode(catalogJason);
    var productData = decodeData["products"];
    print(productData);

  }
  Widget build(BuildContext context) {
    final dummylist = List.generate(20, (index) => CatalogModels.item[0]);
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text('Catalog App')
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummylist.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummylist[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
  );
  }
}
