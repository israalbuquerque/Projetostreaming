import 'package:flutter/material.dart';
import 'package:projetostreaming/screen/tela_login.dart';
import 'package:projetostreaming/widgets/estilizacao_campos.dart';
import 'package:projetostreaming/widgets/titulo_secao.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const TelaLogin(),
    );
  }
}
