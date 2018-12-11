import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

class ToastyAnimation extends StatefulWidget {
  ToastyAnimation();
  final AudioCache player = new AudioCache();

  @override
  _ToastyAnimationState createState() => _ToastyAnimationState();
}

class _ToastyAnimationState extends State<ToastyAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    playToasty();
  }

  void playToasty() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );

    _animation = Tween(begin: 0.4, end: 0.0).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn))
      ..addStatusListener(_backToasty);

      
    //widget.player.play('toasty.mp3');
   
    _animationController.forward();
      widget.player.play('toasty.mp3');
  }

  void _backToasty(status) {
    if (status == AnimationStatus.completed) {
      _animationController.removeStatusListener(_backToasty);
      _animationController.reset();
      _animation = Tween(begin: 0.0, end: 0.4).animate(
          CurvedAnimation(parent: _animationController, curve: Curves.linear));
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) => Transform(
            transform:
                Matrix4.translationValues(_animation.value * width, 0.0, 0.0),
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/toasty.png'),
              )),
            ),
          ),
    );
  }
}
