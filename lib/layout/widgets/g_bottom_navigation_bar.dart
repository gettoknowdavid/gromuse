import 'package:flutter/material.dart';

class GBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int>? onTap;
  final bool enableFeedback;
  final List<BottomNavigationBarItem> items;
  final double? elevation;
  final Color? backgroundColor;
  final double? iconSize;
  final Color? selectedColor;

  const GBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.items,
    this.enableFeedback = true,
    this.onTap,
    this.elevation,
    this.backgroundColor,
    this.iconSize,
    this.selectedColor,
  });

  @override
  State<GBottomNavigationBar> createState() => _GBottomNavigationBarState();
}

class _GBottomNavigationBarState extends State<GBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bottomTheme = theme.bottomNavigationBarTheme;

    final additionalBottomPadding = MediaQuery.viewPaddingOf(context).bottom;

    return _Bar(
      elevation: widget.elevation ?? bottomTheme.elevation ?? 0.0,
      color: widget.backgroundColor ?? bottomTheme.backgroundColor,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: kBottomNavigationBarHeight + additionalBottomPadding,
        ),
        child: Material(
          type: MaterialType.transparency,
          borderRadius: BorderRadius.circular(100),
          clipBehavior: Clip.hardEdge,
          child: Padding(
            padding: EdgeInsets.only(bottom: additionalBottomPadding),
            child: MediaQuery.removePadding(
              context: context,
              removeBottom: false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _createTiles(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _createTiles() {
    final colorScheme = Theme.of(context).colorScheme;
    final localizations = MaterialLocalizations.of(context);

    final List<Widget> tiles = <Widget>[];

    for (int i = 0; i < widget.items.length; i++) {
      tiles.add(
        _BottomNavigationTile(
          key: widget.items[i].key,
          widget.items[i],
          widget.iconSize ?? 24.0,
          enableFeedback: widget.enableFeedback,
          selected: widget.currentIndex == i,
          iconColor: colorScheme.onBackground,
          selectedColor:
              widget.selectedColor ?? colorScheme.secondary.withOpacity(0.4),
          onTap: () => widget.onTap?.call(i),
          indexLabel: localizations.tabLabel(
            tabIndex: i + 1,
            tabCount: widget.items.length,
          ),
        ),
      );
    }

    return tiles;
  }
}

class _Bar extends StatelessWidget {
  final Widget child;
  final double elevation;
  final Color? color;

  const _Bar({
    required this.child,
    required this.elevation,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(56, 0, 56, 20),
      child: Material(
        elevation: elevation,
        color: color,
        borderRadius: BorderRadius.circular(100),
        child: child,
      ),
    );
  }
}

class _BottomNavigationTile extends StatelessWidget {
  final BottomNavigationBarItem item;
  final double iconSize;
  final VoidCallback? onTap;
  final bool selected;
  final String? indexLabel;
  final bool enableFeedback;
  final Color selectedColor;
  final Color iconColor;

  const _BottomNavigationTile(
    this.item,
    this.iconSize, {
    super.key,
    required this.enableFeedback,
    required this.selected,
    required this.selectedColor,
    required this.iconColor,
    this.onTap,
    this.indexLabel,
  });

  @override
  Widget build(BuildContext context) {
    final String? effectiveTooltip = item.tooltip == '' ? null : item.tooltip;

    Widget result = InkResponse(
      onTap: onTap,
      enableFeedback: enableFeedback,
      borderRadius: BorderRadius.circular(100),
      child: _TileIcon(
        iconSize: iconSize,
        selected: selected,
        item: item,
        selectedColor: selectedColor,
        iconColor: iconColor,
      ),
    );

    if (effectiveTooltip != null) {
      result = Tooltip(
        message: effectiveTooltip,
        preferBelow: false,
        verticalOffset: iconSize,
        excludeFromSemantics: true,
        child: result,
      );
    }

    result = Semantics(
      selected: selected,
      container: true,
      child: Stack(
        children: <Widget>[
          result,
          Semantics(label: indexLabel),
        ],
      ),
    );

    return Expanded(child: result);
  }
}

class _TileIcon extends StatelessWidget {
  final double iconSize;
  final bool selected;
  final BottomNavigationBarItem item;
  final Color selectedColor;
  final Color iconColor;

  const _TileIcon({
    required this.iconSize,
    required this.selected,
    required this.item,
    required this.selectedColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final defaultIconTheme = IconThemeData(size: iconSize, color: iconColor);

    final activeIcon = Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: kBottomNavigationBarHeight * 0.8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: selectedColor,
          ),
        ),
        item.activeIcon,
      ],
    );

    return Align(
      alignment: Alignment.topCenter,
      heightFactor: 1.0,
      child: IconTheme(
        data: defaultIconTheme,
        child: selected ? activeIcon : item.icon,
      ),
    );
  }
}
