import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _currentValue = 200.0;
  bool _checkBoxValue = false;
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _createSlider(),
            _createCheckBox(),
            _createSwitch(),
            Expanded(child: _createImage()),
          ],
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      divisions: 20,
      label: 'Image Size $_currentValue',
      onChanged: (double value) {
        setState(() {
          _currentValue = value;
        });
      },
      value: _currentValue,
      min: 10.0,
      max: 400.0,
    );
  }

  Widget _createImage() {
    return Image(
        width: _currentValue,
        fit: BoxFit.contain,
        image: NetworkImage(
            'https://www.megaidea.net/wp-content/uploads/2020/03/Batman-clipart-9-958x1024.png'));
  }

  Widget _createCheckBox() {
    return CheckboxListTile(
        title: Text('A checkbox'),
        value: _checkBoxValue,
        onChanged: (value) {
          setState(() {
            _checkBoxValue = value;
          });
        });
  }

  Widget _createSwitch() {
    return SwitchListTile(
        title: Text('A switch'),
        value: _switchValue,
        onChanged: (value) {
          setState(() {
            _switchValue = value;
          });
        });
  }
}
