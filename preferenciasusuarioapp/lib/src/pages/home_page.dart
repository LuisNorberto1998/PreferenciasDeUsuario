import 'package:flutter/material.dart';
import 'package:preferenciasusuarioapp/src/shared_prefs/preferencias_usuario.dart';
import 'package:preferenciasusuarioapp/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de usuario'),
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color secunadrio'),
          Divider(),
          Text('Género: ${prefs.genero}'),
          Divider(),
          Text('Nombre de usuarioa'),
          Divider(),
        ],
      ),
    );
  }
}
