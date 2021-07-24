import 'package:component/src/providers/menu_provider.dart';
import 'package:component/src/utils/icon_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components'),
      ),
      body: _list(),
    );
  }

  _list() {
    return FutureBuilder(
      initialData: [],
      future: menuProvider.loadData(),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listItems(List<dynamic> data, BuildContext context) {
    List<Widget> options = [];
    data.forEach((option) {
      final widgetTemp = ListTile(
        title: Text(option['text']),
        leading: getIconFromString(option['icon']),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.blue,
        ),
        onTap: () {
          Navigator.pushNamed(context, option['route']);
        },
      );
      options..add(widgetTemp)..add(Divider());
    });
    return options;
  }
}
