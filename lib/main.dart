
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_murallembrete/ajuda.dart';
import 'package:projeto_murallembrete/config.dart';
import 'package:projeto_murallembrete/sobre.dart';
import 'package:projeto_murallembrete/telaprincipal.dart';
import 'lembrete.dart';
import 'login.dart';
import 'registro.dart';
import 'ajuda.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepPurple[800],
      ),
      debugShowCheckedModeBanner: false,
      title: 'Mural',
      initialRoute: 'login',
      routes: {
        'login': (context) => Login(),
        'registro': (context) => Registro(),
        'sobre': (context) => Sobre(),
        'telaPrincipal': (context) => HomePage(),
        'telaLembrete': (context) => Lembretes(),
        'telaAjuda': (context) => Ajuda(),
        'telaconfig': (context) => Configuracoes(),
      },
    ),
  );
}

class Dados {
  final String usuario;
  final String senha;
  final String email;
  Dados(this.usuario, this.senha, this.email);
}

class Mural {
  final String nome;
  Mural(this.nome);
}
