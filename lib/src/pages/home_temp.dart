import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final options = [
    'One',
    'Two',
    'Three',
    'Four',
    'Five',
    'Six',
    'Seven',
    'Eight',
    'Nine',
    'Ten'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componets Temp'),
      ),
      body: ListView(
        children: _createItemsShort(),
      ),
    );
  }

  List<Widget> _createItems() {
    List<Widget> list = new List<Widget>();
    for (String option in options) {
      final tempWidget = ListTile(
        title: Text(option),
      );
      list..add(tempWidget)..add(Divider());
    }

    return list;
  }

  List<Widget> _createItemsShort() {
    return options.map((option) {
      return Column(
        children: [
          ListTile(
            title: Text(option),
            subtitle: Text('It\'s a number'),
            leading: Icon(Icons.adb),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          Divider()
        ],
      );
    }).toList();
  }
}
