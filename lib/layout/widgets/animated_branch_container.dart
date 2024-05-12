import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class AnimatedBranchContainer extends StatelessWidget {
  const AnimatedBranchContainer({
    super.key,
    required this.currentIndex,
    required this.children,
  });

  /// The index (in [children]) of the branch Navigator to display.
  final int currentIndex;

  /// The children (branch Navigators) to display in this container.
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {

    return  Stack(
        children: children
            .mapIndexed(
              (index, navigator) => AnimatedScale(
                scale: index == currentIndex ? 1 : 1.5,
                duration: const Duration(milliseconds: 400),
                child: AnimatedOpacity(
                  opacity: index == currentIndex ? 1 : 0,
                  duration: const Duration(milliseconds: 400),
                  child: _branchNavigatorWrapper(index, navigator),
                ),
              ),
            )
            .toList(),
      
    );
  }

  Widget _branchNavigatorWrapper(int index, Widget navigator) => IgnorePointer(
        ignoring: index != currentIndex,
        child: TickerMode(
          enabled: index == currentIndex,
          child: navigator,
        ),
      );
}
