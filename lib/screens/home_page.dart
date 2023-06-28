import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/models/catalog.dart';
import 'package:myapp/widgets/drawer.dart';
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
                CatalogList().expand()
              else
                Center(child: CircularProgressIndicator()),
            ],
          ),
        ),
      )
  );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.color(MyTheme.darkBluishColor).xl4.bold.make(),
        "Trending Products".text.xl2.make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: CatalogModels.item!.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModels.item![index];
          return CatalogItem(catalog: catalog);
        }
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog}):
  assert(catalog!=null);

  //const CatalogItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          CatalogImage(
            image: catalog.image,
          ),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                //buttonPadding: Vx.mOnly(right: 16),
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  ElevatedButton(
                      onPressed: (){},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            MyTheme.darkBluishColor,
                        ),
                        shape: MaterialStateProperty.all(
                            StadiumBorder()
                        )
                      ),
                      child: "Buy".text.make()
                  )
                ],
              ).pOnly(right: 8)
            ],
          )
          )
          ],
      )
    ).white.roundedLg.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;
  //const CatalogImage({Key? key}) : super(key: key);



  const CatalogImage({super.key, required this.image});
  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    ).box.rounded.p16.color(MyTheme.creamColor).make().p16().w40(context);

  }
}



