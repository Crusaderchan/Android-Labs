import 'package:flutter/material.dart';
import 'package:lab_7/main.dart';

class V0 extends StatefulWidget {
  @override
  State<V0> createState() => _V0State();

}
class _V0State extends State<V0> {
  double _red = 0;
  double _green = 0;
  double _blue = 0;

  _onChangeRed(double value) {
    setState(() {
      _red = value;
    });
  }
  _onChangeGreen(double value) {
    setState(() {
      _green = value;
    });
  }
  _onChangeBlue(double value) {
    setState(() {
      _blue = value;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text("Red: "),
            Text(_red.toStringAsFixed(2), style: const TextStyle(fontWeight: FontWeight.bold),)
          ],
        ),
        Slider(value: _red, min: 0, max: 248, onChanged: _onChangeRed),
        Row (
          children: [
            const Text("Green: "),
            Text(_green.toStringAsFixed(2), style: const TextStyle(fontWeight: FontWeight.bold),)
          ],
        ),
      Slider(value: _green, min: 0, max: 248, onChanged: _onChangeGreen),
        Row (
          children: [
            const Text("Blue: "),
            Text(_blue.toStringAsFixed(2), style: const TextStyle(fontWeight: FontWeight.bold),)
          ],
        ),
        Slider(value: _blue, min: 0, max: 248, onChanged: _onChangeBlue),
      Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: Color.fromRGBO(_red.toInt(), _green.toInt(), _blue.toInt(), 1),

        ),
     ),
      ],
    );
  }

}