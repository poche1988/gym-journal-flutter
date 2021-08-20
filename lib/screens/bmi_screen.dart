import 'package:flutter/material.dart';
import '../shared/bottom_navigator.dart';
import '../shared/menu_drawer.dart';

class BmiScreen extends StatelessWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator')),
      drawer: MenuDrawer(),
      bottomNavigationBar: BottomNavigator(),
      body: Center(
        child: FlutterLogo(),
      ),
    );
  }
}
