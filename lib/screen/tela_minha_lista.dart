import 'package:flutter/material.dart';
import 'package:projetostreaming/models/lista_favoritos.dart';
import 'package:projetostreaming/widgets/titulo_secao.dart';
import 'package:projetostreaming/widgets/cartao_filme.dart';
import 'package:projetostreaming/models/filme.dart';

class TelaMinhaLista extends StatefulWidget {
  const TelaMinhaLista({super.key});

  @override
  State<TelaMinhaLista> createState() => _TelaMinhaListaState();
}

class _TelaMinhaListaState extends State<TelaMinhaLista> {
  @override
  Widget build(BuildContext context) {
    final favoritos = ListaFavoritos.favoritos;
    return Scaffold(
      appBar: AppBar(title: const Text('Minha lista')),
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TituloSecao(titulo: 'Favoritos Salvos'),
            const SizedBox(height: 12),
            Expanded(
              child: favoritos.isEmpty
                  ? const Center(
                      child: Text(
                        'Nenhum tiutlo na sua lista ainda.',
                        textAlign: TextAlign.center,
                      ),
                    )
                  : GridView.builder(
                      itemCount: favoritos.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.65,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                          ),
                      itemBuilder: (context, index) {
                        return CartaoFilme(filme: favoritos[index]);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
