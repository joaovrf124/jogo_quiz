
import 'package:flutter/material.dart';
import 'package:teste_flutter/questao.dart';
import 'questao.dart';
import 'resposta.dart';

class Questionario extends StatelessWidget {
    final List<Map<String, Object>> perguntas;
    int PerguntaSelecionada;
    final Function(int) responder;
  Questionario({super.key, required this.perguntas,required this.responder,required this.PerguntaSelecionada });


bool get TemPerguntaSelecionada {
  return PerguntaSelecionada < perguntas.length;
}

  @override
  Widget build(BuildContext context) {
        var respostasMap =TemPerguntaSelecionada ? perguntas[PerguntaSelecionada].cast()["resposta"] : [];
        var  respostas = respostasMap.map((e) => Resposta(e["texto"].toString(),(() =>  responder(int.parse(e["nota"].toString())))));
    return  Center(
        child: Column(
          children: [
            Questao(perguntas[PerguntaSelecionada]["texto"].toString()),
            ...respostas    

          ]));
  }
}

    
  