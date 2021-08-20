import 'package:flutter/material.dart';
import '../shared/bottom_navigator.dart';
import '../shared/menu_drawer.dart';


class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather')),
      drawer: MenuDrawer(),
      bottomNavigationBar: BottomNavigator(),
      body: Center(
        child: Text('Weather page'),
      ),
    );
  }
}
