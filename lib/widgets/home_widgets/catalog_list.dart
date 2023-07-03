import 'package:flutter/material.dart';
import 'package:myapp/screens/home_details_page.dart';
import 'package:myapp/widgets/home_widgets/catalog_image.dart';
import 'package:myapp/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/catalog.dart';

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
          return InkWell(
            onTap: ()=>Navigator.push(
                context, MaterialPageRoute(
                builder: (context) => HomeDetailsPage(
                    catalog: catalog,
                )
            )
            ),
              child: CatalogItem(catalog: catalog)
          );
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
            Hero(
              tag: Key(catalog.id.toString()),
              child: CatalogImage(
                image: catalog.image,
              ),
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