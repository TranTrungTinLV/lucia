import 'package:flutter/material.dart';

import 'package:lugia/core/theme.dart';

class FreudFieldLabel extends StatelessWidget {
  const FreudFieldLabel({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        text,
        style: textTheme.bodySmall!.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
