import 'package:flutter/material.dart';

/// Button that changes color state when set by [isSelected] parameter
class TypeButton extends StatelessWidget {
  const TypeButton({
    required this.onTap,
    required this.icon,
    required this.isSelected,
    super.key,
  });
  final VoidCallback onTap;
  final IconData icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Icon(
          icon,
          color: isSelected
              ? Theme.of(context).primaryColor
              : Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }
}
