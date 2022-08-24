import 'package:flutter/material.dart';
import 'package:test_flutter/screens/home.dart';
import 'package:test_flutter/screens/login.dart';


/*
* Método main de uma aplicação Dart, ele é chamado assim que a aplicação é executada.
* */
void main() {
  runApp(const MyApp());
}


/* Classe responsável por instânciar o projeto Flutter*/
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //o mateiralApp é o widget principal do flutter, ele é responsável por criar a estrutura da aplicação
    return MaterialApp(
      //gerenciador de rotas, ele é composto por um dicionário <String, Object>
      routes: {
        '/home': (context) => const HomePage(),
      },
      //título da aplicação
      title: 'Test',
      //cor principal da aplicação
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}