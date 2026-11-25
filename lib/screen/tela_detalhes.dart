import 'package:flutter/material.dart'; // Ferramentas do Flutter
import 'package:projetostreaming/models/filme.dart'; // A ficha Filme
import 'package:projetostreaming/widgets/botao_principal.dart';
import 'package:projetostreaming/widgets/botao_principal.dart'; // Nosso botão

class TelaDetalhes extends StatelessWidget {
  // A tela de detalhes. Sem estado por enquanto
  final Filme filme; // Guarda o filme recebido

  const TelaDetalhes({
    super.key,
    required this.filme,
  }); // Construtor: exige um filme

  @override // Reescreve o build
  Widget build(BuildContext context) {
    // Receita da tela
    return Scaffold(
      // Esqueleto da tela (sem AppBar: o botão voltar vai sobre a imagem)
      body: SingleChildScrollView(
        // Corpo que ROLA se o conteúdo for longo
        child: Column(
          // Imagem e informações, uma embaixo da outra
          crossAxisAlignment:
              CrossAxisAlignment.start, // Alinha tudo à esquerda
          children: [
            // ===== BLOCO 1: imagem de destaque + botão voltar =====
            SizedBox(
              // Caixa de altura fixa para a capa
              height: 320, // Altura de 320 px
              child: Stack(
                // Camadas sobrepostas
                children: [
                  Positioned.fill(
                    // CAMADA 1: ocupa o Stack inteiro
                    child: Container(
                      color: filme.cor, // Cor do filme (no lugar da imagem)
                      child: const Center(
                        child: Icon(
                          Icons.movie,
                          size: 96,
                          color: Colors.white24,
                        ), // Ícone discreto de fundo
                      ),
                    ),
                  ),
                  Positioned.fill(
                    // CAMADA 2: degradê para fundir com o resto da tela
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          // Degradê vertical
                          begin: Alignment.topCenter, // De cima...
                          end: Alignment.bottomCenter, // ...até embaixo
                          colors: [
                            Colors.transparent, // Em cima: transparente
                            Theme.of(context).scaffoldBackgroundColor, // Embaixo: a cor de fundo da tela (emenda sem corte)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // CAMADA 3: botão de voltar, canto superior esquerdo
                    top: 0, // Colado no topo
                    left: 0, // Colado à esquerda
                    child: SafeArea(
                      // Respeita a barra de status e o "notch" do celular
                      child: Padding(
                        padding: const EdgeInsets.all(8), // Espaço de 8 px
                        child: CircleAvatar(
                          // Círculo de fundo do botão
                          backgroundColor:
                              Colors.black45, // Preto meio transparente
                          child: IconButton(
                            // Botão de ícone
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ), // Seta para trás
                            onPressed: () {
                              // Ao tocar:
                              Navigator.pop(
                                context,
                              ); // Remove esta tela da pilha e volta à anterior
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ===== BLOCO 2: informações =====
            Padding(
              // Margem lateral para o texto
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ), // 16 px dos lados esquerdo e direito
              child: Column(
                // Informações empilhadas
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Alinha à esquerda
                children: [
                  Text(
                    filme.titulo, // NOME do conteúdo
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ), // Grande e negrito
                  ),
                  const SizedBox(height: 8), // Espaço
                  Row(
                    // Estrela e nota lado a lado
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 20,
                      ), // Estrela dourada
                      const SizedBox(width: 4), // Espaço pequeno
                      Text('${filme.nota}'), // Nota da ficha
                    ],
                  ),
                  const SizedBox(height: 12), // Espaço
                  Wrap(
                    // Etiquetas lado a lado; quebra de linha se faltar espaço
                    spacing: 8, // Espaço HORIZONTAL entre etiquetas
                    runSpacing: 8, // Espaço VERTICAL entre linhas
                    children: [
                      Chip(
                        // Etiqueta do ANO
                        avatar: const Icon(
                          Icons.calendar_today,
                          size: 16,
                        ), // Ícone dentro da etiqueta
                        label: Text('${filme.ano}'), // Ano de lançamento
                      ),
                      Chip(
                        // Etiqueta do GÊNERO
                        avatar: const Icon(Icons.theaters, size: 16),
                        label: Text(filme.genero), // Gênero da ficha
                      ),
                      Chip(
                        // Etiqueta da CLASSIFICAÇÃO
                        avatar: const Icon(Icons.shield, size: 16),
                        label: Text(
                          'Classificação: ${filme.classificacao}',
                        ), // Ex.: "Classificação: 16"
                      ),
                    ],
                  ),
                  const SizedBox(height: 24), // Espaço maior
                  const Text(
                    // Título da sinopse
                    'Sinopse',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8), // Espaço
                  Text(
                    filme.sinopse, // SINOPSE da ficha
                    style: const TextStyle(fontSize: 15, height: 1.5), // height: 1.5 = mais espaço entre as linhas (leitura melhor)
                  ),
                  const SizedBox(height: 24), // Espaço antes dos botões
                  // ===== BLOCO 3: botões =====
                  BotaoPrincipal(
                    // Botão preenchido: Assistir
                    texto: 'Assistir',
                    aoPressionar: () {
                      // Ação ao tocar:
                      ScaffoldMessenger.of(context).showSnackBar(
                        // Mostra uma mensagem rápida na base da tela
                        SnackBar(
                          content: Text('Reproduzindo ${filme.titulo}...'),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 12), // Espaço entre os botões
                  BotaoPrincipal(
                    // Botão de contorno: Minha lista
                    texto: 'Adicionar à minha lista',
                    contorno: true, // Estilo só com borda
                    aoPressionar: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '${filme.titulo} adicionado à sua lista',
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 32), // Espaço final, para o último botão não colar no fim da tela
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
