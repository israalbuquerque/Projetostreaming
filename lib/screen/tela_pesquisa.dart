import 'package:flutter/material.dart';
import 'package:projetostreaming/widgets/botao_principal.dart';

class TelaPesquisa extends StatelessWidget {
  const TelaPesquisa({super.key});

  final _resultadosFixos = const [
    {
      'titulo': 'Interestelar',
      'detalhes': '2014 • Ficção Científica • 2h 49m',
      'capa': 'https://image.tmdb.org/t/p/w500/nCbkOyOMTEwlEV0LtCOvCnwEONA.jpg',
    },
    {
      'titulo': 'Stranger Things',
      'detalhes': '2016 • Série • 4 Temporadas',
      'capa': 'https://image.tmdb.org/t/p/w500/49WJfeN0moxb9IPfGn8AIqMGskD.jpg',
    },
    {
      'titulo': 'Oppenheimer',
      'detalhes': '2023 • Drama / História • 3h 00m',
      'capa': 'https://image.tmdb.org/t/p/w500/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg',
    },
    {
      'titulo': 'The Last of Us',
      'detalhes': '2023 • Série • Drama / Ação',
      'capa': 'https://image.tmdb.org/t/p/w500/uKvVjHNqB5VmOrdxqAt2F7J78ED.jpg',
    },
    {
      'titulo': 'Homem-Aranha: Através do Aranhaverso',
      'detalhes': '2023 • Animação / Ação • 2h 20m',
      'capa': 'https://image.tmdb.org/t/p/w500/8Vt6mWEReuy4Of61Lnj5Xj704m8.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        elevation: 0,
        title: const Text(
          'Buscar',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            // 1. Campo de pesquisa (ainda não funcional)

            TextField(
              readOnly:
                  true, // Impede digitação já que é apenas visual/estático
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Buscar filmes, séries ou gêneros...',
                hintStyle: TextStyle(color: Colors.grey[500]),
                prefixIcon: const Icon(Icons.search, color: Colors.white70),
                suffixIcon: const Icon(Icons.mic_none, color: Colors.white54),
                filled: true,
                fillColor: const Color(0xFF262626),
                contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Título da seção de resultados estáticos
            const Text(
              'Principais buscas',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            // 2 e 3. Lista de resultados e capas (placeholder fixo)
            Expanded(
              child: ListView.separated(
                itemCount: _resultadosFixos.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final item = _resultadosFixos[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E1E1E),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        // Capa do filme ou série
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          child: Image.network(
                            item['capa']!,
                            width: 75,
                            height: 105,
                            fit: BoxFit.cover,
                            // Fallback caso o emulador esteja sem internet
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 75,
                                height: 105,
                                color: Colors.grey[800],
                                child: const Icon(
                                  Icons.movie_outlined,
                                  color: Colors.white54,
                                  size: 32,
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 14),
                        // Título e detalhes
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['titulo']!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 6),
                              Text(
                                item['detalhes']!,
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Ícone de ação visual
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.play_circle_outline,
                            color: Colors.white70,
                            size: 30,
                          ),
                        ),
                        const SizedBox(width: 4),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
