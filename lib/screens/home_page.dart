import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/models/catalog.dart';
import 'package:myapp/widgets/drawer.dart';
import 'package:myapp/widgets/home_widgets/catalog_header.dart';
import 'package:myapp/widgets/home_widgets/catalog_list.dart';
import 'package:myapp/widgets/item_widget.dart';
import 'package:myapp/widgets/themes.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';

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
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            children: [
              CatalogHeader(),
              if(CatalogModels.item!=null)
                CatalogList().py16().expand()
              else
                Center(child: CircularProgressIndicator()).centered().py16().expand(),
            ],
          ),
        ),
      )
  );
  }
}











