import 'package:bab_news/core/utils/extentions/box_constraints_extentions.dart';
import 'package:flutter/material.dart';

/// Used in cases to present errors
class AppLoadingErrorWidget extends StatelessWidget {
  const AppLoadingErrorWidget({
    required this.retry,
    this.errorMessage = "Loading error, Please try again",
    super.key,
  });
  final String errorMessage;
  final VoidCallback retry;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.report_gmailerrorred,
              color: Colors.red,
              size: constraints.orientedWidth() * 0.5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                errorMessage,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: retry,
              child: const Text("Retry"),
            ),
          ],
        ),
      );
    });
  }
}
