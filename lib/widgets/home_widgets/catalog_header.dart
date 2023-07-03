import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:myapp/widgets/themes.dart';
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