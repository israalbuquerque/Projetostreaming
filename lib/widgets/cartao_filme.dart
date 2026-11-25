import 'package:flutter/material.dart';
import 'package:projetostreaming/models/filme.dart';

class CartaoFilme extends StatelessWidget {
  final Filme filme;
  const CartaoFilme({super.key, required this.filme});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              color: filme.cor,
              borderRadius: BorderRadius.circular(12),
            ),

            child: const Center(
              child: Icon(Icons.movie, size: 40, color: Colors.white54),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            filme.titulo,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            '${filme.genero} - ${filme.nota}',
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
