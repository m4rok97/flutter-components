import 'package:flutter/material.dart';
import 'dart:async';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollController = new ScrollController();
  List<int> _numbersList = new List();
  int _lastItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _add9();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lists'),
      ),
      body: Stack(children: [_createList(), _createLoading()]),
    );
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: _obtainPage1,
      child: ListView.builder(
          controller: _scrollController,
          itemCount: _numbersList.length,
          itemBuilder: (context, index) {
            final image = _numbersList[index];
            return FadeInImage(
                fit: BoxFit.cover,
                placeholder: AssetImage('assets/jar-loading.gif'),
                image: NetworkImage(
                    'https://picsum.photos/500/300/?image=$image'));
          }),
    );
  }

  void _add9() {
    for (var i = 0; i < 9; i++) {
      _lastItem++;
      _numbersList.add(_lastItem);
    }

    setState(() {});
  }

  Future _fetchData() async {
    _isLoading = true;
    setState(() {});
    final duration = new Duration(seconds: 2);
    new Timer(duration, respuestaHTTP);
  }

  void respuestaHTTP() {
    _add9();
    _scrollController.animateTo(_scrollController.position.pixels + 10,
        duration: Duration(milliseconds: 250), curve: Curves.fastOutSlowIn);
    _isLoading = false;
  }

  Widget _createLoading() {
    return _isLoading ? _createCircularProgress() : Container();
  }

  Widget _createCircularProgress() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Future<Null> _obtainPage1() {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _numbersList.clear();
      _lastItem++;
      _add9();
    });
    return Future.delayed(duration);
  }
}
