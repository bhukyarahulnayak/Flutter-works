import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  bool isFav = false;
  AnimationController _controller;
  Animation _colorA;

  Animation<double> _sizeA;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    _colorA = ColorTween(begin: Colors.grey[400], end: Colors.red).animate(_controller);

    _sizeA = TweenSequence(
      <Tween>
    )

    _controller.addListener(() {
      print(_controller.value);
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        isFav = true;
      }
      if (status == AnimationStatus.dismissed) {
        isFav = false;
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
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext ctx, _) {
          return IconButton(
            icon: Icon(
              Icons.favorite,
              color: _colorA.value,
              size: 30,
            ),
            onPressed: () {
              isFav ? _controller.reverse() : _controller.forward();
            },
          );
        });
  }
}
