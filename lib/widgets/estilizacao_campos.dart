import 'package:flutter/material.dart';

class EstilizacaoCampos extends StatelessWidget {
  final String rotulo;
  final IconData icone;
  final bool senha;
  final TextInputType tipoTeclado;
  final TextEditingController? controlador;
  final String? Function(String?)? validador;

  const EstilizacaoCampos({
    super.key,
    required this.rotulo,
    required this.icone,
    this.senha = false,
    this.tipoTeclado = TextInputType.text,
    this.controlador,
    this.validador,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controlador,
      obscureText: senha,
      keyboardType: tipoTeclado,
      validator: validador,
      decoration: InputDecoration(
        labelText: rotulo,
        prefixIcon: Icon(icone),
        filled: true,
        fillColor: Colors.white10,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
        ),
      ),
    );
  }
}
