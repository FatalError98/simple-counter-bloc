import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';

import '../../../../core/theme/colors/colors.dart';

void openAnimatedDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: kScaffoldBackGroundColor,
      elevation: 0,
      title: const Text(
        'Simple Counter',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: const SizedBox(
        height: 100,
        child: Column(
          children: [
            Text(
              'Simple Counter to learing the basics of flutter, bloc state management, and setup a clean architucture.',
              textAlign: TextAlign.center,
            ),
            Gap(10),
            Text(
              'By Ammar Talal',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
      titlePadding: const EdgeInsets.only(top: 16),
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      actionsPadding: const EdgeInsets.only(bottom: 16),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        IconButton.outlined(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.close_rounded))
      ],
    )
        .animate()
        .fade(delay: const Duration(milliseconds: 240))
        .moveY(duration: const Duration(milliseconds: 240)),
  );
}
