import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class PullDownRefreshPullUpLoad extends StatefulWidget {
  @override
  _PullDownRefreshPullUpLoadState createState() => _PullDownRefreshPullUpLoadState();
}

class _PullDownRefreshPullUpLoadState extends State<PullDownRefreshPullUpLoad> {
  List<String> images;
  ScrollController _controller;

  @override
  void initState() {
    super.initState();
    images = List<String>();
    _controller = ScrollController();
    fetchTen();
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        fetchTen();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('pull to loading demo'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await new Future.delayed(const Duration(seconds: 1));
          images.clear();
          fetchTen();
        },
        child: ListView.builder(
            controller: _controller,
            itemCount: images.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {

              return Container(
//              constraints: BoxConstraints.tightFor(height: 150.0),
                child: Image.network(
                  images[index],
                  fit: BoxFit.cover,
                ),
              );
            }),
      ),
    );
  }

  fetch() async {
    final response = await http.get('http://dog.ceo/api/breeds/image/random');
    if (response.statusCode == 200) {
      setState(() {
        images.add(json.decode(response.body)['message']);
      });
    } else {
      throw Exception('Failed to load images');
    }
  }

  fetchTen() {
    for (int i = 0; i < 10; i++) {
      fetch();
    }
  }
}
