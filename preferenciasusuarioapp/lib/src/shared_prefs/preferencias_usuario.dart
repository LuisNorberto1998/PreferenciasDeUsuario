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

  //Get And Set colorSecundario
  get colorSecundario {
    return _prefs.getBool('colorSecundario') ?? false;
  }

  set colorSecundario(bool value) {
    _prefs.setBool('colorSecundario', value);
  }

  //Get And Set Nombre
  get nombre {
    return _prefs.getString('nombreUsuario') ?? '';
  }

  set nombre(String value) {
    _prefs.setString('nombreUsuario', value);
  }

  //Get And Set de la ultima pagina
  get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? 'home';
  }

  set ultimaPagina(String value) {
    _prefs.setString('ultimaPagina', value);
  }
}
