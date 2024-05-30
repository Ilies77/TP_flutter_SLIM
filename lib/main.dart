import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'header.dart';
import 'footer.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Choix Sélecteur',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> selectedChoices = [];
  Color headerColor = Colors.purple;

  void toggleChoice(String choice) {
    setState(() {
      if (selectedChoices.contains(choice)) {
        selectedChoices.remove(choice);
      } else {
        selectedChoices.add(choice);
      }
    });
  }

  void changeHeaderColor(Color color) {
    setState(() {
      headerColor = color;
    });
  }

  void openColorPicker() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Choisissez une couleur'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: headerColor,
              onColorChanged: changeHeaderColor,
            ),
          ),
          actions: [
            TextButton(
              child: Text('Fermer'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choix Sélecteur'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Header(
              selectedChoices: selectedChoices,
              backgroundColor: headerColor, // Pass the header color here
            ),
          ),
          Expanded(
            flex: 1,
            child: Footer(
              onChoiceSelected: toggleChoice,
              selectedChoices: selectedChoices,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openColorPicker,
        child: Icon(Icons.color_lens),
      ),
    );
  }
}
