import 'package:flutter/material.dart';

class TagDetail extends StatelessWidget {
  final String tag;

  TagDetail({required this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails du tag'),
      ),
      body: Center(
        child: Text(
          'Détails pour $tag',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
