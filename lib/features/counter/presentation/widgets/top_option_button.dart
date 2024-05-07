import 'package:flutter/material.dart';

import '../../../../core/theme/colors/colors.dart';

class TopOptionButton extends StatelessWidget {
  final IconData icon;
  final Function() function;
  const TopOptionButton({
    super.key,
    required this.icon,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: function,
      icon: Icon(
        icon,
        size: 32,
        color: kPrimaryColor,
      ),
    );
  }
}
