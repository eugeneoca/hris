import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MultiValuelistenableBuilder extends StatelessWidget {
  final List<ValueListenable> valueListenables;
  final Widget Function(
      BuildContext context, List<dynamic> values, Widget? child) builder;
  final Widget? child;
  const MultiValuelistenableBuilder(
      {super.key,
      required this.valueListenables,
      required this.builder,
      this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge(valueListenables),
      builder: (context, child) {
        final list = valueListenables.map((listenable) => listenable.value);
        return builder(context, List<dynamic>.unmodifiable(list), child);
      },
      child: child,
    );
  }
}
