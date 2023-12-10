import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Despesas Pessoais"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.2,
            child: const Card(
              elevation: 5,
              color: Colors.deepPurple,
              child: Text("Grafico"),
            ),
          ),
          const Card(
            color: Colors.amber,
            child: Text("Lista de Tarefas"),
          )
        ],
      ),
    );
  }
}
