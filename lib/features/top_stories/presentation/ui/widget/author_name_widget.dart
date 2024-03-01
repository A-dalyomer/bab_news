import 'package:flutter/material.dart';

class AuthorName extends StatelessWidget {
  const AuthorName({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(name, style: Theme.of(context).textTheme.labelLarge),
      ),
    );
  }
}
