import 'package:flutter/material.dart';
import 'Preferences.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  bool isAdult = false;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  _loadPreferences() async {
    var prefs = await Preferences().getPreferences();
    setState(() {
      nameController.text = prefs['name'] ?? '';
      lastNameController.text = prefs['lastName'] ?? '';
      isAdult = prefs['isAdult'] ?? false;
    });
  }

  _onNameChanged() {
    Preferences().savePreferences(
      nameController.text,
      lastNameController.text,
      isAdult,
    );
  }

  _onLastNameChanged() {
    Preferences().savePreferences(
      nameController.text,
      lastNameController.text,
      isAdult,
    );
  }

  _onAgeChanged() {
    Preferences().savePreferences(
      nameController.text,
      lastNameController.text,
      isAdult,
    );
  }

  _onIsAdultChanged(bool value) {
    setState(() {
      isAdult = value;
    });
    Preferences().savePreferences(
      nameController.text,
      lastNameController.text,
      isAdult,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preferences Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Nombre'),
              onChanged: (text) {
                _onNameChanged();
              },
            ),
            TextField(
              controller: lastNameController,
              decoration: InputDecoration(labelText: 'Apellido'),
              onChanged: (text) {
                _onLastNameChanged();
              },
            ),
            SwitchListTile(
              title: Text('Edad > 18'),
              value: isAdult,
              onChanged: _onIsAdultChanged,
            ),
          ],
        ),
      ),
    );
  }
}
