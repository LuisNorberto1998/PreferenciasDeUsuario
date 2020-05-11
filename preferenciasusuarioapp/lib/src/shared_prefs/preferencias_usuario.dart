import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  //Instancia unica de las preferencias del usuario

  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;
  //Ninguna se usa
  // bool _colorSecundario;
  // int _gener;
  // String _nombre;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  //Get And Set Genero
  get genero {
    return _prefs.getInt('genero') ?? 1;
  }

  set genero(int value) {
    _prefs.setInt('genero', value);
  }
}
