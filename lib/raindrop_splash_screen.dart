import 'package:flutter/material.dart';
import 'package:raindrop_animated_splash_screen/widget/animation_screen.dart';
import 'package:raindrop_animated_splash_screen/widget/hole_painter.dart';
import 'package:raindrop_animated_splash_screen/widget/staggered_raindrop_animation.dart';


class RaindropSplashScreen extends StatefulWidget {
  const RaindropSplashScreen({
    super.key,
    required this.nextScreen,
    this.title = "Raindrop Made By Yogesh",
    this.textStyle,
    this.color,
    this.duration = const Duration(milliseconds: 3000),
  });

  /// The screen to show after splash ends
  final Widget nextScreen;

  /// Text below splash
  final String title;

  /// Raindrop color
  final Color? color;

  /// Duration of animation
  final Duration duration;

  /// Text style of title
  final TextStyle? textStyle;

  @override
  State<RaindropSplashScreen> createState() => _RaindropSplashScreenState();
}

class _RaindropSplashScreenState extends State<RaindropSplashScreen>
    with SingleTickerProviderStateMixin {
  Size size = Size.zero;
  late AnimationController _controller;
  late StaggeredRaindropAnimation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = StaggeredRaindropAnimation(_controller);
    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => widget.nextScreen),
        );
      }
    });

    _controller.addListener(() => setState(() {}));
  }

  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: CustomPaint(
              painter: HolePainter(
                color: widget.color ?? Theme.of(context).colorScheme.secondary,
                holeSize: _animation.holeSize.value * size.width,
              ),
            ),
          ),
          Positioned(
            top: _animation.dropPosition.value * size.height,
            left: size.width / 2 - _animation.dropSize.value / 2,
            child: SizedBox(
              width: _animation.dropSize.value,
              height: _animation.dropSize.value,
              child: CustomPaint(
                painter: DropPainter(visible: _animation.dropVisible.value),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Opacity(
                opacity: _animation.textOpacity.value,
                child: Text(
                  widget.title,
                  style: widget.textStyle ?? TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
