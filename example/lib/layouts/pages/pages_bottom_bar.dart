import 'package:example/layouts/_layouts.dart';
import 'package:flutter/material.dart';

class UiPagesBottomBar extends StatelessWidget {
  const UiPagesBottomBar(
      {super.key,
      required this.count,
      required this.currentPage,
      this.onPressedPrev,
      this.onPressedNext});

  final int count;
  final int currentPage;

  final VoidCallback? onPressedPrev;
  final VoidCallback? onPressedNext;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
                child: UiPagesProgressIndicator(
                    length: count, current: currentPage)),
            if (onPressedPrev != null)
              IconButton(
                  onPressed: onPressedPrev,
                  icon: Icon(Icons.keyboard_arrow_left)),
            if (onPressedNext != null)
              IconButton(
                  onPressed: onPressedNext,
                  icon: Icon(Icons.keyboard_arrow_right)),
          ],
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
