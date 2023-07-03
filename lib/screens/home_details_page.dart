import 'package:flutter/material.dart';
import 'package:myapp/models/catalog.dart';
import 'package:myapp/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
class HomeDetailsPage extends StatelessWidget {
  //const HomeDetailsPage({Key? key}) : super(key: key);

  final Item catalog;

  const HomeDetailsPage({super.key, required this.catalog}):
  assert(catalog!=null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          //buttonPadding: Vx.mOnly(right: 16),
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
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
            ).wh(100, 50)
          ],
        ).p16(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image)
            ).h32(context),
            Expanded(
                child: VxArc(
                  height: 30,
                  edge: VxEdge.TOP,
                  arcType: VxArcType.CONVEY,
                  child: Container(
                      color: Colors.white,
                    width: context.screenWidth,
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        catalog.name.text.xl4.color(MyTheme.darkBluishColor).bold.make(),
                        catalog.desc.text.textStyle(context.captionStyle).xl.make(),
                        10.heightBox,
                   ],
                    ).py64(),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
