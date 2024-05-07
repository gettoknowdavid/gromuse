import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gromuse/config/config.dart';

class RedirectionTextButton extends StatelessWidget {
  const RedirectionTextButton({
    super.key,
    this.title = 'Already got an account? ',
    this.buttonLabel = 'Sign in',
    this.onTap,
  });

  final String title;
  final String buttonLabel;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: GTextStyle.caption,
        children: [
          TextSpan(text: '$title '),
          TextSpan(
            text: buttonLabel,
            style: GTextStyle.captionBold,
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
