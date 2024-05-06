import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gromuse/config/config.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class GTextFormField extends StatefulWidget {
  const GTextFormField({
    required this.label,
    this.hint,
    this.enabled,
    this.keyboardType,
    this.onChanged,
    this.isPassword = false,
    this.prefixIcon,
    super.key,
  });

  final String label;
  final String? hint;
  final bool? enabled;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final bool isPassword;
  final IconData? prefixIcon;

  @override
  State<GTextFormField> createState() => _GTextFormFieldState();
}

class _GTextFormFieldState extends State<GTextFormField> {
  bool obscureText = false;

  Widget? suffixWidget, prefixWidget;

  @override
  Widget build(BuildContext context) {
    if (widget.prefixIcon != null) {
      prefixWidget = _PrefixIcon(icon: widget.prefixIcon!);
    }

    if (widget.isPassword) {
      suffixWidget = InkWell(
        onTap: () => setState(() => obscureText = !obscureText),
        child: _EyeIcon(obscureText),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(widget.label, style: GTextStyle.caption),
        4.verticalSpace,
        TextFormField(
          enabled: widget.enabled,
          keyboardType: widget.keyboardType,
          onChanged: widget.onChanged,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: widget.hint,
            prefixIcon: prefixWidget,
            suffixIcon: suffixWidget,
          ),
        ),
      ],
    );
  }
}

class _PrefixIcon extends StatelessWidget {
  const _PrefixIcon({required this.icon});
  final IconData icon;

  @override
  Widget build(BuildContext context) => IconTheme(
        data: IconThemeData(
          size: 20.r,
          color: Theme.of(context).inputDecorationTheme.prefixIconColor,
        ),
        child: Icon(icon),
      );
}

class _EyeIcon extends StatelessWidget {
  final bool obscureText;
  const _EyeIcon(this.obscureText);

  @override
  Widget build(BuildContext context) {
    final inputDecoration = Theme.of(context).inputDecorationTheme;

    return Container(
      height: 20.r,
      width: 20.r,
      margin: const EdgeInsets.only(right: 12).r,
      child: IconTheme(
        data: IconThemeData(size: 20.r, color: inputDecoration.prefixIconColor),
        child: obscureText
            ? const Icon(PhosphorIconsBold.eye)
            : const Icon(PhosphorIconsBold.eyeSlash),
      ),
    );
  }
}
