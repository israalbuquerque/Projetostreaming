import 'package:flutter/material.dart';
import 'package:projetostreaming/models/filme.dart';

class ListaFavoritos {
  static final List<Filme> favoritos = [];

  static bool contem(Filme filme) {
    return favoritos.any((item) => item.titulo == filme.titulo);
  }

  static void alterar(Filme filme) {
    if (contem(filme)) {
      favoritos.removeWhere((item) => item.titulo == filme.titulo);
    } else {
      favoritos.add(filme);
    }
  }
}
