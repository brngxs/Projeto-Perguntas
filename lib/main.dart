import 'package:flutter/material.dart';
import 'package:projeto_perguntas/resposta.dart';
import './questao.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco'],
    },
    {
      'texto': 'Qual é seu animal favorito?',
      'respostas': ['Coelho', 'Pato', 'Cachorro', 'Gato'],
    },
    {
      'texto': 'Qual é seu jogo favorito?',
      'respostas': ['GTA', 'CS', 'FIFA', 'RDR2'],
    },
  ];

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas =
        temPerguntaSelecionada
            ? _perguntas[_perguntaSelecionada].cast()['respostas']
            : [];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Perguntas'), centerTitle: true),
        body:
            temPerguntaSelecionada
                ? Column(
                  children: <Widget>[
                    Questao(
                      _perguntas[_perguntaSelecionada]['texto'].toString(),
                    ),
                    ...respostas.map((t) => Resposta(t, _responder)).toList(),
                  ],
                )
                : Center(
                  child: Text('Parabéns!', style: TextStyle(fontSize: 28)),
                ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
