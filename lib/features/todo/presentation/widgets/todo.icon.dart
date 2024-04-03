import 'package:Stacked/core/app/app.locator.dart';
import 'package:Stacked/core/app/app.theme.dart';
import 'package:flutter/material.dart';

class TodoIcon extends StatelessWidget {
  final VoidCallback onTap;
  final Icon icon;
  final double? width;
  final Color? backgroundColor;

  const TodoIcon({
    required this.onTap,
    required this.icon,
    this.width,
    this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        width: width ?? 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor ?? locator<AppTheme>().genericWhiteColor,
        ),
        child: Center(child: icon),
      ),
    );
  }
}
