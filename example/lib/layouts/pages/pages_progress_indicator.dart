import 'package:flutter/material.dart';

class UiPagesProgressIndicator extends StatelessWidget {
  const UiPagesProgressIndicator({
    required this.length,
    required this.current,
    super.key,
  });

  final int length;
  final int current;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        length,
        (index) => Container(
          width: 16,
          height: 4,
          margin: const EdgeInsets.symmetric(
            horizontal: 2,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: index <= current
                ? Theme.of(context).colorScheme.primary
                : Colors.grey.shade300,
          ),
        ),
      ),
    );
  }
}
