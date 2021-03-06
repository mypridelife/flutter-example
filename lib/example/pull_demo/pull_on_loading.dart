/**
 * 实现原理是，利用ScrollController监听像素是否到达底部，再注入新数据
 */
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class PullOnLoading extends StatefulWidget {
  @override
  _PullOnLoadingState createState() => _PullOnLoadingState();
}

class _PullOnLoadingState extends State<PullOnLoading> {
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
      body: ListView.builder(
          controller: _controller,
          itemCount: images.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
//              constraints: BoxConstraints.tightFor(height: 150.0),
              child: Image.network(
                images[index],
                fit: BoxFit.cover,
              ),
            );
          }),
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
