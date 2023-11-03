import 'package:flutter/material.dart';

class SavedArticleScreen extends StatelessWidget {
  static const routeName = '/Saved Article Screen';

  const SavedArticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Saved Articles',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
    );
  }
}
