import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  int totalPontos;
  void Function() reiniciarForm;
  Resultado({super.key, required this.totalPontos, required this.reiniciarForm});

  String? get FraseResultado{
    if(totalPontos == 30){
      return "Parabéns!! Você acertou todas.";
    }else if(totalPontos == 20){
      return "Você é bom!! Fez 20 pontos.";
    }else if(totalPontos == 10){
      return "Poderia ter ido melhor meu caro!!";
    }else {
      return "0 pontos!!";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(alignment: Alignment.center, child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text(FraseResultado!), ElevatedButton(onPressed: reiniciarForm, child: Text("Reiniciar"))],
    ));
  }
}