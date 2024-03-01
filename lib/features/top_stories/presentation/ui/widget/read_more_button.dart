import 'package:flutter/material.dart';

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
