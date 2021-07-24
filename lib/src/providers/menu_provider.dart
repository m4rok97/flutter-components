import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  List<dynamic> options = [];
  _MenuProvider() {
    // loadData();
  }

  Future<List<dynamic>> loadData() async {
    final ans = await rootBundle.loadString('data/menu_opts.json');
    Map dataMap = json.decode(ans);
    options = dataMap['routes'];
    return options;
  }
}

final menuProvider = new _MenuProvider();
