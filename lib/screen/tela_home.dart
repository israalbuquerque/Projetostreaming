import 'package:flutter/material.dart'; // Ferramentas do Flutter
import 'package:projetostreaming/models/filme.dart'; // A ficha Filme
import 'package:projetostreaming/screen/tela_Login.dart';
import 'package:projetostreaming/widgets/banner_destaque.dart'; // O banner
import 'package:projetostreaming/widgets/titulo_secao.dart'; // As seções de filmes
import 'package:projetostreaming/screen/tela_explorar.dart';
import 'package:projetostreaming/screen/tela_minha_lista.dart';

class TelaHome extends StatelessWidget {
  // A tela inicial. Sem estado por enquanto
  const TelaHome({super.key}); // Construtor

  @override // Reescreve o build
  Widget build(BuildContext context) {
    // Receita da tela

    // ----- DADOS (antes do return, como na PrevisaoSemana) -----
    const destaque = Filme(
      // O filme do banner
      titulo: 'Noite Eterna',
      genero: 'Suspense',
      ano: 2026,
      nota: 9.1,
      cor: Colors.indigo,
    );

    const lancamentos = [
      // Lista da seção "Lançamentos"
      Filme(
        titulo: 'Horizonte Vermelho',
        genero: 'Ação',
        ano: 2026,
        nota: 7.8,
        cor: Colors.red,
      ),
      Filme(
        titulo: 'Cidade Submersa',
        genero: 'Ficção',
        ano: 2026,
        nota: 8.2,
        cor: Colors.teal,
      ),
      Filme(
        titulo: 'O Último Verão',
        genero: 'Drama',
        ano: 2026,
        nota: 7.5,
        cor: Colors.orange,
      ),
      Filme(
        titulo: 'Código Zero',
        genero: 'Thriller',
        ano: 2026,
        nota: 8.0,
        cor: Colors.purple,
      ),
    ];

    const populares = [
      // Lista da seção "Populares"
      Filme(
        titulo: 'Rei das Sombras',
        genero: 'Fantasia',
        ano: 2024,
        nota: 9.0,
        cor: Colors.deepPurple,
      ),
      Filme(
        titulo: 'Velocidade Máxima',
        genero: 'Ação',
        ano: 2023,
        nota: 8.6,
        cor: Colors.blueGrey,
      ),
      Filme(
        titulo: 'Amor em Paris',
        genero: 'Romance',
        ano: 2025,
        nota: 8.1,
        cor: Colors.pink,
      ),
      Filme(
        titulo: 'A Ilha',
        genero: 'Aventura',
        ano: 2024,
        nota: 8.8,
        cor: Colors.green,
      ),
    ];

    const recomendados = [
      // Lista da seção "Recomendados"
      Filme(
        titulo: 'Mente Brilhante',
        genero: 'Drama',
        ano: 2022,
        nota: 8.7,
        cor: Colors.cyan,
      ),
      Filme(
        titulo: 'Fuga Impossível',
        genero: 'Ação',
        ano: 2025,
        nota: 7.9,
        cor: Colors.brown,
      ),
      Filme(
        titulo: 'Estrelas Cadentes',
        genero: 'Ficção',
        ano: 2026,
        nota: 8.4,
        cor: Colors.blue,
      ),
      Filme(
        titulo: 'Risos e Lágrimas',
        genero: 'Comédia',
        ano: 2023,
        nota: 7.6,
        cor: Colors.amber,
      ),
    ];

    // ----- VISUAL -----
    return Scaffold(
      // Esqueleto da tela
      appBar: AppBar(
        // BARRA SUPERIOR: o logotipo
        title: Row(
          // Ícone e nome lado a lado
          mainAxisSize: MainAxisSize.min, // Row só do tamanho do conteúdo
          children: [
            Icon(
              // Logo
              Icons.play_circle_fill,
              color: Theme.of(context).colorScheme.primary, // Cor do tema
            ),
            const SizedBox(width: 8), // Espaço entre logo e nome
            const Text(
              // Nome da plataforma
              'Meu Stream',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          IconButton(
            tooltip: 'Sair',
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const TelaLogin()),
              );
            },
          ),
        ],
      ),

      body: ListView(
        // CORPO: lista vertical que rola
        padding: const EdgeInsets.all(16), // Margem de 16 px
        children: const [
          // Blocos, de cima para baixo
          BannerDestaque(filme: destaque), // Banner de destaque
          SizedBox(height: 24), // Espaço
          TituloSecao(titulo: 'Lançamentos'), // Seção 1
          TituloSecao(titulo: 'Filmes populares'), // Seção 2
          TituloSecao(titulo: 'Recomendados para você'),
          // Seção 3
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        // MENU INFERIOR
        type: BottomNavigationBarType
            .fixed, // Mostra todos os itens (com 4+ itens é necessário)
        currentIndex: 0, // Item selecionado: o primeiro (índice 0)
        onTap: (indice) {
          if (indice == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TelaExplorar()),
            );
          } else if (indice == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TelaMinhaLista()),
            );
          }
        }, // Ação ao tocar em um item: nada por enquanto
        items: const [
          // Os itens do menu
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ), // Item 0
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ), // Item 1
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Minha lista',
          ), // Item 2
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ), // Item 3
        ],
      ),
    );
  }
}
