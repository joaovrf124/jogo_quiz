import 'package:flutter/material.dart';
import 'main.dart';


class Resposta extends StatelessWidget {
  final String textoButtun;
  void Function() responder;
  Resposta(this.textoButtun, this.responder);

  @override
  Widget build(BuildContext context) {
    return 
    Container(width: double.infinity, margin: EdgeInsets.all(10), child: ElevatedButton(onPressed: responder, child: Text(textoButtun)));
  }
}