import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ContainerConfig(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Border Radius Chaiger'),
        ),
        body: ConfiguratorScreen(),
      ),
    );
  }
}

class ContainerConfig extends ChangeNotifier {
  double _topLeftBorderRadius = 0;
  double _bottomLeftBorderRadius = 0;
  double _bottomRightBorderRadius = 0;
  double _topRightBorderRadius = 0;

  double get topLeftBorderRadius => _topLeftBorderRadius;
  double get bottomLeftBorderRadius => _bottomLeftBorderRadius;
  double get bottomRightBorderRadius => _bottomRightBorderRadius;
  double get topRightBorderRadius => _topRightBorderRadius;

  void setTopLeftRadius(double value) {
    _topLeftBorderRadius = value;
    notifyListeners();
  }

  void setBottomLeftRadius(double value) {
    _bottomLeftBorderRadius = value;
    notifyListeners();
  }
  void setBottomRightRadius(double value) {
    _bottomRightBorderRadius = value;
    notifyListeners();
  }

  void setTopRightRadius(double value) {
    _topRightBorderRadius = value;
    notifyListeners();
  }
}

// Екран конфігуратора
class ConfiguratorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(child: BlueContainer()),
        ),
        ConfigSliders(),
      ],
    );
  }
}


class BlueContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final config = Provider.of<ContainerConfig>(context);
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(config._topRightBorderRadius),
          topLeft: Radius.circular(config._topLeftBorderRadius),
          bottomRight: Radius.circular(config._bottomRightBorderRadius),
          bottomLeft: Radius.circular(config._bottomLeftBorderRadius),
        ),
      ),
    );
  }
}


class ConfigSliders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final config = Provider.of<ContainerConfig>(context);
    return Column(
      children: [
        SliderSection(
          label: 'Top Left Border Radius',
          value: config.topLeftBorderRadius,
          min: 0,
          max: 100,
          onChanged: (value) => config.setTopLeftRadius(value),
        ),
        SliderSection(
          label: 'Top Right Border Radius',
          value: config.topRightBorderRadius,
          min: 0,
          max: 100,
          onChanged: (value) => config.setTopRightRadius(value),
        ),
        SliderSection(
          label: 'Bottom Left Border Radius',
          value: config.bottomLeftBorderRadius,
          min: 0,
          max: 100,
          onChanged: (value) => config.setBottomLeftRadius(value),
        ),
        SliderSection(
          label: 'Bottom Right Border Radius',
          value: config.bottomRightBorderRadius,
          min: 0,
          max: 100,
          onChanged: (value) => config.setBottomRightRadius(value),
        ),
      ],
    );
  }
}


class SliderSection extends StatelessWidget {
  final String label;
  final double value;
  final double min;
  final double max;
  final ValueChanged<double> onChanged;

  const SliderSection({
    required this.label,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$label: ${value.toStringAsFixed(1)}'),
          Slider(
            value: value,
            min: min,
            max: max,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
