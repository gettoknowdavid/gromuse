import 'package:flutter/material.dart';
import 'package:gromuse/config/config.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Text.rich(
      TextSpan(
        style: GTextStyle.display,
        children: [
          const TextSpan(text: 'Let\'s Buy Your '),
          TextSpan(
            text: 'Daily\nGrocery',
            style: GTextStyle.display.copyWith(color: colors.secondary),
          ),
          const TextSpan(text: ' Easily'),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
