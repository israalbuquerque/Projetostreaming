// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:projetostreaming/screen/tela_home.dart';
import 'package:projetostreaming/widgets/botao_principal.dart';
import 'package:projetostreaming/widgets/estilizacao_campos.dart';
import 'package:projetostreaming/widgets/titulo_secao.dart';
import 'package:projetostreaming/screen/tela_cadastro.dart';

class TelaLogin extends StatelessWidget {
  const TelaLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.play_circle_fill,
                size: 72,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 24),
              const TituloSecao(titulo: 'Entrar'),
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
              const SizedBox(height: 24),
              BotaoPrincipal(
                texto: 'Entrar',
                aoPressionar: () {
                  Navigator.pushReplacement(
                    // Troca a tela atual (o login some da pilha)
                    context,
                    MaterialPageRoute(builder: (_) => const TelaHome()),
                  );
                },
              ),
              const SizedBox(height: 12),
              BotaoPrincipal(
                texto: 'Criar conta',
                aoPressionar: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const TelaCadastro()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
