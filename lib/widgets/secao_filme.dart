import 'package:flutter/material.dart';
import 'package:projetostreaming/models/filme.dart';
import 'package:projetostreaming/widgets/cartao_filme.dart';
import 'package:projetostreaming/widgets/titulo_secao.dart';

class SecaoFilmes extends StatelessWidget {
  final String titulo;
  final List<Filme> filmes;

  const SecaoFilmes({super.key, required this.titulo, required this.filmes});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TituloSecao(titulo: titulo),
        const SizedBox(height: 12),
        SizedBox(
          height: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: filmes
                .map(
                  (filme) => Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: CartaoFilme(filme: filme),
                  ),
                )
                .toList(),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
