import 'package:flutter/material.dart';

import 'package:lugia/core/theme.dart';

class FreudAppBarSimple extends StatelessWidget {
  const FreudAppBarSimple({
    super.key,
    required this.title,
    this.startAction,
    this.endAction,
  });

  final String title;

  final Widget? startAction;

  final Widget? endAction;

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;

    return Container(
      padding: EdgeInsets.only(
        left: padding.left + 8,
        top: padding.top,
        right: padding.right + 8,
        bottom: 8,
      ),
      decoration: BoxDecoration(
        color:  Freud.brown80,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
        boxShadow: [
          BoxShadow(
            color: Freud.gray80.withOpacity(0.01),
            spreadRadius: 0,
            blurRadius: 34,
            offset: const Offset(0, 55),
          ),
          BoxShadow(
            color: Freud.gray80.withOpacity(0.02),
            spreadRadius: 0,
            blurRadius: 21,
            offset: const Offset(0, 21),
          ),
          BoxShadow(
            color: Freud.gray80.withOpacity(0.03),
            spreadRadius: 0,
            blurRadius: 16,
            offset: const Offset(0, 8),
          )
        ],
      ),
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 8),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 48,
                height: 48,
                child: startAction ?? const SizedBox(),
              ),
              Expanded(
                child: Text(
                  title,
                  style: theme.textTheme.titleSmall,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: 48,
                height: 48,
                child: endAction ?? const SizedBox(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
