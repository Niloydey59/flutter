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
        child: (CatalogModels.item!=null) ? GridView.builder(

            scrollDirection: Axis.vertical,
            shrinkWrap: true,

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
            ),
            itemBuilder: (context, index)  {
              final item=CatalogModels.item![index];
              return Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GridTile(
                  header: Container(
                      child: Text(
                          item.name,
                        style: TextStyle(color: Colors.white),
                      ),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                    ),
                  ),
                    child: Image.network(item.image),
                  footer: Container(
                    child: Text(
                      item.price.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                  ),
                ),
              );
            },
          itemCount: CatalogModels.item?.length,
        )
            : Center(
              child: CircularProgressIndicator(),
            )
      ),
      drawer: MyDrawer(),
  );
  }
}
