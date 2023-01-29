import 'package:flutter/material.dart';
import 'package:teste_flutter/questao.dart';
import 'package:teste_flutter/resposta.dart';
import 'package:teste_flutter/resultado.dart';
import 'questionario.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var PerguntaSelecionada = 0;
  var pontuacaoTotal = 0;

final List<Map<String, Object>> perguntas = [
  {"texto": "Que ano o Brasil ganhou a primeira copa?", 
  "resposta": [{"texto": "1958", "nota": 10}, {"texto": "1954", "nota": 0},{"texto": "1950", "nota": 0},{"texto":"1962", "nota": 0}]},
  {"texto": "Quem descobriu o Brasil?", 
  "resposta": [{"texto":"Pedro Alvares Cabral", "nota": 10}, {"texto": "Cristovão Colombo", "nota": 0},{"texto":"Lula", "nota": 0},{"texto": "Pelé", "nota": 0}]},
  {"texto":"Em que ano as torres gêmeas caiu?", 
  "resposta": [{"texto":"2007", "nota": 0}, {"texto":"2003", "nota": 0},{"texto":"2001", "nota": 10},{"texto":"2000", "nota": 0}]}
];

void responder(int pontuacao){
  setState(() {
    PerguntaSelecionada++;
    pontuacaoTotal += pontuacao;
  });
}

void reiniciarFormulario(){
  setState(() {
    PerguntaSelecionada = 0;
    pontuacaoTotal = 0;
  });
}

bool get TemPerguntaSelecionada {
  return PerguntaSelecionada < perguntas.length;
}


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Perguntas"),
      ),
      body: TemPerguntaSelecionada ?  Questionario(perguntas: perguntas, responder: responder, PerguntaSelecionada: PerguntaSelecionada,)
         : Resultado(totalPontos: pontuacaoTotal, reiniciarForm: reiniciarFormulario,), 
         );
  }
}
