import 'package:flutter/material.dart';
import '../shared/bottom_navigator.dart';
import '../shared/menu_drawer.dart';

class TrainingScreen extends StatelessWidget {
  const TrainingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Training')),
      drawer: MenuDrawer(),
      bottomNavigationBar: BottomNavigator(),
      body: Center(
        child: Text('Training Page'),
      ),
    );
  }
}
