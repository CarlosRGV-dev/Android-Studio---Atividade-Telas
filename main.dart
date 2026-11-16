import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'menu.dart';
import 'tela_Adicionar.dart';
import 'tela_consulta.dart';

Future<void> main() async {
  // Garante a inicialização correta dos bindings e do Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Inicialização padrão compatível com os arquivos nativos
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Organizar Frota',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Define o Menu como a primeira tela a ser aberta (sem o const)
      home: Menu(),

      // Rotas nomeadas para navegar facilmente entre as telas do app
      routes: {
        '/adicionar': (context) => TelaAdicionar(),
        '/consulta': (context) => TelaConsulta(),
      },
    );
  }
}