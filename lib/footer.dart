import 'package:flutter/material.dart';
import 'choice_item.dart';

class Footer extends StatelessWidget {
  final Function(String) onChoiceSelected;
  final List<String> selectedChoices;

  Footer({required this.onChoiceSelected, required this.selectedChoices});

  final List<String> choices = [
    "Cinéma",
    "Pétanque",
    "Fitness",
    "League of Legends",
    "Basket",
    "Shopping",
    "Programmation",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Wrap(
        children: choices.map((choice) {
          return ChoiceItem(
            choice: choice,
            isSelected: selectedChoices.contains(choice),
            onSelected: onChoiceSelected,
          );
        }).toList(),
      ),
    );
  }
}
