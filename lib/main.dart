import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(title: "Contador de pessoas", home: Home())); //Material App
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _pessoa = 0;
  String _mensagem = "Pode entrar!";

  void _changePeople(int delta) {
    setState(() {
      _pessoa += delta;
      if (_pessoa >= 20) {
        _mensagem = "Lotado, não pode entrar.";
        _pessoa = 20;
      } else if (_pessoa < 20 && _pessoa >= 0) {
        _mensagem = "Pode entrar!";
      } else {
        _pessoa = 0;
      }
    });
  }

  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: Container(
            decoration: const BoxDecoration(
                color: Colors.deepOrangeAccent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(80.0),
                  topRight: Radius.circular(80.0),
                  bottomLeft: Radius.circular(80.0),
                  bottomRight: Radius.circular(80.0),
                )),
            margin: const EdgeInsets.fromLTRB(10, 100, 10, 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Pessoas: $_pessoa",
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.normal),
                ), //text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        child: const Text(
                          "+1",
                          style: TextStyle(fontSize: 40.0, color: Colors.white),
                        ),
                        onPressed: () {
                          _changePeople(1);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        child: const Text(
                          "-1",
                          style: TextStyle(fontSize: 40.0, color: Colors.white),
                        ),
                        onPressed: () {
                          _changePeople(-1);
                        },
                      ),
                    ),
                  ],
                ),
                Text(
                  _mensagem,
                  style: const TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 30),
                ) //text
              ], //widget
            )) //Column,
        );
  }
}
