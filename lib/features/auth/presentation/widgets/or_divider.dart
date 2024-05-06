import 'package:flutter/material.dart';
import 'package:gromuse/config/config.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Divider()),
        Text('or', style: GTextStyle.caption),
        Expanded(child: Divider()),
      ],
    );
  }
}
