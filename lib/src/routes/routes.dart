import 'package:component/src/pages/alert_page.dart';
import 'package:component/src/pages/animated_container_page.dart';
import 'package:component/src/pages/avatar_page.dart';
import 'package:component/src/pages/card_page.dart';
import 'package:component/src/pages/home_page.dart';
import 'package:component/src/pages/input_page.dart';
import 'package:component/src/pages/list_page.dart';
import 'package:component/src/pages/slider_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getAppRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
    'animatedContainer': (BuildContext context) => AnimatedContainerPage(),
    'input': (BuildContext context) => InputPage(),
    'slider': (BuildContext context) => SliderPage(),
    'list': (BuildContext context) => ListPage(),
  };
}
