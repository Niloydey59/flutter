import 'package:flutter/material.dart';

class homepage  extends StatelessWidget {

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
      drawer: Drawer(),
  );
  }
}
