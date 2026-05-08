import 'package:flutter/material.dart';
import 'package:rpg/models/character.dart';
import 'package:rpg/theme.dart';

class Heart extends StatefulWidget {
  final Character character;
  const Heart({super.key, required this.character});

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _sizeAnimation = Tween<double>(begin: 25.0, end: 40).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // size animation tween
    /*  _sizeAnimation = TweenSequence([
      TweenSequenceItem<double>(tween: Tween(begin: 25, end: 40), weight: 50),
      TweenSequenceItem<double>(tween: Tween(begin: 40, end: 25), weight: 50),
    ]).animate(_controller); */
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, child) {
        return IconButton(
          onPressed: () {
            _controller.forward().then((_) => _controller.reverse());
            // Handle heart button press
            widget.character.toggleIsFav();
          },
          icon: Icon(
            Icons.favorite,
            color: widget.character.isFav
                ? AppColors.primaryAccent
                : Colors.grey[800],
            size: _sizeAnimation.value,
          ),
        );
      },
      animation: _controller,
    );
  }
}
