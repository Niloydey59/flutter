import 'package:flutter/material.dart';
import 'package:myapp/widgets/drawer.dart';

class HomePage  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text('Catalog App')
        ),
      ),
      body: Center(
        child: Text('Welcome'),
    ),
      drawer: MyDrawer(),
  );
  }
}
