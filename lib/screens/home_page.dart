import 'package:flutter/material.dart';
import 'package:myapp/models/catalog.dart';
import 'package:myapp/widgets/drawer.dart';
import 'package:myapp/widgets/item_widget.dart';

class HomePage  extends StatelessWidget {

  @override
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
