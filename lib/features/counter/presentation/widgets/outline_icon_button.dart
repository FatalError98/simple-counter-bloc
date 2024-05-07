import 'package:flutter/material.dart';

class OutlineIconButton extends StatelessWidget {
  final Function() function;
  final IconData icon;
  const OutlineIconButton({
    super.key,
    required this.function,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton.outlined(
      onPressed: function,
      icon: Icon(
        icon,
        size: 40,
      ),
    );
  }
}
