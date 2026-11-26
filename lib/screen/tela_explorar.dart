import 'package:flutter/material.dart';
import 'package:projetostreaming/models/filme.dart';
import 'package:projetostreaming/screen/tela_pesquisa.dart';
import 'package:projetostreaming/widgets/botao_principal.dart';
import 'package:projetostreaming/widgets/cartao_filme.dart';
import 'package:projetostreaming/widgets/titulo_secao.dart';

class TelaExplorar extends StatefulWidget {
  const TelaExplorar({super.key});

  @override
  State<TelaExplorar> createState() => _TelaExplorarState();
}

class _TelaExplorarState extends State<TelaExplorar> {
  final TextEditingController _buscarController = TextEditingController();

  String _categoriaSelecionada = 'Todos';

  final List<String> _categorias = [
    'Todos',
    'Ação',
    'Comédia',
    'Terror',
    'Drama',
  ];

  final List<Filme> _catalogo = const [
    Filme(
      titulo: 'Resgate Urbano',
      genero: 'Ação',
      ano: 2025,
      nota: 8.7,
      cor: Colors.red,
      tipo: 'Filme',
    ),

    Filme(
      titulo: 'Riso solto',
      genero: 'Comédia',
      ano: 2024,
      nota: 7.7,
      cor: Colors.amber,
      tipo: 'Série',
    ),
    Filme(
      titulo: 'Sombra na floresta',
      genero: 'Terror',
      ano: 2026,
      nota: 8.2,
      cor: Colors.deepPurple,
      tipo: 'Filme',
    ),
  ];

  List<Filme> get _itensFiltrados {
    final termoBusca = _buscarController.text.trim().toLowerCase();

    return _catalogo.where((item) {
      final bateCategoria =
          _categoriaSelecionada == 'Todos' ||
          item.genero.toLowerCase() == _categoriaSelecionada.toLowerCase();

      final bateBusca =
          termoBusca.isEmpty ||
          item.titulo.toLowerCase().contains(termoBusca) ||
          item.tipo.toLowerCase().contains(termoBusca);

      return bateCategoria && bateBusca;
    }).toList();
  }

  @override
  void dispose() {
    _buscarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final itens = _itensFiltrados;

    return Scaffold(
      appBar: AppBar(title: const Text('Explorar')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // BotaoPrincipal(
            //   texto: 'Pesquisa detalhada',
            //   aoPressionar: () {
            //     Navigator.pushReplacement(
            //       // Troca a tela atual (o login some da pilha)
            //       context,
            //       MaterialPageRoute(builder: (_) => const TelaPesquisa()),
            //     );
            //   },
            // ),
            // 1. Campo de pesquisa visual
            TextField(
              controller: _buscarController,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                hintText: 'Pesquisar filmes, séries ou gênero...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _buscarController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          _buscarController.clear();
                          setState(() {});
                        },
                      )
                    : null,
                filled: true,
                fillColor: Colors.white10,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 2. Categorias de conteúdo
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _categorias.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final categoria = _categorias[index];
                  final ativa = categoria == _categoriaSelecionada;

                  return ChoiceChip(
                    label: Text(categoria),
                    selected: ativa,
                    onSelected: (_) {
                      setState(() {
                        _categoriaSelecionada = categoria;
                      });
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // 3. Catálogo de filmes e séries
            const TituloSecao(titulo: 'Catálogo'),
            const SizedBox(height: 12),

            // 4. Capas organizadas em grade (ou mensagem se vier vazio)
            Expanded(
              child: itens.isEmpty
                  ? const Center(
                      child: Text('Nenhum título encontrado para esse filtro.'),
                    )
                  : GridView.builder(
                      itemCount: itens.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.65,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                          ),
                      itemBuilder: (context, index) {
                        return CartaoFilme(filme: itens[index]);
                      },
                    ),
            ),

            BotaoPrincipal(
              texto: 'Pesquisa detalhada',
              aoPressionar: () {
                Navigator.pushReplacement(
                  // Troca a tela atual (o login some da pilha)
                  context,
                  MaterialPageRoute(builder: (_) => const TelaPesquisa()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
