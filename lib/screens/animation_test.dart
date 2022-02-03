import 'package:blitzz/theme.dart';
import 'package:flutter/material.dart';

class AnimationTest extends StatefulWidget {
  const AnimationTest({Key? key}) : super(key: key);

  @override
  State<AnimationTest> createState() => _AnimationTestState();
}

class _AnimationTestState extends State<AnimationTest>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 1500),
    vsync: this,
  );
  late final Animation<Offset> _offsetAnimation1 = Tween<Offset>(
    begin: const Offset(3.0, -1.0),
    end: const Offset(3.0, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  ));
  late final Animation<Offset> _offsetAnimation2 = Tween<Offset>(
    begin: const Offset(3.0, 1.0),
    end: const Offset(3.0, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  ));

  @override
  void initState() {
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _theme = OurTheme();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Row(
          children: [
            SlideTransition(
              position: _offsetAnimation1,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width * 0.2,
                color: _theme.secondaryColor,
              ),
            ),
            SlideTransition(
              position: _offsetAnimation2,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width * 0.2,
                color: _theme.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
