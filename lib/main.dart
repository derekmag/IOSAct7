import 'package:flutter/material.dart';
import 'package:ios7/route_generator.dart';

void main() => runApp(derekApp());

class derekApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rutas',
      initialRoute: "/",
      home: PageOne(),
      onGenerateRoute: RouteGenerator.generateRoute,
    ); //Fin MaterialApp
  } //Fin de Widget
} //Fin Clase derekApp

class PageOne extends StatelessWidget {
  String _params = "hola desde p1";
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  PageOne({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key al a scaffold para acceder al scaffold desde otro widget child
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Primera Pagina derek'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: Container(
          child: MaterialButton(
            child: Text(
              "Siguiente Pagina",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            color: Colors.greenAccent,
            onPressed: () {
              _openSecondPage(context);
            },
          ),
        ),
      ),
    );
  }

  void _openSecondPage(BuildContext context) async {
    String _datoRetornadoDeSecondPage;
    // await para esperar que se regrese dato desde la pantalla que se abre
    await Navigator.of(context)
        .pushNamed(
      "/secondPage",
      arguments: _params,
    )
        .then(
      (response) {
        _datoRetornadoDeSecondPage = response;
      },
    );
    // acceso al scaffold para mostrar snackbar
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(
          "Texto regresado: $_datoRetornadoDeSecondPage",
        ),
      ), //Fin Snack Bar
    ); //Fin _Scaffold key
  } //Fin void
} //Fin Clase Page One