import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MovieButton extends StatelessWidget {
  const MovieButton(
      {super.key,
      required this.inputText,
      required this.icon,
      required this.onTap,
      required this.backgroundColor,
      required this.borderSide});

  final String? inputText;
  final Widget icon;
  final Color? backgroundColor;
  final BorderSide borderSide;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 56,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: icon,
        label: Text(
          '$inputText',
        ),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(20),
          shadowColor: Colors.transparent,
          textStyle: const TextStyle(fontSize: 16, color: Colors.white),
          backgroundColor: backgroundColor,
          foregroundColor: Colors.white,
          elevation: 10,
          side: borderSide,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
