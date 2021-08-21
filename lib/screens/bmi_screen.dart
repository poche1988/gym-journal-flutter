import 'package:flutter/material.dart';
import '../shared/bottom_navigator.dart';
import '../shared/menu_drawer.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final TextEditingController txtHeight = TextEditingController();
  final TextEditingController txtWeight = TextEditingController();
  String heightMessage = '';
  String weightMessage = '';

  final double fontSize = 18;
  String result = '';
  bool isMetric = true;
  bool isImperial = false;
  double? height;
  double? weight;
  late List<bool> isSelected;

  @override
  void initState() {
    isSelected = [isMetric, isImperial];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    heightMessage =
        'Please insert your height in ' + ((isMetric) ? 'meters' : 'inches');
    weightMessage =
        'Please insert your weight in ' + ((isMetric) ? 'Kg' : 'pounds');
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator')),
      drawer: MenuDrawer(),
      bottomNavigationBar: BottomNavigator(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ToggleButtons(
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Metric',
                        style: TextStyle(fontSize: fontSize),
                      )),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Imperial',
                        style: TextStyle(fontSize: fontSize),
                      )),
                ],
                isSelected: isSelected,
                onPressed: selectMetricOrImperial,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: TextField(
                controller: txtHeight,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: heightMessage),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: TextField(
                controller: txtWeight,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: weightMessage),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: ElevatedButton(
                  onPressed: calculateBMI,
                  child: Text(
                    'Calculate BMI',
                    style: TextStyle(fontSize: fontSize),
                  )),
            ),
            Text(
              result,
              style: TextStyle(fontSize: fontSize),
            )
          ],
        ),
      ),
    );
  }

  void calculateBMI() {
    double bmi = 0;
    double height = double.tryParse(txtHeight.text) ?? 0;
    double weight = double.tryParse(txtWeight.text) ?? 0;

    if (isMetric) {
      bmi = weight / (height * height);
    } else {
      bmi = weight * 703 / (height * height);
    }

    setState(() {
      result = 'Your BMI is ' + bmi.toStringAsFixed(2);
    });
  }

  void selectMetricOrImperial(value) {
    if (value == 0) {
      isMetric = true;
      isImperial = false;
    } else {
      isMetric = false;
      isImperial = true;
    }
    setState(() {
      isSelected = [isMetric, isImperial];
    });
  }
}
