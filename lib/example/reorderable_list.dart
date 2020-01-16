/**
 * onRecorder函数中，
 * oldIndex代表移动前item的序号
 * newIndex代表移动后item的序号
 * 由于在向后移动的时候，newIndex会因为之前的占位
 * 而多出一个，所以需要处理一下
 */
import 'package:flutter/material.dart';

class ReorderableListViewDemo extends StatefulWidget {
  @override
  _ReorderableListViewDemoState createState() =>
      _ReorderableListViewDemoState();
}

class _ReorderableListViewDemoState extends State<ReorderableListViewDemo> {
  List<String> names = [
    "LeBron James",
    "Kevin Durant",
    "Anthony Davis",
    "James Harden",
    "Stephen Curry",
    "Giannis Antetokounmopo",
    "Joel Embiid",
    "Russell Westbrook",
    "Paul George",
    "Kawhi Leonard",
    "Jeremy Shuhow Lin"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReorderableListView(
        header: AppBar(title: Text('ReorderableListViewDemo')),
        children: names.map(_buildCard).toList(),
        onReorder: _onReorder,
      ),
      // body: ReorderableListView(
      //   children: names
      //       .map((m) => ListTile(
      //             key: ObjectKey(m),
      //             title: Text(m),
      //           ))
      //       .toList(), //不要忘记 .toList()
      //   onReorder: _onReorder,
      // ),
    );
  }

  Widget _buildCard(String name) {
    return SizedBox(
      key: ObjectKey(name),
      height: 100,
      child: Card(
        color: Colors.lightBlueAccent.withOpacity(0.4),
        child: Center(
          child: Text(
            '$name',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  _onReorder(int oldIndex, int newIndex) {
    print("oldIndex$oldIndex");
    print("newIndex$newIndex");
    if (oldIndex < newIndex) newIndex = newIndex - 1;
    var name = names.removeAt(oldIndex);
    names.insert(newIndex, name);
    setState(() {});
  }
}
