import 'package:flutter/material.dart';

class BotaoPrincipal extends StatelessWidget {
  final String texto;
  final VoidCallback aoPressionar;
  final bool contorno;

  const BotaoPrincipal({
    super.key,
    required this.texto,
    required this.aoPressionar,
    this.contorno = false,
  });

  @override
  Widget build(BuildContext context) {
    final cor = Theme.of(context).colorScheme;
    final forma = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    );

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: contorno
          ? OutlinedButton(
              onPressed: aoPressionar,
              style: OutlinedButton.styleFrom(shape: forma),
              child: Text(texto),
            )
          : ElevatedButton(
              onPressed: aoPressionar,
              style: ElevatedButton.styleFrom(
                backgroundColor: cor.primary,
                foregroundColor: cor.onPrimary,
                shape: forma,
              ),
              child: Text(texto),
            ),
    );
  }
}
