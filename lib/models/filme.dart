import 'package:flutter/material.dart';

class Filme {
  final String titulo;
  final String genero;
  final int ano;
  final double nota;
  final Color cor;
  final String tipo;
  final String classificacao;
  final String sinopse;

  const Filme({
    required this.titulo,
    required this.genero,
    required this.ano,
    required this.nota,
    required this.cor,
    this.tipo = 'Todos',
    this.classificacao = 'livre',
    this.sinopse = '...',
  });
}
