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
    // adwadadawdawdTODO: implement initState
    super.initState();
    loadData();
  }

  loadData()async{
    await Future.delayed(Duration(seconds: 2));
    final catalogJason =
    await rootBundle.loadString("assets/files/catalog.json");
    final decodeData = jsonDecode(catalogJason);
    var productData = decodeData["products"];
    //print(productData);
    CatalogModels.item = List.from(productData)
        .map<Item>((item) => Item.fromMap(item))
    .toList();
    setState(() {});
  }
  Widget build(BuildContext context) {
    //final dummylist = List.generate(20, (index) => CatalogModels.item[0]);
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text('Catalog App')
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModels.item!=null) ? ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: CatalogModels.item?.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: CatalogModels.item![index],
            );
          },
        ):
            Center(
              child: CircularProgressIndicator(),
            )
      ),
      drawer: MyDrawer(),
  );
  }
}
