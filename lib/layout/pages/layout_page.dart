import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

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
      bottomNavigationBar: GBottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => _onTap(context, index),
        items: const [
          BottomNavigationBarItem(
            icon: PhosphorIcon(PhosphorIconsRegular.houseSimple),
            activeIcon: PhosphorIcon(
              PhosphorIconsDuotone.houseSimple,
              duotoneSecondaryOpacity: 0.8,
            ),
          ),
          BottomNavigationBarItem(
            icon: PhosphorIcon(PhosphorIconsRegular.list),
            activeIcon: PhosphorIcon(
              PhosphorIconsDuotone.list,
              duotoneSecondaryOpacity: 0.8,
            ),
          ),
          BottomNavigationBarItem(
            icon: PhosphorIcon(PhosphorIconsRegular.heart),
            activeIcon: PhosphorIcon(
              PhosphorIconsDuotone.heart,
              duotoneSecondaryOpacity: 0.8,
            ),
          ),
          BottomNavigationBarItem(
            icon: PhosphorIcon(PhosphorIconsRegular.truck),
            activeIcon: PhosphorIcon(
              PhosphorIconsDuotone.truck,
              duotoneSecondaryOpacity: 0.8,
            ),
          ),
        ],
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
