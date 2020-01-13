/// 尝试通过transform加stateless实现动画

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationButton extends StatefulWidget {
  AnimationButton({Key key}) : super(key: key);

  @override
  _AnimationButtonState createState() => _AnimationButtonState();
}

class _AnimationButtonState extends State<AnimationButton>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;
  int position = 300;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animation = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(curve: Curves.easeInOut, parent: animationController));
    animationController.addListener(animationListener);
    animationController.addStatusListener(animationStatusListener);
  }

  @override
  void dispose() {
    animationController?.removeStatusListener(animationStatusListener);
    animationController?.removeListener(animationListener);
    animationController?.dispose();
    super.dispose();
  }

  void animationListener() => setState(() {
        print(animation.value);
      });

  void animationStatusListener(status) {
    switch (status) {
      case AnimationStatus.dismissed:
        print("dismissed");
        break;
      case AnimationStatus.completed:
        print("completed");
        // animationController.reverse();
        break;
      case AnimationStatus.reverse:
        print("reverse");
        break;
      case AnimationStatus.forward:
        print("forward");
        break;
    }
  }

  changePosition() {
    print("change position");
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            // mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Positioned(
                left: 0,
                right: 0,
                top: position * animation.value,
                child: Center(
                  child: OutlineButton(
                    onPressed: changePosition,
                    child: Text("改变位置"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
