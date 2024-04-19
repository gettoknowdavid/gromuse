import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/widgets.dart';

class LayoutPage extends StatelessWidget {
  const LayoutPage({
    super.key,
    required this.navigationShell,
    required this.children,
  });

  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;

  /// The children (branch Navigators) to display in a custom container
  /// ([AnimatedBranchContainer]).
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBranchContainer(
        currentIndex: navigationShell.currentIndex,
        children: children,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.purple,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'o'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'o'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'o'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: 'o'),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => _onTap(context, index),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
