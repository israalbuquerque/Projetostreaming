import 'package:flutter/material.dart'; // Ferramentas do Flutter
import 'package:projetostreaming/models/filme.dart'; // A ficha Filme
import 'package:projetostreaming/screen/tela_detalhes.dart'; // NOVO: a tela que o toque vai abrir

class BannerDestaque extends StatelessWidget {
  // Banner do filme em destaque
  final Filme filme; // Guarda a ficha recebida

  const BannerDestaque({
    super.key,
    required this.filme,
  }); // Construtor: exige uma ficha

  @override // Reescreve o build
  Widget build(BuildContext context) {
    // Receita visual
    return GestureDetector(
      // NOVO: fica POR FORA de tudo e detecta o toque
      onTap: () {
        // Ao tocar no banner:
        Navigator.push(
          // Abre uma tela por cima
          context,
          MaterialPageRoute(
            builder: (_) => TelaDetalhes(
              filme: filme,
            ), // A tela de detalhes, entregando este filme
          ),
        );
      },
      child: ClipRRect(
        // O que já existia agora é FILHO do GestureDetector
        borderRadius: BorderRadius.circular(16), // Cantos arredondados
        child: SizedBox(
          // Caixa de tamanho fixo
          height: 220, // Altura de 220 px
          child: Stack(
            // Camadas sobrepostas
            children: [
              // CAMADA 1: fundo colorido
              Positioned.fill(
                // Ocupa o Stack inteiro
                child: Container(
                  color: filme.cor, // Cor da ficha
                  child: const Center(
                    child: Icon(
                      Icons.movie,
                      size: 64,
                      color: Colors.white24,
                    ), // Ícone discreto
                  ),
                ),
              ),

              // CAMADA 2: degradê escuro
              Positioned.fill(
                // Ocupa o Stack inteiro
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      // Degradê
                      begin: Alignment.topCenter, // De cima...
                      end: Alignment.bottomCenter, // ...até embaixo
                      colors: [
                        Colors.transparent,
                        Colors.black87,
                      ], // Transparente para quase preto
                    ),
                  ),
                ),
              ),

              // CAMADA 3: textos e botão
              Positioned(
                // Canto inferior esquerdo
                left: 16,
                bottom: 16,
                right: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      filme.titulo, // Título da ficha
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '${filme.genero} - ${filme.ano} - ${filme.nota}', // Resumo
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 8), // Espaço
                    ElevatedButton.icon(
                      onPressed: () {}, // Ação: nada por enquanto
                      icon: const Icon(Icons.play_arrow), // Ícone de play
                      label: const Text(
                        'Assistir',
                      ), // Corrigi: estava "Assitir"
                    ),
                  ],
                ),
              ),
            ], // Fecha o children do Stack
          ), // Fecha o Stack
        ), // Fecha o SizedBox
      ), // Fecha o ClipRRect
    ); // Fecha o GestureDetector (com ;)
  } // Fecha o build
} // Fecha a classe
