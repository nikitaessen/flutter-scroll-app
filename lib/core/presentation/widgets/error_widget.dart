import 'package:flutter/material.dart';

class ErrorPageContent extends StatelessWidget {
  const ErrorPageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Error occured while loading content.'),
      ),
    );
  }
}
