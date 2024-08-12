import 'package:flutter/material.dart';
import 'package:lugia/core/widgets/app_bar_simple.dart';
import 'package:lugia/core/widgets/scaffold.dart';

class CreationDetailScreen extends StatelessWidget {
  const CreationDetailScreen({
    super.key,
    required this.items,
  });

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return FreudScaffold(
      appBar: const FreudAppBarSimple(title: 'Result'),
      builder: (context, padding) {
        return SingleChildScrollView(
          padding: padding.copyWith(
            top: padding.top + 8,
            bottom: padding.bottom + 8,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.network(items[0]),
                ),
              ],
            ),
          ),
        );
      },
    );
  }}
