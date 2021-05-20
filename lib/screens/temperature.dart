import 'package:flutter/material.dart';
import 'package:temperatura/components/my_text_field.dart';

class TemperatureScreen extends StatefulWidget {
  @override
  _TemperatureScreenState createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  double celsius;
  double fahrenheit;
  double kelvin;

  final celsiusControler = TextEditingController();
  final fahrenheitController = TextEditingController();
  final kelvinController = TextEditingController();

  void clearAll() {
    celsiusControler.text = '';
    fahrenheitController.text = '';
    kelvinController.text = '';
  }

  void celsiusChanged(String text) {
    if (text.isEmpty) {
      clearAll();
      return;
    }
    double celsius = double.parse(text);
    fahrenheitController.text = ((celsius * 1.8) + 32).toStringAsFixed(2);
    kelvinController.text = (celsius + 273).toStringAsFixed(2);
  }

  void fahrenheitChanged(String text) {
    if (text.isEmpty) {
      clearAll();
      return;
    }
    double fahrenheit = double.parse(text);
    celsiusControler.text = ((fahrenheit - 32) / 1.8).toStringAsFixed(2);
    kelvinController.text =
        ((fahrenheit - 32) * 5 / 9 + 273).toStringAsFixed(2);
  }

  void kelvinChanged(String text) {
    if (text.isEmpty) {
      clearAll();
      return;
    }
    double kelvin = double.parse(text);
    celsiusControler.text = (kelvin - 273.15).toStringAsFixed(2);
    fahrenheitController.text =
        ((kelvin - 273.15) * 9 / 5 + 32).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Conversor Temperatura',
        ),
        centerTitle: true,
        backgroundColor: Color(0xff003366),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.restore_sharp,
              size: 32,
            ),
            onPressed: () {
              clearAll();
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.thermostat_outlined,
            size: 150,
            color: Colors.red[900],
          ),
          MyTextField(
            c: celsiusControler,
            f: celsiusChanged,
            label: 'Celsius',
            hint: '35',
            suffix: ' ºC ',
          ),
          MyTextField(
            c: fahrenheitController,
            f: fahrenheitChanged,
            label: 'Fahrenheit',
            hint: '35',
            suffix: ' ºF ',
          ),
          MyTextField(
            c: kelvinController,
            f: kelvinChanged,
            label: 'Kelvin',
            hint: '35',
            suffix: ' K ',
          ),
        ],
      ),
    );
  }
}
