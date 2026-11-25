import 'package:flutter/material.dart';
import 'package:projetostreaming/widgets/botao_principal.dart';
import 'package:projetostreaming/widgets/estilizacao_campos.dart';
import 'package:projetostreaming/widgets/titulo_secao.dart';

class TelaCadastro extends StatelessWidget {
  const TelaCadastro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Criar conta')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TituloSecao(titulo: 'Cadastro'),
              const SizedBox(height: 16),
              const EstilizacaoCampos(rotulo: 'Nome', icone: Icons.person),
              const SizedBox(height: 16),
              const EstilizacaoCampos(
                rotulo: 'Email',
                icone: Icons.email,
                tipoTeclado: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              const EstilizacaoCampos(
                rotulo: 'Senha',
                icone: Icons.lock,
                senha: true,
              ),
              const SizedBox(height: 16),
              const EstilizacaoCampos(
                rotulo: 'Confirmar senha',
                icone: Icons.lock_outline,
                senha: true,
              ),
              const SizedBox(height: 24),
              BotaoPrincipal(
                texto: 'Cadastrar',
                aoPressionar: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
