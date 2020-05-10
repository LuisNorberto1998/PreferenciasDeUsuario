import 'package:flutter/material.dart';
import 'package:preferenciasusuarioapp/src/widgets/menu_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario = false;
  int _genero = 1;
  String _nombre = 'Pedro';

  TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _cargarPref();
    _textEditingController = new TextEditingController(text: _nombre);
  }

  _cargarPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _genero = prefs.getInt('genero');
    });
  }

  _setSelectedRadio(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('genero', value);
    setState(() {
      _genero = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        drawer: MenuWidget(),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            SwitchListTile(
              value: _colorSecundario,
              onChanged: (value) {
                setState(() {
                  _colorSecundario = value;
                });
              },
              title: Text('Color secundario'),
            ),
            RadioListTile(
                value: 1,
                title: Text('Masculino'),
                groupValue: _genero,
                onChanged: _setSelectedRadio),
            RadioListTile(
                value: 2,
                title: Text('Femenino'),
                groupValue: _genero,
                onChanged: _setSelectedRadio),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                    labelText: 'Nombre',
                    helperText: 'Nombre de la persona usando el telefono'),
                onChanged: (value) {},
              ),
            ),
          ],
        ));
  }
}
