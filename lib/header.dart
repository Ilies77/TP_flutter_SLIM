import 'package:flutter/material.dart';
import 'tag_detail.dart';

class Header extends StatelessWidget {
  final List<String> selectedChoices;
  final Color backgroundColor;

  Header({required this.selectedChoices, required this.backgroundColor});

  void _navigateToDetail(BuildContext context, String tag) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TagDetail(tag: tag),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      width: double.infinity,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Vos choix:\ncliquez sur les choix en dessous!',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(height: 10),
          Wrap(
            children: selectedChoices.map((choice) {
              return GestureDetector(
                onTap: () => _navigateToDetail(context, choice),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Chip(
                    label: Text(choice),
                    backgroundColor: Colors.white,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
