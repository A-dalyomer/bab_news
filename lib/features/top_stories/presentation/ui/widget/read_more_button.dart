import 'package:flutter/material.dart';

/// Currently only used once as a specific goal button
/// but can be utilized as an app's global button for primary used buttons
class ReadMoreButton extends StatelessWidget {
  const ReadMoreButton({required this.onTap, super.key});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onTap,
      style: ButtonStyle(
        minimumSize: const MaterialStatePropertyAll(
          Size(double.infinity, 60),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
      child: const Text("Read more"),
    );
  }
}
