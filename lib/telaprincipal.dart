import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'drawer.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Lista Dinâmica para armazenamento

  var lista = [];

  var txtMural = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //
    // RECUPERAR OS DADOS
    //
    final Dados obj = ModalRoute.of(context)!.settings.arguments as Dados;

    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[800],
        centerTitle: true,
        title: Text(
          'MURAIS',
          style: TextStyle(
            letterSpacing: 7,
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(30),

        //categoria, no ontap vai para o list view

        child: ListView.builder(
          itemCount: lista.length,
          itemBuilder: (context, index) {
            return Card(
              //
              //Formatando o Card
              //

              color: Colors.grey.shade300,
              shadowColor: Colors.black,
              elevation: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),

              //
              //Aqui é o comando pra mostrar os murais
              //

              child: ListTile(
                title: Text(
                  lista[index],
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(
                    'telaLembrete',
                    arguments: obj,
                  );
                },
                trailing: IconButton(
                  icon: Icon(Icons.delete_outline),
                  onPressed: () {
                    //Remover um item da lista

                    setState(() {
                      lista.removeAt(index);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Mural Removido com Sucesso'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    });
                  },
                ),
              ),
            );
          },
        ),
      ),

      //ADICIONANDO MURAIS

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple[800],
        child: Icon(Icons.add),
        onPressed: () async {
          await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                    'Adicionar Mural',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  content: TextField(
                    controller: txtMural,
                    style: TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(
                        Icons.border_color_sharp,
                        size: 20.0,
                      ),
                      labelText: 'Nome do Mural',
                      labelStyle: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  actions: [
                    TextButton(
                      child: Text('OK'),
                      onPressed: () {
                        setState(() {
                          var msg = '';
                          if (txtMural.text.isNotEmpty) {
                            lista.add(txtMural.text);
                            txtMural.clear();

                            msg = 'Mural adicionado com sucesso!';
                          } else {
                            msg = 'Erro: Adicione o titulo ao mural!!';
                          }
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(msg),
                              duration: Duration(seconds: 2),
                            ),
                          );
                          Navigator.pop(context);
                        });
                      },
                    ),
                    TextButton(
                      child: Text('Cancelar'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              });
        },
      ),
    );
  }
}
