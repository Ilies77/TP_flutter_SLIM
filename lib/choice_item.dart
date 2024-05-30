import 'package:flutter/material.dart';

class ChoiceItem extends StatelessWidget {
  final String choice;
  final Function(String) onSelected;
  final bool isSelected;

  ChoiceItem({
    required this.choice,
    required this.onSelected,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () => onSelected(choice),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8),
            color: isSelected ? Colors.yellow : Colors.white,
          ),
          child: Text(choice),
        ),
      ),
    );
  }
}
